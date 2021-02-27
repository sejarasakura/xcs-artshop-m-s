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
        protected void Page_Load(object sender, EventArgs e)
        {
            double total;
            using (ArtShopEntities db = new ArtShopEntities())
            {

                total = 0;
                Guid id = (Guid)Functions.getLoginUser().ProviderUserKey;
                
                IQueryable<vw_customer_cart> x = db.vw_customer_cart.Where(s => s.user_id == id);
                vw_customer_cart[] y = x.ToArray();
                for (int i = 0; i < x.Count(); i++)
                {
                    total += Convert.ToDouble(y[i].price);
                }

                SqlDataSource1.SelectParameters["user_id"].DefaultValue = id.ToString();
                cart_id = db.Carts.Where(s => s.user_id == id).FirstOrDefault().id;
                SqlDataSource1.DeleteParameters["cart_id"].DefaultValue = cart_id.ToString();
                totalprice.Text ="Total price : RM" + total.ToString();
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
                    preview.InnerHtml = Functions.getAlert(
                        "alert-success","<strong>Deleted Sucessful!</strong> you have remove item form your cart !!"
                    );
                }
            }
            catch (Exception e)
            {
                preview.InnerHtml = Functions.getAlert(
                    "alert-danger", "<strong>Deleted Failed!</strong> you have following exception " + rollno + e +  "!!"
                );
            }
        }

    }
}