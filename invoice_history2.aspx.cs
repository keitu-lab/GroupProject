using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class invoice_history2 : System.Web.UI.Page
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
                LoadInvoices();
            }
        }

        

        private void LoadInvoices()
        {
            int customerId = Convert.ToInt32(Session["page"]);
            Service2Client client = new Service2Client();

            List<Invoice> invoices = client.getInvoices(customerId).ToList();

            int intMonths = 0;
            //label values
            lblTotalInvoices.InnerText = Convert.ToString(invoices.Count());
            for(int i = 0; i < invoices.Count(); i++)
            {
                if (invoices[i].Invoice_Created_Date.Month.Equals(DateTime.Now.Month))
                {
                    intMonths += 1;
                }
            }

            double totalAmount=0;
            foreach(Invoice i in invoices)
            {
                int invoiceID = i.Invoice_ID;
                decimal totalAmountPerInv = 0;
                List<Invoiceline> invoiceLines = client.getIvoiceLineItems(invoiceID).ToList();
                foreach(Invoiceline line in invoiceLines)
                {
                    Product product = client.getProduct(Convert.ToInt32(line.Product_ID));
                    totalAmount += (double)(product.Product_Price * line.Invoiceline_Quantity);
                    totalAmountPerInv += Convert.ToDecimal(product.Product_Price * line.Invoiceline_Quantity);
                }

                if(totalAmountPerInv > 2000)
                {
                    totalAmount += 500;
                }


            }
            lblTotalSpent.InnerText = "R"+(totalAmount).ToString("F2");

            lblMonth.InnerText = Convert.ToString(intMonths);

            lblAverageOrder.InnerText = "R"+(totalAmount/invoices.Count).ToString("F2");


            rptInvoices.DataSource = invoices;
            rptInvoices.DataBind();
        }
    }

}