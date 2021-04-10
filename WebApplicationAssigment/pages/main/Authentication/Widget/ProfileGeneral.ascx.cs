using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;
using WebApplicationAssigment.modal;
using System.Data.Entity.Migrations;
using Microsoft.EntityFrameworkCore;
using System.Data.Entity.Validation;


namespace WebApplicationAssigment.pages.main.Authentication.Widget
{
    public partial class ProfileGeneral : System.Web.UI.UserControl
    {
        public System.Guid loginUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                loginUser = (Guid)Functions.getLoginUser().ProviderUserKey;
                putData(db.aspnet_Users.Find(loginUser));
            }
        }

        protected void setAccesbility()
        {
            Emails.ReadOnly = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                try
                {
                    updatesData(db);
                    db.SaveChanges();
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.SUCCESS_TYPE,
                        "Updates completed", "Your informations is up to date"));
                }
                catch (Exception ex)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Updates fail", ex.Message));
                }
            }
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

            db.aspnet_Membership.AddOrUpdate(am);
            db.UserExtensions.AddOrUpdate(ux);
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
        }
    }
}