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
            init_data();
        }

        protected void init_data()
        {
            try
            {
                int id = Int32.Parse(Request["id"]);
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    art = db.Arts.Find(id); 
                }
            }
            catch { }
        }

        protected void btnaddtocart_Click(object sender, EventArgs e)
        {
            Functions.addToCart(Request.QueryString["id"], Response);
        }
    }


}