using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class search_results : System.Web.UI.Page
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
                string searchTerm = Request.QueryString["query"]; // ?q= in URL
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    BindSearchResults(searchTerm);
                }
            }
        }

        private void BindSearchResults(string searchTerm)
        {
            try
            {
                var results = client.getProductsByQuery(searchTerm);

                if (results == null || (results.Length == 0))
                {
                    waterSection.DataSource = null;
                    waterSection.DataBind();
                    lblMessage.Text = $"No results found for \"{searchTerm}\".";
                    return;
                }

                waterSection.DataSource = results;
                waterSection.DataBind();
                lblMessage.Text = $"Found {results.Length} result(s) for \"{searchTerm}\".";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }



    }
}