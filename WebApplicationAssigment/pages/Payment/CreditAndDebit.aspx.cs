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
    public partial class CreditAndDebit : System.Web.UI.Page
    {
        private int paymentId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Functions.checkValidPayment(Request.QueryString["id"]);
            paymentId = int.Parse(Request.QueryString["id"]);
        }
        protected Card getData()
        {
            Card card = new Card();
            card.card_number = CardNumber.Text;
            card.name = CardName.Text;
            card.exp_date = DateTime.Parse(CardExp.Text);
            card.ccv = CardCcv.Text;
            return card;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Card card = getData();

            using (ArtShopEntities db = new ArtShopEntities())
            {
                Card database = db.Cards.Find(card.card_number);
                modal.Payment payments = db.Payments.Find(paymentId);
                if(database == null)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Invalid card number!!",
                        "Wrong card numbers"));
                    return;
                }
                if(database.ccv != card.ccv)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "CCV is not match"));
                    return;
                }
                if(database.name != card.name)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Name is not match"));
                    return;
                }
                if(database.exp_date != card.exp_date)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Unassessable!!",
                        "Exp date is not match"));
                    return;
                }
                modal.Payment pay = db.Payments.Find(paymentId);
                
                if((double)database.amount < pay.total_pay)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Not enought amount!!",
                        "Your card is only remain " + database.amount));
                    return;
                }

                database.amount -= (decimal)pay.total_pay;
                payments.payment_status = Guid.Parse("c595596d-8980-4138-bc20-a91056e1b1ce");
                payments.payment_method = Guid.Parse("9244ee14-b4b5-4f2c-833b-3b3c18d68764");
                payments.payment_meta = database.card_number;
                payments.customer_paid = payments.total_pay;
                payments.payment_date = DateTime.Now;

                db.Payments.AddOrUpdate(payments);
                db.Cards.AddOrUpdate(database);

                try
                {
                    db.SaveChanges();
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.SUCCESS_TYPE,
                        "Payment sucessfull!!",
                        "you have used the card " + database.card_number + " complete the payment"));
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