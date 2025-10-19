using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class Cart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                var master = Master as Site1;

                var type = Convert.ToChar(Session["type"]);

                if (type == 'C')
                {
                    master.getSign.Visible = false;
                    master.getReport.Visible = false;
                    master.getOrder.Visible = false;
                    master.getPro.Visible = false;
                    master.getOut.Visible = true;
                }
                else if (type == 'M')
                {
                    master.getSign.Visible = false;
                    master.getReport.Visible = true;
                    master.getOrder.Visible = true;
                    master.getPro.Visible = true;

                }
                else
                {
                    master.getSign.Visible = true;
                    master.getReport.Visible = false;
                    master.getOrder.Visible = false;
                    master.getPro.Visible = false;
                }
                BindCart();
                Service2Client client = new Service2Client();
                int customerId = Convert.ToInt32(Session["page"]);
                var customer = client.getUser(customerId);

                txtAddress.Text = Convert.ToString(customer.User_Address);
                txtCardHolderName.Text = customer.User_Card_Name;
                txtCardNumber.Text = customer.User_Card_No;
                txtCVV.Text = customer.User_Security_Code;
                txtExpiryDate.Text = customer.User_Valid_Thru;

                if( txtAddress.Text != null &&
                    txtCardHolderName.Text != null &&
                    txtCVV.Text != null &&
                    txtExpiryDate != null)
                {
                    btnSave.Visible = false;
                }else
                {
                    btnSave.Visible = true; 
                }
            }


           


        }

        protected void AddProductToCart(Product product)
        {
            // Get the cart from session or create a new one
            var cart = Session["Cart"] as Dictionary<Product, int> ?? new Dictionary<Product, int>();

            // Check if a product with the same Product_ID is already in the cart
            var existingProduct = cart.Keys.FirstOrDefault(p => p.Product_ID == product.Product_ID);

            if (existingProduct != null)
            {
                // Product already in cart -> increment quantity
                cart[existingProduct]++;
            }
            else
            {
                // Product not in cart -> add with quantity 1
                cart.Add(product, 1);
            }

            // Save the updated cart back to session
            Session["Cart"] = cart;
            Response.Redirect(Request.RawUrl);
        }


        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var cart = Session["Cart"] as Dictionary<Product, int> ?? new Dictionary<Product, int>();
            int productId = int.Parse(e.CommandArgument.ToString());

            Product existingProduct = cart.Keys.FirstOrDefault(p => p.Product_ID == productId);
            if (existingProduct == null) return;

            switch (e.CommandName)
            {
                case "Increment":
                    cart[existingProduct]++;
                    break;
                case "Decrement":
                    if (cart[existingProduct] > 1)
                        cart[existingProduct]--;
                    else
                        cart.Remove(existingProduct);
                    break;
                case "Remove":
                    cart.Remove(existingProduct);
                    break;
            }
            Session["Cart"] = cart;
            var cartCountControl = Master.FindControl("cartCount") as HtmlGenericControl;
            if (cartCountControl != null)
            {
                cartCountControl.InnerText = Convert.ToString(cart.Values.Sum());  // Set new value
                Session["CartCount"] = cart.Values.Sum();
            }


           

            // Redirect to the same page to prevent duplicate postback
            Response.Redirect(Request.RawUrl);
        }

        protected void BindCart()
        {
            Dictionary<Product, int> cart = Session["Cart"] as Dictionary<Product, int>;
            rptCartItems.DataSource = cart;
            rptCartItems.DataBind();

            // Calculate total
            decimal total = 0;
            if (cart == null)
            {

            }else
            {
                 total = cart.Sum(kvp => kvp.Key.Product_Price * kvp.Value);
            }



            // Set total label
            lblCartTotal.Text = total.ToString("F2");
            if (total > 2000)
            {

                lblShipping.InnerText = "FREE";


            }
            else
            {
                lblShipping.InnerText = "R500,00";
                lblFinalTotal.Text =  (total + 500).ToString("F2");
                
            }

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // 1.Get the current customer ID(from session or user context)
            int customerId = Convert.ToInt32(Session["page"]);
            //int customerid = Convert.ToInt32(Request.QueryString["page"]);
            // 2. Get the cart from session
            var cart = Session["Cart"] as Dictionary<Product, int>;
            if (cart == null || cart.Count == 0)
            {
                // Cart is empty
                lblMessage.InnerText = "Your cart is empty!";
                return;
            }

            // 3. Create a WCF client
            Service2Client client = new Service2Client();
            //add remaining fields
            var customer = client.getUser(customerId);

            string address = txtAddress.Text;
            string cardholdername = txtCardHolderName.Text;
            string cardnumber= txtCardNumber.Text;
            string cvv = txtCVV.Text;
            string expirydate = txtExpiryDate.Text;

             
            bool edituser = client.editUser(customerId, address,cardholdername,cardnumber,cvv,expirydate);

            if(edituser==true)
            {
                lblMessage.InnerText = "Success";
            }else if (edituser ==false)
            {
                lblMessage.InnerText = "Fail";
            }

            // 4. Add invoice for the customer
            bool invoiceCreated = client.addInvoice(customerId);
            if (!invoiceCreated)
            {
                lblMessage.InnerText = "Failed to create invoice. Please try again.";
                return;
            }

            // 5. Retrieve the latest invoice for the customer

            // Call WCF method


            // Get all invoices for this customer
            List<Invoice> invoices = client.getInvoices(customerId).ToList();

            if (invoices == null || invoices.Count == 0)
            {
                lblMessage.InnerText = "No invoice found for this customer.";
                return;
            }

            // Get the latest invoice (highest Invoice_ID)
            Invoice newInvoice = invoices.OrderByDescending(i => i.Invoice_ID).First();

            // 6. Add invoice line items
            foreach (var kvp in cart)
            {
                Product product = kvp.Key;
                int quantity = kvp.Value;

                bool lineAdded = client.addInvoiceLine(newInvoice.Invoice_ID, product.Product_ID, quantity);
                if (!lineAdded)
                {
                    lblMessage.InnerText = $"Failed to add product {product.Product_Name} to invoice.";
                }
            }


            // 3. Add Order linked to this invoice
            bool orderCreated = client.addOrder(customerId, "Pending", newInvoice.Invoice_ID);
            if (!orderCreated)
            {
                lblMessage.InnerText = "Error creating order.";
                return;
            }

            lblMessage.InnerText = $"Order successfully created for Invoice #{newInvoice.Invoice_ID}";

            // 7. Clear the cart after successful checkout
            var cartCountControl = Master.FindControl("cartCount") as HtmlGenericControl;

            if (cartCountControl != null)
            {

                cartCountControl.InnerText = "0";  // Set new value
                Session["CartCount"] = 0;
                Session["Cart"] = null;
            }
            //

            lblMessage.InnerText = "Checkout successful! Your order has been placed.";

            //generate order

            Response.Redirect("Invoice2.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // 1.Get the current customer ID(from session or user context)
           int customerid = Convert.ToInt32(Session["page"]);
            //int customerid = Convert.ToInt32(Request.QueryString["page"]);
            //// 2. Get the cart from session
            //var cart = Session["Cart"] as Dictionary<Product, int>;
            //if (cart == null || cart.Count == 0)
            //{
            //    // Cart is empty
            //    lblMessage.InnerText = "Your cart is empty!";
            //    return;
            //}

            // 3. Create a WCF client
            Service2Client client = new Service2Client();
            //add remaining fields
            //var customer = client.getUser(customerid);

            string address = txtAddress.Text;
            string cardholdername = txtCardHolderName.Text;
            string cardnumber = txtCardNumber.Text;
            string cvv = txtCVV.Text;
            string expirydate = txtExpiryDate.Text;


            bool edituser = client.editUser(customerid, address, cardholdername, cardnumber, cvv, expirydate);

            if (edituser == true)
            {
                lblMessage.InnerText = "Success";
            }
            else if (edituser == false)
            {
                lblMessage.InnerText = "Fail";
            }
        }
    }
    
}