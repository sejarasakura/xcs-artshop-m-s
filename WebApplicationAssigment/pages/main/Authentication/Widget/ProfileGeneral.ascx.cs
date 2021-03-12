using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssigment.pages.main.Authentication.Widget
{
    public partial class ProfileGeneral : System.Web.UI.UserControl
    {
        public System.Guid loginUser;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void setAccesbility()
        {
            Emails.ReadOnly = true;
        }
    }
}