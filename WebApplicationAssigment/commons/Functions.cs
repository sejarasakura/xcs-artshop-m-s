using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using WebApplicationAssigment.modal;
namespace WebApplicationAssigment.commons
{
    public class Functions
    {
        public static byte[] ImmageAssetToByte(string path)
        {
            byte[] imageBytes = null;
            using (var webClient = new WebClient())
            {
                imageBytes = webClient.DownloadData(Constant.DEFAULT_URL + "/" +path);
            }
            return imageBytes;
        }

        public static MembershipUser getLoginUser()
        {
            MembershipUser user = Membership.GetUser(
                HttpContext.Current.User.Identity.Name
            );
            // (Guid) user.ProviderUserKey
            return user;
        }

        public static MembershipUser getUser(string guid)
        {
            MembershipUser user = Membership.GetUser(
                Guid.Parse(guid), false
            );
            // (Guid) user.ProviderUserKey
            return user;
        }

        public static string getAlert(string css_class, string error)
        {
            return  "<div class=\"alert " + css_class + " alert-dismissible\">" +
                "<a href = \"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>" +
                error +
              "</div>";
        }

        public static Cart CreateCart()
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Cart newCart = new Cart();
                newCart.user_id = (Guid)getLoginUser().ProviderUserKey;
                if (db.Carts.Count() == 0)
                {
                    newCart.id = 1;
                }
                else
                {
                    newCart.id = db.Carts.OrderByDescending(u => u.id).FirstOrDefault().id + 1;
                }
                try
                {
                    db.Carts.Add(newCart);
                    db.SaveChanges();
                    return newCart;
                }catch(Exception e)
                {
                    return null;
                }
            }
        }

        public static void addToCart(string productId, HttpResponse Response)
        {
            CartDetail cd = new CartDetail();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    Guid user_id = (Guid)Functions.getLoginUser().ProviderUserKey;
                    Cart cart;
                    IQueryable<Cart> carts = db.Carts.Where(
                        s => s.user_id == user_id
                    );
                    if (carts.Count() <= 0)
                    {
                        cart = Functions.CreateCart();
                    }
                    else
                    {
                        cart = carts.FirstOrDefault();
                    }
                    //string userid = Session["UserId"].ToString(); //user id for the logged in user
                    string productid = productId; //get product id from the selected product
                    int pidininteger = Int32.Parse(productid);

                    cd.art_id = pidininteger; //art id
                    cd.availability = 1; //1 means available
                    cd.add_date = DateTime.Now; //added item must be recorded on real time\
                    cd.cart_id = cart.id;

                    db.CartDetails.Add(cd);
                    try
                    {
                        db.SaveChanges();
                    }
                    catch
                    {

                    }
                }
            }
            else
            {
                Response.Redirect(Constant.LOGIN_URL);
            }
        }

    }
}