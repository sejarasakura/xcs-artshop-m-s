using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;
using WebApplicationAssigment.modal;
using System.Data.Entity.Migrations;
using Microsoft.EntityFrameworkCore;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class CartSections : System.Web.UI.UserControl
    {
        protected int cart_id = 0;
        protected double total;
        public Guid id;
        public int i;
        int totalCount = 0, checkedCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = (Guid)Functions.getLoginUser().ProviderUserKey;
            if (!Page.IsPostBack)
            {
                SqlDataSource1.SelectParameters.Add("user_id", DbType.Guid, id.ToString());
                SqlDataSource2.SelectParameters.Add("user_id", DbType.Guid, id.ToString());
            }
            using (ArtShopEntities db = new ArtShopEntities())
            {
                total = 0;
                totalCount = 0;
                checkedCount = 0;
                if (check_cart_count(db))
                {
                    retriveDataAndAnalysis(db);
                }

                //totalprice.Text = "Total price : RM" + total.ToString();
            }

        }
        private void retriveDataAndAnalysis(ArtShopEntities db)
        {
            IQueryable<vw_customer_cart2> x = db.vw_customer_cart2.Where(s => s.user_id == id);
            vw_customer_cart2[] y = x.ToArray();
            Painting paint;
            for (int i = 0; i < x.Count(); i++)
            {
                if (y[i].@virtual)
                {
                    if (y[i].@checked ?? false)
                    {
                        total += Convert.ToDouble(y[i].price);
                        checkedCount++;
                    }
                }
                else
                {
                    if (y[i].@checked ?? false)
                    {
                        checkedCount++;
                        total += (Convert.ToDouble(y[i].price) * (double)y[i].availability);
                    }
                }
            }
            totalCount = x.Count();
            this.lblCount.Text = checkedCount + "";
            this.lblTotal.Text = totalCount + "";
            this.lblTotalPrice.Text = "RM " + total.ToString("0.00");
        }
        private bool check_cart_count(ArtShopEntities db)
        {
            Cart cart_record = db.Carts.Where(s => s.user_id == id).FirstOrDefault();

            if (cart_record != null ? cart_record.CartDetails.Count > 0 : false)
            {
                cart_id = cart_record.id;
                GotCart.Visible = true;
                NoCartFound.Visible = false;
                return true;
            }
            else
            {
                NoCartFound.Visible = true;
                GotCart.Visible = false;
                return false;
            }
        }

        protected string setCatergory(int cat_id)
        {
            string r = "";
            using (ArtShopEntities db = new ArtShopEntities())
            {
                r = db.Categories.Find(cat_id).name;
            }
            return r;
        }
        protected string setAvability(int avb_id)
        {
            return avb_id >= 1 ? "Yes" : "No";
        }
        protected void btnDeleteEvent(object sender, CommandEventArgs e)
        {
            int crow;
            crow = Convert.ToInt32(e.CommandArgument.ToString());
            deleterowdata(crow);

            using (ArtShopEntities db = new ArtShopEntities())
                check_cart_count(db);
        }

        private void deleterowdata(int rollno)
        {
            try
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    CartDetail c = db.CartDetails.Find(cart_id, rollno);
                    db.CartDetails.Remove(c);
                    db.SaveChanges();

                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.SUCCESS_TYPE,
                        "Deleted Sucessful!!",
                        "you have remove item form your cart !!"));
                }
            }
            catch (Exception e)
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.ERROR_TYPE,
                    "Deleted Failed!!",
                    "you have following exception : " + e.Message + " !!"));
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            var chk = (CheckBox)sender;
            var CommandName = chk.Attributes["CommandName"];
            int id = int.Parse(CommandName);

            using (ArtShopEntities db = new ArtShopEntities())
            {
                try
                {
                    CartDetail cd = db.Carts.Find(cart_id).CartDetails.Where(c => c.art_id == id).FirstOrDefault();
                    cd.@checked = chk.Checked;
                    db.CartDetails.AddOrUpdate(cd);
                    db.SaveChanges();

                    total = 0;
                    totalCount = 0;
                    checkedCount = 0;
                    if (check_cart_count(db))
                    {
                        retriveDataAndAnalysis(db);
                    }
                }
                catch (Exception ex)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Deleted Failed!!",
                        "you have following exception : " + ex.Message + " !!"));
                }
            }
            Repeater2.DataBind();
        }

        protected void input_number_TextChanged(object sender, EventArgs e)
        {
            var chk = (TextBox)sender;
            var CommandName = chk.Attributes["CommandName"];
            int id = int.Parse(CommandName);
            var number = chk.Text;
            int quantity = int.Parse(number);

            if(quantity <= 0)
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.ERROR_TYPE,
                    "Quantity out of bound!!",
                    "you must enter the quantity that more than 0 !!"));
                return;
            }

            using (ArtShopEntities db = new ArtShopEntities())
            {
                try
                {
                    CartDetail cd = db.Carts.Find(cart_id).CartDetails.Where(c => c.art_id == id).FirstOrDefault();
                    
                    if (cd.Art.@virtual == false)
                    {
                        if (quantity > cd.Art.Painting.quantity)
                        {
                            Functions.EnqueueNewNotifications(new Notifications(
                                Notifications.ERROR_TYPE,
                                "Out of stocks!!",
                                "The following product is out of stocks !! seller only provide " + cd.Art.Painting.quantity + " items!!"));
                        }
                        else
                        {
                            cd.availability = quantity;
                            db.CartDetails.AddOrUpdate(cd);
                            db.SaveChanges();

                            total = 0;
                            totalCount = 0;
                            checkedCount = 0;
                            if (check_cart_count(db))
                            {
                                retriveDataAndAnalysis(db);
                            }
                            Functions.EnqueueNewNotifications(new Notifications(
                                Notifications.SUCCESS_TYPE,
                                "Updates complete!!",
                                ""));
                        }
                    }
                    else
                    {
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.ERROR_TYPE,
                            "Non virtul type",
                            "Virtual products cannot select quantity!!"));
                    }
                }
                catch (Exception ex)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Deleted Failed!!",
                        "you have following exception : " + ex.Message + " !!"));
                }
            }

            Repeater2.DataBind();
        }

        protected string createdLWH(object l, object w, object h)
        {            
            {
                return l + " mm * " + w + " mm * " + h + " mm ";
            }
        }
    }
}