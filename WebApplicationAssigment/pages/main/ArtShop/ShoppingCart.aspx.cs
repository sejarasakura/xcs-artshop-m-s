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
        double total;
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid id = (Guid)Functions.getLoginUser().ProviderUserKey;
            if(!Page.IsPostBack){
                SqlDataSource1.SelectParameters.Add("UserId", id.ToString());
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    int cart_id = db.Carts.Where(s => s.user_id == id).FirstOrDefault().id;
                    SqlDataSource1.DeleteParameters.Add("cart_id", cart_id.ToString());
                }
            }

        }
    }
}