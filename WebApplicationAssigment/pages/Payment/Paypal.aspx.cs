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
    public partial class Paypal : System.Web.UI.Page
    {
        private Guid paymentId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Functions.checkValidPayment(Request.QueryString["id"]);
            paymentId = Guid.Parse(Request.QueryString["id"]);
        }
        protected modal.PayPal getData()
        {
            modal.PayPal id = new modal.PayPal();
            id.paypal_id = CardNumber.Text;
            id.name = CardName.Text;
            id.email = CardExp.Text;
            id.password = CardPass.Text;
            return id;
        }
        protected void confirmPayment(object sender, EventArgs e)
        {

            PayPal card = getData();

            using (ArtShopEntities db = new ArtShopEntities())
            {
                PayPal database = db.PayPals.Find(card.paypal_id);
                modal.Payment payments = db.Payments.Find(paymentId);
                if (database == null)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Invalid paypal account!!",
                        "paypal account not corrects"));
                    return;
                }
                if (database.paypal_id != card.paypal_id)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Account is not match"));
                    return;
                }
                if (database.name != card.name)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Name is not match"));
                    return;
                }
                if (database.password != card.password)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Passwords is not match"));
                    return;
                }
                modal.Payment pay = db.Payments.Find(paymentId);

                if ((double)database.amount < pay.total_pay)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Not enought amount!!",
                        "Your accocunt only remain " + database.amount));
                    return;
                }

                database.amount -= (decimal)pay.total_pay;
                payments.payment_status = Guid.Parse("c595596d-8980-4138-bc20-a91056e1b1ce");
                payments.payment_method = Guid.Parse("9244ee14-b4b5-4f2c-833b-3b3c18d68764");
                payments.payment_meta = database.paypal_id;
                payments.customer_paid = payments.total_pay;
                payments.payment_date = DateTime.Now;

                db.Payments.AddOrUpdate(payments);
                db.PayPals.AddOrUpdate(database);

                try
                {
                    db.SaveChanges();
                    Functions.EnqueueNewNotifications(new Notifications(
                        2,
                        Notifications.SUCCESS_TYPE,
                        "Payment sucessfull!!",
                        "you have complete the payment with your paypal account: " + database.paypal_id + ""));
                    Functions.sendPaymentMail(payments);
                }
                catch (Exception ex)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        2,
                        Notifications.ERROR_TYPE,
                        "Payment Failed!!",
                        "you have following exception : " + ex.Message + " !!"));
                }
            }
        }
    }
}