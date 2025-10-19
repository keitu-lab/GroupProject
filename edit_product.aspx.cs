using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OffTheGrit1
{
    public partial class edit_product : System.Web.UI.Page
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

            if(!IsPostBack)
            {
                int productID = Convert.ToInt32(Request.QueryString["prodID"]);
                var product = client.getProduct(productID);

                imgProduct.ImageUrl = product.Product_Image;
                txtName.Text = product.Product_Name;
                txtCategory.Text = Convert.ToString(product.Category_ID);
                txtDescription.Text = product.Product_Description;
                txtPrice.Text = Convert.ToString(product.Product_Price);
                txtQuantity.Text = Convert.ToString(product.Product_Quantity);
                txtImage.Text = product.Product_Image;
            }
            

        }

        protected void btnApplyChanges_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string description = txtDescription.Text;
            decimal price = Decimal.Parse(txtPrice.Text);
            int quantity = Convert.ToInt32(txtQuantity.Text);
            string image = txtImage.Text;
            int? cat = string.IsNullOrWhiteSpace(txtCategory.Text)
           ? (int?)null
           : Convert.ToInt32(txtCategory.Text);


            int productId = Convert.ToInt32(Request.QueryString["prodID"]); // <-- Must have this!

            var product = new Product
            {
                Product_ID = productId,                // REQUIRED to find the existing product
                Product_Name = name,
                Product_Description = description,
                Product_Price = price,
                Product_Image = image,
                Product_Quantity = quantity,
                Product_Availability = true,
                Category_ID = cat                      // REQUIRED for updating category
            };

            var response = client.editProduct(product);

            if (response)
            {
                lblResponse.ForeColor = System.Drawing.Color.Green;
                lblResponse.Text = "Product information successfully edited";
            }
            else
            {
                lblResponse.ForeColor = System.Drawing.Color.Red;
                lblResponse.Text = "Error updating product information";
            }
        }



        protected void btnDeleteProduct_Click(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32(Request.QueryString["prodID"]);

            var response = client.deleteProduct(productID);

            if (response)
            {
                lblResponse.ForeColor = System.Drawing.Color.Green;
                lblResponse.Text = "Product deleted";
            }
            else
            {
                lblResponse.ForeColor = System.Drawing.Color.Red;
                lblResponse.Text = "Product could not be deleted deleted";
            }

            //close cient
            client.Close();
        }

        
    }
    
}