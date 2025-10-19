using OffTheGrit1.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace OffTheGrit1
{
    public partial class About : System.Web.UI.Page
    {
        Service2Client client = new Service2Client();
        protected int itemCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            var master = Master as Site1;

            var type = Convert.ToChar(Session["type"]);

            if (type == 'C')
            {
                master.getSign.Visible =false;
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
                btnAdd.Visible = false;
                btnEdit.Visible = true;
                lblHeading.Visible = false;
                divQuantity.Visible = false;

            }
            else
            {
                master.getSign.Visible = true;
                master.getReport.Visible = false;
                master.getOrder.Visible = false;
                master.getPro.Visible = false;
                btnEdit.Visible = false;

            }
            int prodID = Convert.ToInt32(Request.QueryString["prodID"]);
            var products = client.getProduct(prodID);

            imgProduct.Attributes["src"] = products.Product_Image;
            lblProductName.Text = products.Product_Name;
            lblProductPrice.Text ="R"+ Convert.ToString(Math.Round(products.Product_Price,2));
            description.InnerText = products.Product_Description;
            lblDiscount.InnerText = "R" + Convert.ToString(Convert.ToInt32((products.Product_Price+ (products.Product_Price*20)/100)));

            int category = Convert.ToInt32(Request.QueryString["Category_ID"]);
        }

        protected void AddProductToCart(Product product)
        {
            var master = Master as Site1;

            var cart = Session["Cart"] as Dictionary<Product, int> ?? new Dictionary<Product, int>();
            itemCount = cart.Values.Sum();

            //check if a product with the same id already exists
            var existingProduct = cart.Keys.FirstOrDefault(p => p.Product_ID == product.Product_ID);

            if (existingProduct != null)
            {
                //Product already in cart
                cart[existingProduct]=Convert.ToInt32(txtQuantity.Value);
            }
            else
            {
                //product not in cart
                cart.Add(product, Convert.ToInt32(txtQuantity.Value));
            }

                var cartCountControl = Master.FindControl("cartCount") as HtmlGenericControl;
                if (cartCountControl != null)
                {
                    cartCountControl.InnerText = Convert.ToString(cart.Values.Sum());  // Set new value
                    Session["CartCount"] = cart.Values.Sum();
                }


            //save updated cart
            Session["Cart"] = cart;
        
        
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Service2Client client = new Service2Client();

            int productID = Convert.ToInt32(Request.QueryString["prodID"]);

            //retrieving specific product from database
            var product = client.getProduct(productID);

            AddProductToCart(product);

          
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

             int productID = Convert.ToInt32(Request.QueryString["prodID"]);
            Response.Redirect("edit_product.aspx?prodID=" + productID) ;

        }
    }
}