using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OffTheGrit1.ServiceReference1;

namespace OffTheGrit1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


            var master = Master as Site1;

            //var type = Convert.ToChar(Session["type"]);


            //if (type == 'C')
            //{
            //    master.getSign.Visible = false;
            //    master.getReport.Visible = false;
            //    master.getOrder.Visible = false;
            //    master.getPro.Visible = false;
            //}
            //else if (type == 'M')
            //{
            //    master.getSign.Visible = false;
            //    master.getReport.Visible = false;
            //    master.getOrder.Visible = false;
            //    master.getPro.Visible = false;

            //}
            //else
           
                //initialising to null
                Session["type"] = null;
                Session["page"] = null;
                Session["name"] = null;


                master.getSign.Visible = false;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;


            
            
              
            


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //server client
            Service2Client client = new Service2Client();
            //getting user credentials
            string strName = txtEmail.Text;
            string strpassword = txtPassword.Text;

            var response = client.login(strName, strpassword);
            //checking credentials
            if (response == null)
            {
                //user does not exist
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Account does not exist";

            }
            else
            {
                //user does exist
                Session["type"] = response.User_Type;
                //redirect to homepage
                Session["page"] = response.User_ID;
                Session["name"] = response.User_Name;
                Session["address"] = response.User_Address;
                Session["email"] = response.User_Email;
                Response.Redirect("Homepage.aspx");
               


            }

         


        }
    }
}