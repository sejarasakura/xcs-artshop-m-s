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
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] role = Roles.GetRolesForUser(Functions.getLoginUser().UserName);

            isAdminLogin = role.Contains("Administrator");
            viewMember = getUsers();
            loginMember = Functions.getLoginUser();
            setAccesbility();
        }

        
        protected void setAccesbility()
        {
            TextBox emails = (TextBox)LoginView1.FindControl("Emails");
            TextBox firstName = (TextBox)LoginView1.FindControl("firstName");
            TextBox lastName = (TextBox)LoginView1.FindControl("lastName");

            emails.ReadOnly = true;
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