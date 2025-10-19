using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OffTheGrit1.ServiceReference1;

namespace OffTheGrit1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as Site1;

            var type = Convert.ToChar(Session["type"]);

            if (type == 'C')
            {
                master.getSign.Visible = true;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
            }
            else if (type == 'M')
            {
                master.getSign.Visible = true;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;

            }
            else
            {
                master.getSign.Visible = true;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //server client
            Service2Client client = new Service2Client();

            //getting user details
            string name = txtName.Text;
            string surname = txtSurname.Text;
            string email = txtEmail.Text;
            string number = txtMobile.Text;
            string password = txtPassword.Text;
            string cpassword = txtConfirmPassword.Text;
            char type = 'C';

            //getting user type
            //char utype = Convert.ToChar(type.Value);

            //checking if user exists or not
            var response = client.Register(name, surname, number, email, password, cpassword, type);

            if (password == cpassword)
            {
                if (response == 0)
                {
                    //user does not exists
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblStatus.Text = "User successfully registered, Proceed to Login";

                    //redirect 
                    Response.Redirect("Login.aspx");

                }
                else if (response == 1)
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = "User already exists";
                }
                else if (response == -1)
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = "Error";

                }

            }
            else
            {
                //response to user
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Passwords do not match!";

            }

            //close client
            client.Close();

        }
    }
}