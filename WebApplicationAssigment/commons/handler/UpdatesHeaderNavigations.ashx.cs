using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace WebApplicationAssigment.commons.handler
{
    /// <summary>
    /// Summary description for UpdatesHeaderNavigations
    /// </summary>
    public class UpdatesHeaderNavigations : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            string count = context.Request.QueryString["c"] != null ? context.Request.QueryString["c"].ToString() : "";
            if (count.Count() == 0)
            {
                context.Response.Write("Count is null");
                return;
            }
            Regex regex = new Regex(@"^\d$");
            if (!regex.IsMatch(count))
            {
                context.Response.Write("Count is not number");
                return;
            }
            int x = int.Parse(count);
            List<bool> refer = Functions.getAdminBarStatus(context.Request);
            Functions.setAdminBarStatus(context.Request, refer);
            context.Response.Write("Count is done");
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