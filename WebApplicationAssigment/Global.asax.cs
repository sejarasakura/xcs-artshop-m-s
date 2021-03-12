using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.IsAuthenticated)
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.SUCCESS_TYPE,
                    "Welcome "+ Functions.getLoginUser().UserName + " !!",
                    "System initalizes complete, welcome back to sketch. <a style='color: rgb(90, 203, 255)' href='" + Constant.ARTSHOP_URL + "/ArtShop_Customer.aspx'>Having shops now</a>"));
            }
            else
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.SUCCESS_TYPE,
                    "Welcome Guess !!",
                    "System initalizes complete, first time on sketch? <a style='color: rgb(90, 203, 255)' href='" + Constant.REGISTER_URL + "'>Register Now</a>. Already have new account? <a style='color: rgb(90, 203, 255)' href='" + Constant.LOGIN_URL + "'>Login Now</a>."));
            }
            List<bool> status = new List<bool>();
            for (int i = 0; i < 10; i++)
            {
                status.Add(false);
            }
            HttpContext.Current.Session[Constant.ADMIN_NAVIGATION_SESSION] = status;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}