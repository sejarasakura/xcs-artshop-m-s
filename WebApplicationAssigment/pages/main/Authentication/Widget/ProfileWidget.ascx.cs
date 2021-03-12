using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.widget
{
    public partial class ProfileWidget : System.Web.UI.UserControl
    {
        protected MembershipUser viewMember;
        protected MembershipUser loginMember;
        protected bool isAdminLogin = false;
        protected string type = "#general";
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["AccountMenuSession"] == null)
                Session["AccountMenuSession"] = type;
            else
                type = (string)Session["AccountMenuSession"];
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] role = Roles.GetRolesForUser(Functions.getLoginUser().UserName);

            isAdminLogin = role.Contains("Administrator");
            viewMember = getUsers();
            loginMember = Functions.getLoginUser();
        }
        protected MembershipUser getUsers()
        {
            MembershipUser ms;
            string guid = Request.QueryString.Get("guid");
            if (guid != null && isAdminLogin)
                ms = Functions.getUser(guid);
            else
                ms = Functions.getLoginUser();
            return ms;
        }
    }
}