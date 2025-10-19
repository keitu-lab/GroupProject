using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class Invoice2 : System.Web.UI.Page
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
            GenerateInvoice();
        }

        private void GenerateInvoice()
        {
            // 1. Get the current customer ID from session
            //int customerId = Convert.ToInt32(Session["CustomerID"]);
            int customerId = (int)Session["page"];
            // 2. Create WCF client
            Service2Client client = new Service2Client();

            // 3. Get all invoices for this customer
            List<Invoice> invoices = client.getInvoices(customerId).ToList();

            if (invoices == null || invoices.Count == 0)
            {
                //lblMessage.InnerText = "No invoices found for this customer.";
                return;
            }

            // 4. Assume latest invoice is the one we want
            Invoice latestInvoice = invoices.OrderByDescending(i => i.Invoice_ID).First();
            //lblInvoiceId.Text = Convert.ToString(latestInvoice.Invoice_ID);
            //lblInvoiceDate.Text = Convert.ToString(latestInvoice.Invoice_Created_Date.Date);

            // customer
            String customerName = (string)Session["name"];
            String address = (string)(Session["address"]);
            String email = (string)Session["email"];
            lblCustomerName.Text = customerName;
            lblBillingAddress.Text = address;
            lblShippingEmail.Text = email;


            // 5. Get all line items for this invoice
            List<Invoiceline> lineItems = client.getIvoiceLineItems(latestInvoice.Invoice_ID).ToList();

            if (lineItems == null || lineItems.Count == 0)
            {
                //lblMessage.InnerText = "No line items found for this invoice.";
                return;
            }

            // 6. Prepare data for Repeater
            List<dynamic> invoiceItems = new List<dynamic>();
            decimal subtotal = 0;

            foreach (Invoiceline invLine in lineItems)
            {
                int product_ID = (int)invLine.Product_ID;

                // Get product info from service
                Product singleProduct = client.getProduct(product_ID);

                if (singleProduct != null)
                {
                    decimal lineSubtotal = (decimal)(singleProduct.Product_Price * invLine.Invoiceline_Quantity);
                    subtotal += lineSubtotal;

                    var invoiceItem = new
                    {
                        Product_Name = singleProduct.Product_Name,
                        Product_Price = singleProduct.Product_Price,
                        Quantity = invLine.Invoiceline_Quantity,
                        Subtotal = lineSubtotal
                    };

                    if(subtotal > 2000)
                    {
                        lblSubtotal.Text = subtotal.ToString("F2");
                        lblShipping.Text = "FREE";
                        lblTotal.Text = subtotal.ToString("F2");
                       
                    }
                    else
                    {
                        lblShipping.Attributes["CssClass"] = "";
                        lblSubtotal.Text = subtotal.ToString("F2");
                        decimal shipping = 500;
                        lblShipping.Text = "R" + shipping.ToString("F2");
                        lblTotal.Text = (subtotal + shipping).ToString("F2"); ;
                    }

                   

                    invoiceItems.Add(invoiceItem);
                }
            }

            rptInvoiceItems.DataSource = invoiceItems;
            rptInvoiceItems.DataBind();

            //// 7. Totals
            //decimal shipping = 50; // Example flat fee
            //decimal total = subtotal + shipping;

            //lblSubtotal.Text = subtotal.ToString("F2");
            //lblShipping.Text = shipping.ToString("F2");
            //lblTotal.Text = total.ToString("F2");

            //// 8. Optionally display invoice info
            //lblCustomerName.Text = Session["CustomerName"]?.ToString();
            //lblBillingAddress.Text = Session["BillingAddress"]?.ToString() ?? "Billing Address";
            //lblBillingEmail.Text = Session["CustomerEmail"]?.ToString();

            //lblShippingName.Text = lblCustomerName.Text;
            //lblShippingAddress.Text = Session["ShippingAddress"]?.ToString() ?? "Shipping Address";
            //lblShippingEmail.Text = lblBillingEmail.Text;
           
        }

        protected void btnInvoiceHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("invoice_history2.aspx");
        }
    }
}