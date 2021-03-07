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
                    "Welcome "+ System.Environment.UserName + " !!",
                    "System initalizes complete, welcome back to sketch. <a style='text-color: #039BCD' href='" + Constant.ARTSHOP_URL + "/ArtShop_Customer.aspx'>Having shops now</a>"));
            }
            else
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.SUCCESS_TYPE,
                    "Welcome Guess !!",
                    "System initalizes complete, first time on sketch? <a style='text-color: #039BCD' href='" + Constant.REGISTER_URL + "'>Register Now</a>. Already have new account? <a style='text-color: #039BCD' href='" + Constant.LOGIN_URL + "'>Login Now</a>."));
            }
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