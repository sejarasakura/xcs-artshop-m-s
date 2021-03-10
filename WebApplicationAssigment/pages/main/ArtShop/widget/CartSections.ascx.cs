using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class CartSections : System.Web.UI.UserControl
    {
        private int cart_id = 0;
        public Guid id;
        protected void Page_Load(object sender, EventArgs e)
        {
            double total;
            using (ArtShopEntities db = new ArtShopEntities())
            {
                total = 0;
                id = (Guid)Functions.getLoginUser().ProviderUserKey;

                IQueryable<vw_customer_cart> x = db.vw_customer_cart.Where(s => s.user_id == id);
                vw_customer_cart[] y = x.ToArray();
                for (int i = 0; i < x.Count(); i++)
                {
                    total += Convert.ToDouble(y[i].price);
                }

                //totalprice.Text = "Total price : RM" + total.ToString();
                check_cart_count(db);
            }
        }

        private void check_cart_count(ArtShopEntities db)
        {
            Cart cart_record = db.Carts.Where(s => s.user_id == id).FirstOrDefault();

            if (cart_record != null ? cart_record.CartDetails.Count > 0 : false)
            {
                cart_id = cart_record.id;
                GotCart.Visible = true;
                NoCartFound.Visible = false;
            }
            else
            {
                NoCartFound.Visible = true;
                GotCart.Visible = false;
            }
        }

        protected string setCatergory(int cat_id)
        {
            string r = "";
            using (ArtShopEntities db = new ArtShopEntities())
            {
                r = db.Categories.Find(cat_id).name;
            }
            return r;
        }
        protected string setAvability(int avb_id)
        {
            return avb_id >= 1 ? "Yes" : "No";
        }
        protected void btnDeleteEvent(object sender, CommandEventArgs e)
        {
            int crow;
            crow = Convert.ToInt32(e.CommandArgument.ToString());
            deleterowdata(crow);

            using (ArtShopEntities db = new ArtShopEntities())
                check_cart_count(db);
        }

        private void deleterowdata(int rollno)
        {
            try
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    CartDetail c = db.CartDetails.Find(cart_id, rollno);
                    db.CartDetails.Remove(c);
                    db.SaveChanges();

                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.SUCCESS_TYPE,
                        "Deleted Sucessful!!",
                        "you have remove item form your cart !!"));
                }
            }
            catch (Exception e)
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.ERROR_TYPE,
                    "Deleted Failed!!",
                    "you have following exception : " + e.Message + " !!"));
            }
        }
    }
}