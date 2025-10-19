using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class Index : System.Web.UI.Page
    {
        Service2Client client = new Service2Client();


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
                master.getSign.Visible = true;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
            }
            int catID = Convert.ToInt32(Request.QueryString["catID"]);
            dynamic products = client.getActiveProducts(catID);

            waterSection.DataSource = products;
            waterSection.DataBind();
        }
    }
}