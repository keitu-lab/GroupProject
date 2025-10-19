using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class admin_orders2 : System.Web.UI.Page
    {
        Service2Client client = new Service2Client();
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
                }
                else if (type == 'M')
                {
                    master.getSign.Visible = false;
                    master.getReport.Visible = true;
                    master.getOrder.Visible = true;
                    master.getPro.Visible = true;
                    master.getOut.Visible = true;
                    master.GetCart.Visible = false;

                }
                else
                {
                    master.getSign.Visible = false;
                    master.getReport.Visible = false;
                    master.getOrder.Visible = false;
                    master.getPro.Visible = false;
                }

                BindOrders();
            }
        }

        private void BindOrders()
        {
            List<Order> orders = client.getOrders().ToList();

            if (orders != null && orders.Count > 0)
            {
                rptOrders.DataSource = orders;
                rptOrders.DataBind();
            }
            else
            {
                lblMessage.Text = "No orders found.";
            }

            //TotalOrders
            lblTotalOrders.InnerText = Convert.ToString(orders.Count);

            int intPending = 0;
            int intDelivered = 0;
            int intProcessing = 0;
            //Pending Orders
            foreach (Order o in orders)
            {
                switch (o.Order_Delivery_Status)
                {
                    case "Pending":
                        intPending += 1;
                    break;

                    case "Delivered":
                        intDelivered += 1;

                    break;

                    case "Processing":
                        intProcessing += 1;
                    break;
                }
            }

            lblDeliveredOrders.InnerText = Convert.ToString(intDelivered);
            lblPendingOrders.InnerText = Convert.ToString(intPending);
            lblProcessingOrders.InnerText = Convert.ToString(intProcessing);
            lblShoqingOrders.InnerText = "Showing " + Convert.ToString(orders.Count) + " orders.";

        }

        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int orderId = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                

                case "ViewDetails":
                    // Redirect to order details page with Order_ID as query string
                    Response.Redirect("order_details2.aspx?orderID=" + orderId);
                    BindOrders();
                    break;
            }
        }

        protected string GetStatusBadge(string status)
        {
            if (string.IsNullOrEmpty(status))
                return "<span class='inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200'>Unknown</span>";

            switch (status.ToLower().Trim())
            {
                case "pending":
                    return "<span class='status-badge inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200'>" +
                           "<svg class='w-3 h-3 mr-1' fill='currentColor' viewBox='0 0 20 20'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z' clip-rule='evenodd'/></svg>" +
                           "Pending</span>";

                case "processing":
                    return "<span class='status-badge inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200'>" +
                           "<svg class='w-3 h-3 mr-1' fill='currentColor' viewBox='0 0 20 20'><path fill-rule='evenodd' d='M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z' clip-rule='evenodd'/></svg>" +
                           "Processing</span>";

                case "delivered":
                case "completed":
                    return "<span class='status-badge inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200'>" +
                           "<svg class='w-3 h-3 mr-1' fill='currentColor' viewBox='0 0 20 20'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z' clip-rule='evenodd'/></svg>" +
                           "Delivered</span>";

                case "cancelled":
                case "canceled":
                    return "<span class='inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-red-100 dark:bg-red-900 text-red-800 dark:text-red-200'>" +
                           "<svg class='w-3 h-3 mr-1' fill='currentColor' viewBox='0 0 20 20'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z' clip-rule='evenodd'/></svg>" +
                           "Cancelled</span>";

                default:
                    return $"<span class='inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200'>{status}</span>";
            }
        }
    }
}