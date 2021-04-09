using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;

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

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void updatesData(ArtShopEntities db)
        {
            UserExtension ux = db.UserExtensions.Find(loginUser);
            aspnet_Membership am = db.aspnet_Membership.Find(loginUser);
            ux.first_name = this.firstName.Text;
            ux.last_name = this.lastName.Text;
            if (this.radioMale.Checked)
                ux.gender = "Male";
            else
                ux.gender = "Female";
        }
        protected void putData(modal.aspnet_Users user)
        {
            this.Emails.Text = user.aspnet_Membership.Email;
            this.firstName.Text = user.UserExtension.first_name;
            this.lastName.Text = user.UserExtension.last_name;
            if(user.UserExtension.gender == "Male")
            {
                this.radioMale.Checked = true;
            }else{
                this.radioFemale.Checked = true;
            }
            this.Question.Text = user.aspnet_Membership.PasswordQuestion;
            this.Answer.Text = user.aspnet_Membership.PasswordAnswer;
        }
    }
}