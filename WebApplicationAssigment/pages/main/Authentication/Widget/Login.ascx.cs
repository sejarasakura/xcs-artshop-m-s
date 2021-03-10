using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.main.Authentication.Widget
{
    public partial class Login : System.Web.UI.UserControl
    {
        public bool AutoRedirect
        {
            get; set;
        }
        public string ValidationGroup
        {
            get
            {
                TextBox pass = (TextBox)FindControlRecursive(Login1, "Password");
                return pass.ValidationGroup;
            }
            set
            {
                RequiredFieldValidator passwordValidator = (RequiredFieldValidator)FindControlRecursive(Login1, "PasswordRequired");
                RequiredFieldValidator usernameValidator = (RequiredFieldValidator)FindControlRecursive(Login1, "UserNameRequired");
                TextBox username = (TextBox)FindControlRecursive(Login1, "UserName");
                TextBox pass = (TextBox)FindControlRecursive(Login1, "Password");
                Button btnSubmit = (Button)FindControlRecursive(Login1, "Login");
                btnSubmit.ValidationGroup = value;
                passwordValidator.ValidationGroup = value;
                usernameValidator.ValidationGroup = value;
            }
        }

        public static Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
                return root;

            return root.Controls.Cast<Control>()
               .Select(c => FindControlRecursive(c, id))
               .FirstOrDefault(c => c != null);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            if (AutoRedirect)
                Response.Redirect(Constant.HOME_URL);

            Functions.EnqueueNewNotifications(new Notifications(
                2,
                Notifications.SUCCESS_TYPE,
                "Welcome!!",
                "You had login successfully."));
        }

        protected void Login1_LoginError(object sender, EventArgs e)
        {
            Literal error = (Literal)FindControlRecursive(Login1, "FailureText");
            Functions.EnqueueNewNotifications(new Notifications(
                1,
                Notifications.ERROR_TYPE,
                "Login Error!!",
                "Your authentications had failed !! please try agians"));
        }
    }
}