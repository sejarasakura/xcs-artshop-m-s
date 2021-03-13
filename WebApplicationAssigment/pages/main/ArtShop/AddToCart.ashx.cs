using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplicationAssigment.modal;
using WebApplicationAssigment.commons;
using System.Web.SessionState;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    /// <summary>
    /// Summary description for AddToCart
    /// </summary>
    public class AddToCart : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string id = context.Request.QueryString["pid"];
            Functions.addToCart(id, context.Response);
            context.Response.Redirect(context.Request.UrlReferrer.ToString());
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