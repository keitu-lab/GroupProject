using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class admin_report2 : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as Site1;

            var type = Convert.ToChar(Session["type"]);

            if (type == 'C')
            {
                master.getSign.Visible = false;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
            }
            else if (type == 'M')
            {
                master.getSign.Visible = false;
                master.getReport.Visible = true;
                master.getOrder.Visible = true;
                master.getPro.Visible = true;
                master.GetCart.Visible = false;
                master.getOut.Visible = true;
            }
            else
            {
                master.getSign.Visible = false;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
            }

            if (!IsPostBack)
            {
                // Initial load with no filter (or default filter)
                //FilterType = "week";  // optional: default filter

               // LoadDashboardMetrics();
                LoadSalesTrend30Days();
                LoadRegisteredUsersToday();
                LoadProductsList();

            }
            LoadSalesTrend30Days();
            //LoadChart();

            //LoadTopProducts();
            //LoadDashboard3();
            // LoadCategoryPerformance();
            //LoadChart();

        }

        private void LoadTopProducts(string filter)
        {
            var client = new Service2Client(); // Your WCF client

            DateTime today = DateTime.Today;
            DateTime startDate;

            // Determine start date based on filter
            switch (filter.ToLower())
            {
                case "week":
                    startDate = today.AddDays(-6); // last 7 days
                    break;
                case "month":
                    startDate = new DateTime(today.Year, today.Month, 1);
                    break;
                case "year":
                    startDate = new DateTime(today.Year, 1, 1);
                    break;
                default:
                    startDate = today.AddDays(-6);
                    break;
            }

            // Get all invoices (0 = all customers)
            List<Invoice> allInvoices = client.getAllInvoices().ToList();

            // Filter invoices by startDate
            var filteredInvoices = allInvoices
                .Where(inv => inv.Invoice_Created_Date.Date >= startDate.Date)
                .ToList();

            // Aggregate product sales
            var productSales = new Dictionary<int, dynamic>();

            foreach (var inv in filteredInvoices)
            {
                List<Invoiceline> lines = client.getIvoiceLineItems(7).ToList();

                foreach (var line in lines)
                {
                    if (line?.Product_ID == null) continue;

                    int prodId = line.Product_ID.Value;
                    Product p = client.getProduct(prodId);
                    if (p == null) continue;

                    int qty = line.Invoiceline_Quantity ?? 0;
                    decimal revenue = qty * p.Product_Price;

                    if (!productSales.ContainsKey(prodId))
                    {
                        productSales[prodId] = new
                        {
                            Product_Name = p.Product_Name,
                            QuantitySold = qty,
                            Revenue = revenue
                        };
                    }
                    else
                    {
                        var existing = productSales[prodId];
                        productSales[prodId] = new
                        {
                            Product_Name = existing.Product_Name,
                            QuantitySold = existing.QuantitySold + qty,
                            Revenue = existing.Revenue + revenue
                        };
                    }
                }
            }

            // Sort by QuantitySold descending
            var topProducts = productSales.Values
                .OrderByDescending(p => p.QuantitySold)
                .ToList();

            // Bind to repeater
            rptTopProducts.DataSource = topProducts;
            rptTopProducts.DataBind();
        }

        protected string SalesLabelsJson = "[]";
        protected string SalesValuesJson = "[]";

        private void LoadSalesTrend30Days()
        {
            var client = new Service2Client();

            // Step 1: Prepare date range
            DateTime today = DateTime.Today;
            DateTime startDate = today.AddDays(-29); // last 30 days including today

            // Step 2: Fetch all products once
            var allProducts = client.getAllProducts();
            var productsDict = allProducts.ToDictionary(p => p.Product_ID, p => p);

            // Step 3: Fetch all invoices (for performance, ideally server-side filter by date)
            var allInvoices = client.getAllInvoices(); // assuming 0 fetches all invoices
            var invoicesLast30Days = allInvoices
                .Where(inv => inv.Invoice_Created_Date.Date >= startDate && inv.Invoice_Created_Date.Date <= today)
                .ToList();

            // Step 4: Fetch all invoicelines for these invoices
            //var allInvoiceLines = invoicesLast30Days
            //    .SelectMany(inv => client.getIvoiceLineItems(7))
            //    .ToList();

            var allInvoiceLines = client.getAllInvoiceLineItems().ToList();

            double totalAmount = 0;
            foreach(Invoiceline i in allInvoiceLines)
            {
                totalAmount += Convert.ToDouble(i.Invoiceline_Quantity * client.getProduct(Convert.ToInt32(i.Product_ID)).Product_Price);
            }
            lblTotalRevenue.Text = totalAmount.ToString("C");


            // Step 5: Compute total sales per day
            var salesByDay = Enumerable.Range(0, 30)
                .Select(i => startDate.AddDays(i))
                .ToDictionary(
                    day => day,
                    day => allInvoiceLines
                        .Where(line => invoicesLast30Days.Any(inv => inv.Invoice_ID == line.Invoice_ID &&
                                                                      inv.Invoice_Created_Date.Date == day))
                        .Sum(line =>
                        {
                            if (!line.Product_ID.HasValue) return 0m;
                            return (line.Invoiceline_Quantity ?? 0) * productsDict[line.Product_ID.Value].Product_Price;
                        })
                );

            // Step 6: Serialize labels and values for Chart.js
            var labels = salesByDay.Keys.Select(d => d.ToString("dd MMM")).ToList();
            var values = salesByDay.Values.ToList();

            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            SalesLabelsJson = serializer.Serialize(labels);
            SalesValuesJson = serializer.Serialize(values);

            // Step 7: Update metrics
           // lblTotalRevenue.Text = values.Sum().ToString("C");
           // lblTotalOrders.Text = invoicesLast30Days.Count.ToString();

            int pendingOrders = client.getOrders().Count(o => o.Order_Delivery_Status.Equals("Pending"));
            lblPendingOrders.Text = pendingOrders.ToString();

            lblAveOrder.InnerText = invoicesLast30Days.Count > 0
                ? (values.Sum() / invoicesLast30Days.Count).ToString("C")
                : "R0.00";
        }


        private void LoadDashboardMetrics()
        {
            var client = new Service2Client();

            // 1. Fetch all orders
            List<Order> allOrders = client.getOrders().ToList();

            // Total Orders
            int totalOrders = allOrders.Count();
            lblTotalOrders.Text = totalOrders.ToString();

            decimal totalRevenue = 0m;
            int pendingOrders = 0;

            // 2. Loop through each order to calculate revenue and pending count
            foreach (var order in allOrders)
            {
                // Check order status
                if (order.Order_Delivery_Status != null && order.Order_Delivery_Status.Equals("Pending", StringComparison.OrdinalIgnoreCase))
                {
                    pendingOrders++;
                }

                // Get invoice for the order
                Invoice inv = client.getInvoice(order.Invoice_ID);
                if (inv == null) continue;

                // Get all invoicelines for this invoice
                List<Invoiceline> lines = client.getIvoiceLineItems(inv.Invoice_ID).ToList();

                foreach (var line in lines)
                {
                    if (line?.Product_ID == null) continue;

                    Product p = client.getProduct(line.Product_ID.Value);
                    if (p == null) continue;

                    int qty = line.Invoiceline_Quantity ?? 0;
                    totalRevenue += qty * p.Product_Price;
                }
            }

            // Set Total Revenue
            //lblTotalRevenue.Text = totalRevenue.ToString("C");

            // Set Pending Orders
            lblPendingOrders.Text = pendingOrders.ToString();

            // Average Order Value
            decimal avgOrderValue = totalOrders > 0 ? totalRevenue / totalOrders : 0;
            lblAveOrder.InnerText = avgOrderValue.ToString("C");
        }



        //private void LoadDashboard3()
        //{
        //    var client = new Service2Client();

        //    var labels = new List<string>();
        //    var values = new List<decimal>();

        //    DateTime today = DateTime.Today;
        //    DateTime startDate = today.AddDays(-29); // Last 30 days including today

        //    decimal totalRevenue = 0;

        //    // Get all invoices from WCF service
        //    List<Invoice> invoices = new List<Invoice>();
        //    foreach (var order in client.getOrders())
        //    {
        //        Invoice inv = client.getInvoice(order.Invoice_ID);
        //        if (inv != null)
        //            invoices.Add(inv);
        //    }

        //    // Loop through last 30 days
        //    for (int i = 0; i < 30; i++)
        //    {
        //        DateTime currentDate = startDate.AddDays(i);
        //        labels.Add(currentDate.ToString("dd MMM")); // e.g. "24 Sep"

        //        decimal dailyRevenue = 0m;


        //        // Filter invoices by date
        //        var invoicesToday = invoices
        //            .Where(inv => inv.Invoice_Created_Date.Date.Equals(currentDate))
        //            .ToList();

        //        foreach (var inv in invoicesToday)
        //        {
        //            var lines = client.getIvoiceLineItems(inv.Invoice_ID).ToList();

        //            foreach (var line in lines)
        //            {
        //                if (line == null || !line.Product_ID.HasValue) continue;

        //                Product p = client.getProduct(line.Product_ID.Value);
        //                if (p == null) continue;

        //                int qty = line.Invoiceline_Quantity ?? 0;
        //                decimal price = p.Product_Price;

        //                dailyRevenue += price * qty;
        //            }
        //        }

        //        values.Add(dailyRevenue);
        //        totalRevenue += dailyRevenue;
        //    }

        //    lblTotalRevenue.Text = totalRevenue.ToString("C");

        //    lblTotalOrders.Text = invoices.Count.ToString();

        //    lblAveOrder.InnerText = invoices.Count > 0
        //        ? (totalRevenue / invoices.Count).ToString("C")
        //        : "R0.00";

        //    // Pending orders (if needed)
        //    int pendingOrders = client.getOrders()
        //        .Count(o => o.Order_Delivery_Status.Equals("Pending", StringComparison.OrdinalIgnoreCase));
        //    lblPendingOrders.Text = pendingOrders.ToString();

        //    // Serialize to JSON for Chart.js
        //    var serializer = new JavaScriptSerializer();
        //    SalesLabelsJson = serializer.Serialize(labels);
        //    SalesValuesJson = serializer.Serialize(values);
        //}


        ////protected void Page_Load(object sender, EventArgs e)
        ////{
        ////    var master = Master as Site1;

        ////    var type = Convert.ToChar(Session["type"]);

        ////    if (type == 'C')
        ////    {
        ////        master.getSign.Visible = false;
        ////        master.getReport.Visible = false;
        ////        master.getOrder.Visible = false;
        ////        master.getPro.Visible = false;
        ////    }
        ////    else if (type == 'M')
        ////    {
        ////        master.getSign.Visible = false;
        ////        master.getReport.Visible = true;
        ////        master.getOrder.Visible = true;
        ////        master.getPro.Visible = true;
        ////        master.GetCart.Visible = false;

        ////    }
        ////    else
        ////    {
        ////        master.getSign.Visible = false;
        ////        master.getReport.Visible = false;
        ////        master.getOrder.Visible = false;
        ////        master.getPro.Visible = false;
        ////    }

        ////    LoadTopProducts();
        ////LoadDashboard();
        ////LoadCategoryPerformance();

        ////}
        ////protected string SalesLabelsJson = "[]";
        ////protected string SalesValuesJson = "[]";

        ////protected void Page_Load(object sender, EventArgs e)
        ////{

        ////    //if (!IsPostBack)
        ////   // {
        ////        LoadTopProducts();
        ////        LoadDashboard();
        ////        LoadCategoryPerformance();
        ////    var master = Master as Site1;

        ////    var type = Convert.ToChar(Session["type"]);

        ////    if (type == 'C')
        ////    {
        ////        master.getSign.Visible = false;
        ////        master.getReport.Visible = false;
        ////        master.getOrder.Visible = false;
        ////        master.getPro.Visible = false;
        ////    }
        ////    else if (type == 'M')
        ////    {
        ////        master.getSign.Visible = false;
        ////        master.getReport.Visible = true;
        ////        master.getOrder.Visible = true;
        ////        master.getPro.Visible = true;
        ////        master.GetCart.Visible = false;
        ////    }
        ////    else
        ////    {
        ////        master.getSign.Visible = false;
        ////        master.getReport.Visible = false;
        ////        master.getOrder.Visible = false;
        ////        master.getPro.Visible = false;
        ////    }

        ////}


        //private void LoadCategoryPerformance()
        //{
        //    try
        //    {
        //        var client = new Service2Client();

        //        // Step 1: Get all orders
        //        var orders = client.getOrders().ToList();

        //        // Step 2: Get invoices for these orders
        //        var invoices = orders
        //            .Select(o => client.getInvoice(o.Invoice_ID))
        //            .Where(i => i != null)
        //            .ToList();

        //        // Step 3: Dictionary to hold Category → Revenue
        //        var categoryStats = new Dictionary<string, decimal>();

        //        foreach (var invoice in invoices)
        //        {
        //            var items = client.getIvoiceLineItems(invoice.Invoice_ID);
        //            foreach (var item in items)
        //            {
        //                var product = client.getProduct((int)item.Product_ID);
        //                if (product == null) continue;

        //                // 🔹 Use Category_ID to fetch category
        //                string categoryName = "Uncategorized";
        //                if (product.Category_ID.HasValue)
        //                {
        //                    var category = client.getCategory(product.Category_ID.Value);
        //                    if (category != null)
        //                    {
        //                        categoryName = category.Category_Name;
        //                    }
        //                }

        //                int quantity = item.Invoiceline_Quantity ?? 0;
        //                decimal revenue = product.Product_Price * quantity;

        //                if (categoryStats.ContainsKey(categoryName))
        //                {
        //                    categoryStats[categoryName] += revenue;
        //                }
        //                else
        //                {
        //                    categoryStats[categoryName] = revenue;
        //                }
        //            }
        //        }

        //        // Step 4: Compute total revenue for percentage calculation
        //        decimal totalRevenue = categoryStats.Values.Sum();

        //        var categoryPerformance = categoryStats
        //            .Select(c => new
        //            {
        //                CategoryName = c.Key,
        //                Percentage = totalRevenue > 0 ? Math.Round((c.Value / totalRevenue) * 100, 2) : 0
        //            })
        //            .OrderByDescending(c => c.Percentage)
        //            .ToList();

        //        // Step 5: Bind to Repeater
        //       // rptCategoryPerformance.DataSource = categoryPerformance;
        //       // rptCategoryPerformance.DataBind();
        //    }
        //    catch (Exception)
        //    {
        //        //rptCategoryPerformance.DataSource = new List<object>
        //        //{
        //        //    new { CategoryName = "Error loading categories", Percentage = 0 }
        //        //};
        //        //rptCategoryPerformance.DataBind();
        //    }
        //}

        private void LoadRegisteredUsersToday()
        {
            Service2Client client = new Service2Client();
            var allUsers = client.getUsers().ToList(); // must be populated
            DateTime today = DateTime.Today.Date;
            int numUsers = 0;

            foreach (User u in allUsers)
            {
                if (u.User_Acc_Creation_Date.Equals(today))
                {
                    numUsers += 1;
                }
            }
            UsersTodayLiteral.Text = numUsers.ToString();
        }


        // Load product list with quantities
        private void LoadProductsList()
        {
            try
            {
                Service2Client client = new Service2Client();
                List<Product> products = client.getAllProducts().ToList();

                List<Order> orders = client.getOrders().ToList();
                lblTotalOrders.Text = Convert.ToString(orders.Count);

                //double totalAmount = 0;
                //List<Invoice> invoices = client.getAllInvoices().ToList(); 
                //foreach (Invoice i in invoices)
                //{
                //    int invoiceID = i.Invoice_ID;
                    
                //    List<Invoiceline> invoiceLines = client.getIvoiceLineItems(invoiceID).ToList();

                //    if(invoiceLines != null)
                //    {
                //        foreach (Invoiceline line in invoiceLines)
                //        {
                //            Product product = client.getProduct(Convert.ToInt32(line.Product_ID));
                //            totalAmount += (double)(product.Product_Price * line.Invoiceline_Quantity);

                //        }
                //    }
                    
                //}

               // lblTotalRevenue.Text = totalAmount.ToString("C");
                // Bind to the repeater
                rptProducts.DataSource = products;
                rptProducts.DataBind();
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error loading products: " + ex.Message);
            }
        }

        //private void LoadChart()
        //{
        //    var client = new Service2Client();

        //    var labels = new List<string>();   // Day labels (x-axis)
        //    var values = new List<decimal>();  // Daily revenue

        //    DateTime today = DateTime.Today;
        //    DateTime startDate = today.AddDays(-29); // Last 30 days including today

        //    decimal totalRevenue = 0m;

        //    // Get all orders from WCF service
        //    List<Order> orders = client.getOrders().ToList();

        //    // Pre-load invoices and products once for efficiency (optional)
        //    Dictionary<int, Invoice> invoiceCache = new Dictionary<int, Invoice>();
        //    Dictionary<int, Product> productCache = new Dictionary<int, Product>();

        //    lblTotalOrders.Text = orders.Count.ToString();

        //    for (int i = 0; i < 30; i++)
        //    {
        //        DateTime currentDay = startDate.AddDays(i);
        //        labels.Add(currentDay.ToString("dd MMM")); // e.g., "05 Sep"

        //        decimal dayRevenue = 0m;

        //        // Orders placed on this day
        //        var ordersThisDay = orders
        //            .Where(o =>  o.Order_Date.Date == currentDay)
        //            .ToList();

        //        foreach (var order in ordersThisDay)
        //        {
        //            // Get invoice (cached for performance)
        //            if (!invoiceCache.TryGetValue(order.Invoice_ID, out Invoice inv))
        //            {
        //                inv = client.getInvoice(order.Invoice_ID);
        //                if (inv != null)
        //                    invoiceCache[order.Invoice_ID] = inv;
        //            }
        //            if (inv == null) continue;

        //            List<Invoiceline> lines = client.getIvoiceLineItems(inv.Invoice_ID).ToList();
        //            foreach (var line in lines)
        //            {
        //                if (line?.Product_ID == null) continue;

        //                int prodId = line.Product_ID.Value;

        //                // Get product (cached for performance)
        //                if (!productCache.TryGetValue(prodId, out Product product))
        //                {
        //                    product = client.getProduct(prodId);
        //                    if (product != null)
        //                        productCache[prodId] = product;
        //                }
        //                if (product == null) continue;

        //                int qty = line.Invoiceline_Quantity ?? 0;
        //                decimal price = product.Product_Price;

        //                dayRevenue += price * qty;
        //            }
        //        }

        //        totalRevenue += dayRevenue;
        //        values.Add(dayRevenue);
        //    }

        //    lblTotalRevenue.Text = totalRevenue.ToString("C");

        //    int pendingOrders = orders.Count(o =>
        //        o.Order_Delivery_Status.Equals("Pending", StringComparison.OrdinalIgnoreCase));

        //    lblPendingOrders.Text = pendingOrders.ToString();

        //    lblAveOrder.InnerText = orders.Count > 0
        //        ? (totalRevenue / orders.Count).ToString("C")
        //        : "R0.00";

        //    // Convert to JSON for chart rendering
        //    var serializer = new JavaScriptSerializer();
        //    SalesLabelsJson = serializer.Serialize(labels);
        //    SalesValuesJson = serializer.Serialize(values);
        //}

        //private void LoadDashboard2()
        //{
        //    var client = new Service2Client();

        //    var labels = new List<string>();
        //    var values = new List<decimal>();

        //    DateTime today = DateTime.Today;
        //    DateTime startDate = today.AddDays(-29); // include today + 29 days before

        //    decimal totalRevenue = 0;

        //    // Get all orders once (you may filter server-side if possible)
        //    List<Order> orders = client.getOrders().ToList();

        //    // Loop through last 30 days
        //    for (int i = 0; i < 30; i++)
        //    {
        //        DateTime currentDate = startDate.AddDays(i);
        //        labels.Add(currentDate.ToString("dd MMM")); // e.g. "24 Sep"

        //        decimal dailyRevenue = 0m;

        //        var ordersToday = orders
        //            .Where(o => 
        //                        o.Order_Date.Date == currentDate.Date)
        //            .ToList();

        //        foreach (var order in ordersToday)
        //        {
        //            Invoice inv = client.getInvoice(order.Invoice_ID);
        //            if (inv == null) continue;

        //            var lines = client.getIvoiceLineItems(inv.Invoice_ID).ToList();

        //            foreach (var line in lines)
        //            {
        //                if (line == null || !line.Product_ID.HasValue) continue;

        //                Product p = client.getProduct(line.Product_ID.Value);
        //                if (p == null) continue;

        //                int qty = line.Invoiceline_Quantity ?? 0;
        //                decimal price = p.Product_Price;
        //                dailyRevenue += price * qty;
        //            }
        //        }

        //        values.Add(dailyRevenue);
        //        totalRevenue += dailyRevenue;
        //    }

        //    lblTotalRevenue.Text = totalRevenue.ToString("C");
        //    lblTotalOrders.Text = orders.Count.ToString();

        //    int pendingOrders = orders.Count(o => o.Order_Delivery_Status == "Pending");
        //    lblPendingOrders.Text = pendingOrders.ToString();

        //    lblAveOrder.InnerText = (orders.Count > 0 ? totalRevenue / orders.Count : 0).ToString("C");

        //    // Send data to JS
        //    var serializer = new JavaScriptSerializer();
        //    SalesLabelsJson = serializer.Serialize(labels);
        //    SalesValuesJson = serializer.Serialize(values);
        //}


        //private void LoadDashboard()
        //{
        //    var client = new Service2Client();

        //    // We will prepare labels (last 12 months) and values (revenue per month)
        //    var labels = new List<string>();
        //    var values = new List<decimal>();

        //    // Use now as reference; build months from oldest to newest
        //    DateTime now = DateTime.Now;

        //    Decimal totalRevenue = 0;
        //    for (int i = 11; i >= 0; i--)
        //    {
        //        DateTime month = new DateTime(now.Year, now.Month, 1).AddMonths(-i);
        //        labels.Add(month.ToString("MMM yyyy"));

        //        // Compute revenue for this month
        //        decimal monthRevenue = 0m;

        //        // Get all orders (you may want to optimize by adding a WCF method that filters server-side)
        //        List<Order> orders = client.getOrders().ToList();

        //        lblTotalOrders.Text = Convert.ToString(orders.Count());

        //        // Filter orders by month/year
        //        var ordersThisMonth = orders
        //            .Where(o => o.Order_Date != null &&
        //                        o.Order_Date.Month == month.Month &&
        //                        o.Order_Date.Year == month.Year)
        //            .ToList();

        //        // For each order, get its invoice and invoice lines and sum
        //        foreach (var order in ordersThisMonth)
        //        {
        //            // get invoice for the order
        //            Invoice inv = client.getInvoice(order.Invoice_ID);
        //            if (inv == null) continue;

        //            List<Invoiceline> lines = client.getIvoiceLineItems(inv.Invoice_ID).ToList();
        //            foreach (var line in lines)
        //            {
        //                // safe null checks; convert nullable ints if present
        //                if (line == null || !line.Product_ID.HasValue) continue;

        //                Product p = client.getProduct((int)line.Product_ID);
        //                if (p == null) continue;

        //                int qty = line.Invoiceline_Quantity ?? 0;
        //                decimal price = p.Product_Price; // adjust if your product price is decimal? or nullable
        //                monthRevenue += price * qty;
        //                totalRevenue += monthRevenue;
        //            }
        //        }

        //        values.Add(monthRevenue);
        //    }

        //    lblTotalRevenue.Text = (totalRevenue).ToString("C");

        //    int pendingOrders = 0;
        //    List<Order> orderss = client.getOrders().ToList();
        //    foreach (Order o in orderss)
        //    {
        //        if (o.Order_Delivery_Status.Equals("Pending"))
        //        {
        //            pendingOrders += 1;
        //        }
        //    }

        //    lblPendingOrders.Text = Convert.ToString(pendingOrders);
        //    lblAveOrder.InnerText = (totalRevenue / orderss.Count).ToString("C"); // e.g., "R1,234.56"


        //    // Serialize to JSON for embedding in JavaScript on the page
        //    var serializer = new JavaScriptSerializer();
        //    SalesLabelsJson = serializer.Serialize(labels);    // e.g. ["Sep 2024","Oct 2024",...]
        //    SalesValuesJson = serializer.Serialize(values);    // e.g. [12000.0, 19000.0, ... ]

        //    // (Optional) You can also fill other controls here (labels, repeaters etc.)
        //    // e.g. lblTotalOrders.Text = ... ;
        //}


        //protected string FilterType
        //{
        //    get { return ViewState["FilterType"] as string ?? ""; }
        //    set { ViewState["FilterType"] = value; }
        //}
        // "week", "month", "year"


        protected void btnThisMonth_Click(object sender, EventArgs e)
        {
            LoadTopProducts("month");
        }

        protected void btnThisWeek_Click(object sender, EventArgs e)
        {
            LoadTopProducts("week");
        }

        protected void btnThisYear_Click(object sender, EventArgs e)
        {
            LoadTopProducts("year");
        }
        //private void LoadTopProducts()
        //{
        //    try
        //    {
        //        Service2Client client = new Service2Client();

        //        string filterType = FilterType;
        //        DateTime today = DateTime.Now;

        //        var orders = client.getOrders().ToList();

        //        if (filterType == "week")
        //        {
        //            var startOfWeek = today.AddDays(-(int)today.DayOfWeek);
        //            var endOfWeek = startOfWeek.AddDays(7);
        //            orders = orders.Where(o => o.Order_Date >= startOfWeek && o.Order_Date < endOfWeek).ToList();
        //        }
        //        else if (filterType == "month")
        //        {
        //            orders = orders.Where(o => o.Order_Date.Month == today.Month && o.Order_Date.Year == today.Year).ToList();
        //        }
        //        else if (filterType == "year")
        //        {
        //            orders = orders.Where(o => o.Order_Date.Year == today.Year).ToList();
        //        }

        //        // ... rest of your existing logic (invoices, product stats, binding)
        //        // Get invoices for filtered orders
        //        var invoices = orders
        //            .Select(o => client.getInvoice(o.Invoice_ID))
        //            .Where(i => i != null)
        //            .ToList();

        //        // Dictionary: ProductName → {Quantity, Revenue}
        //        var productStats = new Dictionary<string, (int QuantitySold, decimal Revenue)>();

        //        foreach (var invoice in invoices)
        //        {
        //            var items = client.getIvoiceLineItems(invoice.Invoice_ID);
        //            foreach (var item in items)
        //            {
        //                var product = client.getProduct((int)item.Product_ID);
        //                int quantity = item.Invoiceline_Quantity ?? 0;
        //                decimal revenue = product.Product_Price * quantity;

        //                if (productStats.ContainsKey(product.Product_Name))
        //                {
        //                    productStats[product.Product_Name] = (
        //                        productStats[product.Product_Name].QuantitySold + quantity,
        //                        productStats[product.Product_Name].Revenue + revenue
        //                    );
        //                }
        //                else
        //                {
        //                    productStats[product.Product_Name] = (quantity, revenue);
        //                }
        //            }
        //        }

        //        // Get Top 10 products
        //        var topProducts = productStats
        //            .OrderByDescending(p => p.Value.QuantitySold)
        //            .Take(10)
        //            .Select(p => new
        //            {
        //                Product_Name = p.Key,
        //                QuantitySold = p.Value.QuantitySold,
        //                Revenue = p.Value.Revenue
        //            })
        //            .ToList();

        //        rptTopProducts.DataSource = topProducts;
        //        rptTopProducts.DataBind();

        //    }
        //    catch (Exception)
        //    {
        //        rptTopProducts.DataSource = new List<object>
        //{
        //    new { Product_Name = "Error loading data", QuantitySold = 0, Revenue = 0m }
        //};
        //        rptTopProducts.DataBind();
        //    }
        //}


        //protected void btnThisWeek_Click(object sender, EventArgs e)
        //{
        //    FilterType = "week";
        //    LoadTopProducts();
        //   // LoadDashboard();
        //}

        //protected void btnThisMonth_Click(object sender, EventArgs e)
        //{
        //    FilterType = "month";
        //    LoadTopProducts();
        //    //LoadDashboard();
        //}

        //protected void btnThisYear_Click(object sender, EventArgs e)
        //{
        //    FilterType = "year";
        //    LoadTopProducts();
        //    //LoadDashboard();
        //}


    }
}
 