using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using WebApplicationAssigment.commons;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    /// <summary>
    /// Summary description for DeleteCart
    /// </summary>
    public class DeleteCart : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request.QueryString["id"];
            string cid = context.Request.QueryString["cid"];
            deleterowdata(Int32.Parse(cid), Int32.Parse(id));
            context.Response.Redirect("ShoppingCart.aspx");
        }
        private void deleterowdata(int cart_id, int art_id)
        {
            try
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    CartDetail c = db.CartDetails.Find(cart_id, art_id);
                    db.CartDetails.Remove(c);
                    db.SaveChanges();

                    Functions.EnqueueNewNotifications(new Notifications(
                        2,
                        Notifications.SUCCESS_TYPE,
                        "Deleted Sucessful!!",
                        "you have remove item form your cart !!"));
                }
            }
            catch (Exception e)
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    2,
                    Notifications.ERROR_TYPE,
                    "Deleted Failed!!",
                    "you have following exception : " + e.Message + " !!"));
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}