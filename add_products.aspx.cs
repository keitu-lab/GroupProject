using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OffTheGrit1.ServiceReference1;


namespace OffTheGrit1
{
    public partial class add_products : System.Web.UI.Page
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
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Service2Client client = new Service2Client();

            int catid = Convert.ToInt32(txtCategory.Value);
            string strName = txtName.Value.Trim();
            string strImage = txtImage.Value.Trim();
            decimal strPrice = Convert.ToInt32(txtPrice.Value.Trim());
            string strDescription = txtDescription.Value.Trim();
            int strQuantity = Convert.ToInt32(txtQuantity.Value.Trim());
            DateTime dateadded = DateTime.Now;
            bool avail = true;
            try
            {
                var response = client.isProdAdded(catid, strName, strImage, strPrice, strDescription, strQuantity, avail, dateadded);

                if (response)
                {
                    lblStatus.Visible = true;
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblStatus.Text = "Product succefully added";
                }
                else
                {
                    lblStatus.Visible = true;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = "The product already exists";
                }
            }
            catch (Exception ex)
            {
                ex.GetBaseException();
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Internal error has occured";
            }
        }
    }
}