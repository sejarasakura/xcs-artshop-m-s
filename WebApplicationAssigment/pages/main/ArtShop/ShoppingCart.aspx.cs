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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        private int cart_id = 0;
        private Guid id;
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

                SqlDataSource1.SelectParameters["user_id"].DefaultValue = id.ToString();
                totalprice.Text = "Total price : RM" + total.ToString();
                check_cart_count(db);
            }
        }

        private void check_cart_count(ArtShopEntities db)
        {
            Cart cart_record = db.Carts.Where(s => s.user_id == id).FirstOrDefault();

            if (cart_record != null ? cart_record.CartDetails.Count > 0 : false)
            {
                cart_id = cart_record.id;
                SqlDataSource1.DeleteParameters["cart_id"].DefaultValue = cart_id.ToString();
                GridView1.Visible = true;
                NoCartFound.Visible = false;
            }
            else
            {
                NoCartFound.Visible = true;
                GridView1.Visible = false;
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
                    GridView1.DataBind();

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
                    "you have following exception : "+ e.Message +" !!"));
            }
        }

    }
}