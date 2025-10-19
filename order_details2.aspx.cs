using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class order_details2 : System.Web.UI.Page
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
                int orderId;
                if (int.TryParse(Request.QueryString["orderID"], out orderId))
                {
                    LoadOrderDetails(orderId);
                }
            }
        }

        private void LoadOrderDetails(int orderId)
        {
            Service2Client client = new Service2Client();

            // 1. Get the Order
            Order order = client.getOrder(orderId);
            if (order == null) return;

            lblOrderId.Text = Request.QueryString["orderId"];
            lblInvoiceId.Text = order.Invoice_ID.ToString();
            lblCustomerId.Text = order.Customer_ID.ToString();
            lblStatus.Text = order.Order_Delivery_Status;
            lblOrderDate.Text = order.Order_Date.ToString("yyyy-MM-dd");

            // 2. Get all invoice line items for this order
            List<Invoiceline> lineItems = client.getIvoiceLineItems(order.Invoice_ID).ToList();

            // 3. Map to a view model for the repeater
            var orderItems = new List<dynamic>();
            foreach (var line in lineItems)
            {
                Product product = client.getProduct((int)line.Product_ID);
                orderItems.Add(new
                {
                    Product_Name = product.Product_Name,
                    Product_Price = product.Product_Price,
                    Quantity = line.Invoiceline_Quantity,
                    Subtotal = product.Product_Price * line.Invoiceline_Quantity
                });
            }

            rptOrderLines.DataSource = orderItems;
            rptOrderLines.DataBind();
        }
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string newStatus = ddlStatus.SelectedValue;
            int orderId = Convert.ToInt32(Request.QueryString["orderID"]);

            Service2Client client = new Service2Client();
            bool updated = client.editOrderStatus(orderId, newStatus);

            if (updated)
            {
                lblStatus.Text = "Status updated successfully!";
                LoadOrderDetails(orderId); // ✅ refresh data from DB
            }
            else
            {
                lblStatus.CssClass = "text-danger";
                lblStatus.Text = "Failed to update status.";
            }

            // Update order status in database
            //using (var db = new YourDbContext())
            //{
            //    var order = db.Orders.FirstOrDefault(o => o.Order_ID == orderId);
            //    if (order != null)
            //    {
            //        order.Status = newStatus;
            //        db.SaveChanges();
            //    }
            //}

            bool response = client.editOrderStatus(orderId, newStatus);
            if(response)
            {
                lblStatus.Text = newStatus;
            }

            // Update UI
            
        }


        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            //int orderId = Convert.ToInt32(Request.QueryString["orderID"]); // ✅ fixed key
            ////string newStatus = ddlStatus.SelectedValue;

            //Service2Client client = new Service2Client();
            //bool updated = client.editOrderStatus(orderId, newStatus);

            //if (updated)
            //{
            //    lblStatus.Text = "Status updated successfully!";
            //    LoadOrderDetails(orderId); // ✅ refresh data from DB
            //}
            //else
            //{
            //    lblStatus.CssClass = "text-danger";
            //    lblStatus.Text = "Failed to update status.";
            //}
        }
    }
}