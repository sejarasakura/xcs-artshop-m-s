using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplicationAssigment.modal;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;
using System.Data.Entity.Migrations;
using Microsoft.EntityFrameworkCore;
using System.Web.Security;

namespace WebApplicationAssigment.pages.Payment
{
    public partial class OnlineBanking : System.Web.UI.Page
    {
        private int paymentId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Functions.checkValidPayment(Request.QueryString["id"]);
            paymentId = int.Parse(Request.QueryString["id"]);
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = this.CardName.Text;
            string pass = this.CardPass.Text;

            using (ArtShopEntities db = new ArtShopEntities())
            {
                PublicBank database = db.PublicBanks.Find(name);
                modal.Payment payments = db.Payments.Find(paymentId);
                if (database == null)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Invalid card number!!",
                        "Wrong card numbers"));
                    return;
                }
                if (database.bank_username != name)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Username not match"));
                    return;
                }
                if (database.password != pass)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Password not match"));
                    return;
                }
                if ((double)database.amount < payments.total_pay)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Not enought amount!!",
                        "Your card is only remain " + database.amount));
                    return;
                }
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.SUCCESS_TYPE,
                    "Login sucessfull!!",
                    "Welcome, "  + database.bank_username));

                Session[Constant.ACCOUNT_SESSION] = database.bank_account;
                Response.Redirect("~/pages/Payment/PublicBank.aspx?id=" + this.paymentId);
            }
        }
    }
}