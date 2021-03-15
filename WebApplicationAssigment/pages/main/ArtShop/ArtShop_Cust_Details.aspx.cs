using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class ArtShop_Cust_Details : System.Web.UI.Page
    {
        public static Art art = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                art = db.Arts.Find(int.Parse(Request.QueryString["id"]));
                quantity.Enabled = !art.@virtual;
            }
        }

        protected void init_data()
        {

        }

        protected void btnaddtocart_Click(object sender, EventArgs e)
        {
            int quan = 1;
            int.TryParse(this.quantity.Text, out quan);
            Functions.addToCart(
                productId: Request.QueryString["id"],
                Response: Response, 
                quantity: quan);
        }
    }


}