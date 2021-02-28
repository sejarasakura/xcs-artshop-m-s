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
            SqlDataSource1.SelectParameters["role"].DefaultValue = Request.QueryString["role"];
            this.Label1.Text = Page.Title + " Table";
        }
        protected void btnUpdateEvent(object sender, EventArgs e)
        {

        }
        protected void btnDeleteEvent(object sender, EventArgs e)
        {

        }
    }
}