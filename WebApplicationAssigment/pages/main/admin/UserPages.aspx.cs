using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssigment.pages.main.admin.content
{
    public partial class UserPages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = Request.QueryString["role"] == null ? "User" : Request.QueryString["role"];
        }
    }
}