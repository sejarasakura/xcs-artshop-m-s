
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
using System;

namespace WebApplicationAssigment.pages.Payment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Guid paymentId;
        protected PublicBank bank;
        protected modal.Payment payments;
        protected void Page_Load(object sender, EventArgs e)
        {
            Functions.checkValidPayment(Request.QueryString["id"]);
            paymentId = Guid.Parse(Request.QueryString["id"]);
            if (Session[Constant.ACCOUNT_SESSION] == null)
            {
                Response.Redirect("~");
                return;
            }

            using (ArtShopEntities db = new ArtShopEntities())
            {
                bank = db.PublicBanks.Find(Session[Constant.ACCOUNT_SESSION]);
                payments = db.Payments.Find(paymentId);
                CardName.Text = bank.bank_account;
                CardPass.Text = DateTime.Now.ToString();
                Label1.Text = payments.total_pay.ToString();
            }
        }

        protected void confirmPayment(object sender, EventArgs e)
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                bank.amount -= (decimal)payments.total_pay;
                payments.payment_status = Guid.Parse("c595596d-8980-4138-bc20-a91056e1b1ce");
                payments.payment_method = Guid.Parse("1c98a7a8-6449-4ca4-be81-8b21f1cc12e0");
                payments.payment_meta = bank.bank_account;
                payments.customer_paid = payments.total_pay;
                payments.payment_date = DateTime.Now;

                db.Payments.AddOrUpdate(payments);
                db.PublicBanks.AddOrUpdate(bank);

                try
                {
                    db.SaveChanges();
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.SUCCESS_TYPE,
                        "Payment sucessfull!!",
                        "you have complete the payment using following account: " + bank.bank_account + ""));
                    Functions.sendPaymentMail(payments);
                }
                catch (Exception ex)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Payment Failed!!",
                        "you have following exception : " + ex.Message + " !!"));
                }
            }
        }
    }
}