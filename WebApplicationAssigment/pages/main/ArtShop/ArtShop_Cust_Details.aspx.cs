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
        CartDetail cd = new CartDetail();

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
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Guid user_id = (Guid)Functions.getLoginUser().ProviderUserKey;
                Cart cart = db.Carts.Where(
                    s => s.user_id == user_id
                    ).First();
                if(cart == null)
                {
                    Cart newCart = new Cart();
                    newCart.user_id = user_id;
                    if(db.Carts.Count() == 0)
                    {
                        newCart.id = 1;
                    }
                    else
                    {
                        newCart.id = db.Carts.Last().id + 1;
                    }
                    db.Carts.Add(newCart);
                    db.SaveChanges();
                    cart = newCart;
                }
                //string userid = Session["UserId"].ToString(); //user id for the logged in user
                string productid = Request.QueryString["id"]; //get product id from the selected product
                int pidininteger = Int32.Parse(productid);

                cd.art_id = pidininteger; //art id
                cd.availability = 1; //1 means available
                cd.add_date = DateTime.Now; //added item must be recorded on real time\
                cd.cart_id = cart.id;

                db.CartDetails.Add(cd);
                db.SaveChanges();
            }
        }
    }


}