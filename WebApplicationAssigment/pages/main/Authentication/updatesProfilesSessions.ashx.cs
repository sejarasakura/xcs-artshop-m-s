using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace WebApplicationAssigment.pages.main.Authentication
{
    /// <summary>
    /// Summary description for updatesProfilesSessions
    /// </summary>
    public class updatesProfilesSessions : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string type = context.Request.QueryString["id"];
            if(type == null)
            {
                context.Response.Write("type not found");
            }
            else
            {
                context.Session["AccountMenuSession"] = "#" + type;
                context.Response.Write(type + "updates");
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