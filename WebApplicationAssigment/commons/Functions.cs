using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using WebApplicationAssigment.modal;
using System.Web.SessionState;
using System.Data.Entity.Migrations;
using Microsoft.EntityFrameworkCore;


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

        public static List<bool> getAdminBarStatus(HttpContext context)
        {
            List<bool> status = (List<bool>) context.Session[Constant.ADMIN_NAVIGATION_SESSION];
            if (status == null)
            {
                status = new List<bool>();
                for(int i = 0; i < 10; i++)
                {
                    status.Add(false);
                }
            }
            return status;
        }

        public static void setAdminBarStatus(HttpContext context, List<bool> refer)
        {
            context.Session[Constant.ADMIN_NAVIGATION_SESSION] = refer;
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
                if (newCart.user_id == null)
                    return null;
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

                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.SUCCESS_TYPE,
                        "Hello "+ Functions.getLoginUser().UserName + " !!",
                        "Hi, new user you can click \"Shopping Cart\" navigation at the top to check you cart!!"));
                }
                catch(Exception e)
                {
                    return null;
                }
            }
        }

        public static void addToCart(string productId, HttpResponse Response, int quantity = 1)
        {
            CartDetail cd = new CartDetail();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    Cart cart = null;
                    Guid user_id = (Guid)Functions.getLoginUser().ProviderUserKey;

                    if(user_id == null)
                    {
                        Response.Redirect(Constant.LOGIN_URL);
                    }

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

                    if(cart != null)
                    {
                        //string userid = Session["UserId"].ToString(); //user id for the logged in user
                        string productid = productId; //get product id from the selected product
                        int pidininteger = Int32.Parse(productid);
                        Art product = db.Arts.Find(pidininteger);

                        cd.art_id = pidininteger; //art id
                        cd.availability = product.@virtual? 1: quantity; //1 means available
                        cd.add_date = DateTime.Now; //added item must be recorded on real time\
                        cd.cart_id = cart.id;

                        CartDetail old_details = db.CartDetails.Find(cart.id, cd.art_id);
                        if(old_details != null)
                        {
                            if (old_details.Art.@virtual)
                            {
                                Functions.EnqueueNewNotifications(new Notifications(
                                    Notifications.ERROR_TYPE,
                                    "Art already existed in your cart",
                                    "This art that you are trying to add is already existed in your shopping cart"));
                            }
                            else
                            {
                                old_details.availability = old_details.availability + quantity;
                                db.CartDetails.AddOrUpdate(old_details);
                                try
                                {
                                    db.SaveChanges();
                                    Functions.EnqueueNewNotifications(new Notifications(
                                        Notifications.SUCCESS_TYPE,
                                        "Successfully update the quantity!",
                                        "You have successful updates \"" + old_details.Art.title + "\" to your shopping cart to " + old_details.availability + " !"));
                                }
                                catch (Exception)
                                {
                                    Functions.EnqueueNewNotifications(new Notifications(
                                        Notifications.ERROR_TYPE,
                                        "Art already existed in your cart",
                                        "This art that you are trying to add is already existed in your shopping cart"));
                                }
                            }
                        }
                        else
                        {
                            db.CartDetails.Add(cd);
                            try
                            {
                                db.SaveChanges();
                                Functions.EnqueueNewNotifications(new Notifications(
                                    Notifications.SUCCESS_TYPE,
                                    "Successfully added to shopping cart!",
                                    "You have successful added " + db.Arts.Find(cd.art_id).title + " to your shopping cart!"));
                            }
                            catch (Exception)
                            {
                                Functions.EnqueueNewNotifications(new Notifications(
                                    Notifications.ERROR_TYPE,
                                    "Art already existed in your cart",
                                    "This art that you are trying to add is already existed in your shopping cart"));
                            }
                        }
                    }
                }
            }
            else
            {
                Functions.EnqueueNewNotifications(new Notifications(
                Notifications.ERROR_TYPE,
                "Login required!",
                "You must login before trying to add in new item to cart !!"));


                Response.Redirect(Constant.LOGIN_URL);
            }
        }

        public static void EnqueueNewNotifications(Notifications news)
        {
            if (news == null)
                return;

            var sessionContent = HttpContext.Current.Session[Constant.ERROR_MESSAGE_SESSION];
            List<Notifications> notifications;
            if(sessionContent == null)
            {
                notifications = new List<Notifications>();
            }
            else
            {
                notifications = (List<Notifications>)sessionContent;
            }
            notifications.Add(news);

            HttpContext.Current.Session[Constant.ERROR_MESSAGE_SESSION] = notifications;
        }
        public static string DisplayNotifications()
        {
            var sessionContent = HttpContext.Current.Session[Constant.ERROR_MESSAGE_SESSION];

            if (sessionContent == null)
            {
                return "";
            }

            List<Notifications> notifications = (List<Notifications>)sessionContent;
            string result = "";
            List<int> removes = new List<int>();

            for (int i = 0; i < notifications.Count(); i++)
            {
                if (notifications[i].times < -1)
                    continue;

                switch (notifications[i].times)
                {
                    case -1:
                        result += FormatNotificationScript(notifications[i]);
                        break;
                    case 0:
                        removes.Add(i);
                        break;
                    case 1:
                        result += FormatNotificationScript(notifications[i]);
                        removes.Add(i);
                        break;
                    default:
                        result += FormatNotificationScript(notifications[i]);
                        notifications[i].times--;
                        break;
                }
            }
            removes.Reverse();
            foreach (int remove in removes)
            {
                notifications.RemoveAt(remove);
            }

            HttpContext.Current.Session[Constant.ERROR_MESSAGE_SESSION] = notifications;

            return result;
        }
        public static void ClearNotifications()
        {
            HttpContext.Current.Session[Constant.ERROR_MESSAGE_SESSION] = null;
        }

        public static string FormatNotificationScript(Notifications notifications)
        {
            return "toastr[\"" + notifications.type + "\"](\"" + notifications.detail + "\", \"" + notifications.title + "\"); ";
        }
    }
}