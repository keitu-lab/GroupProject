using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            searchBox.Visible = false;
            UpdateCartCount();

               // var master = Master as Site1;
                if (Session["type"] != null)
                {
                    char type = Convert.ToChar(Session["type"]);

                    switch (type)
                    {
                        case 'C':
                        cart.Visible = true;
                        OTGTOP.Visible = false;
                        searchBox.Visible = true;
                            getSign.Visible = false;
                            getReport.Visible = false;
                           getOrder.Visible = false;
                           getPro.Visible = false;
                            break;
                        case 'M':
                        cart.Visible = false;
                        OTGTOP.Visible = false;
                        searchBox.Visible = true;
                        getSign.Visible = false;
                            getReport.Visible = true;
                           getOrder.Visible = true;
                          getPro.Visible = true;
                           GetCart.Visible = false;
                            break;
                        default:
                        cart.Visible = false;
                        OTGTOP.Visible = false;
                        searchBox.Visible = false;
                        getSign.Visible = true;
                           getReport.Visible = false;
                           getOrder.Visible = false;
                           getPro.Visible = false;
                            break;
                    }
                }
                else
                {
                    // Optional: redirect to login if session expired
                   // Response.Redirect("Login.aspx");
                }


            
        }

        public void UpdateCartCount()
        {
            int count = 0;
            if (Session["CartCount"] != null)
                count = (int)Session["CartCount"];

            cartCount.InnerText = count.ToString();
            
        }


        public HtmlControl getSign
        {
            get { return signin; }
        }

        public HtmlControl getOut
        {
            get { return logout; }
        }

        public HtmlControl getReport
        {
            get { return report; }
        }

        public HtmlControl getOrder
        {
            get { return order; }
        }

        public HtmlControl getPro
        {
            get { return product; }
        }

        public HtmlControl GetCart
        {
            get { return cart; }
        }

        public HtmlControl getItemCount
        {
            get { return cartCount; }
        }
    }
}