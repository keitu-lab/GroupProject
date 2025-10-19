using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class homepage : System.Web.UI.Page
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
                master.getSign.Visible = true;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
            }


        }

        protected void Btnsolar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?catID=1");
        }

        protected void water_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?catID=2");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?catID=3");
        }
    }
}