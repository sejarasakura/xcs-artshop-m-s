using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.Authentication.Profile
{
    public partial class MyOrder : System.Web.UI.Page
    {
        Guid user_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = (Guid)Functions.getLoginUser().ProviderUserKey; ;
            if (!Page.IsPostBack)
            {
                SqlDataSource2.SelectParameters.Add("user_id", DbType.Guid, user_id.ToString());
            }
        }


        protected void RepeaterOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal MyLiteral = (Literal)e.Item.FindControl("MyLiteral");
            Repeater rpt_child = e.Item.FindControl("RepeaterOrderDetails") as Repeater;
            if (MyLiteral == null)
                return;
            try
            {
                rpt_child.DataSource = OrderDetailsDataTable(int.Parse(MyLiteral.Text));
                rpt_child.DataBind();
            }
            catch (Exception ex)
            {  
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.ERROR_TYPE,
                    "Rocord searching!!",
                    "<strong>You had occur an error in RepeaterOrder_ItemDataBound!!!</strong> " + ex.Message + "<br />"));
            }
        }

        protected List<Art> OrderDetailsDataTable(int order_id)
        {
            string sql = "SELECT Art.art_id as id, Art.[image] as [image], " +
                "Art.date as date, " +
                "[UserExtension].first_name + ' ' + [UserExtension].last_name as [description], " +
                "Art.price as price, [PaymentDetails].product_quantity as artist_id, " +
                "Art.[title] as [title] " +
                "FROM [Art], [PaymentDetails], [UserExtension] " +
                "WHERE PaymentDetails.payment_id = @order_id AND " +
                "Art.artist_id = [UserExtension].[UserId] AND " +
                "art_id = PaymentDetails.art_id";
            using (ArtShopEntities db = new ArtShopEntities())
            {
                var da = db.Arts.SqlQuery(sql, new SqlParameter("@order_id", order_id));
                try
                {
                    return da.ToList();
                }
                catch (Exception ex)
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Rocord searching!!",
                        "<strong>You had occur an error in RepeaterOrder_ItemDataBound!!!</strong> " + ex.Message + "<br />"));
                }
            }
            return null;
        }

        protected string convert_user_role(PaymentStatu user_r)
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                return user_r.name;
            }
        }
        protected string convert_css_class(PaymentStatu userRole)
        {
            if (userRole.id == Guid.Parse(""))
                return "label-success";
            else if (userRole.id == Guid.Parse("20bd9f32-b531-4b7f-a89a-80babe9aa707"))
                return "label-warning";
            else if (userRole.id == Guid.Parse("80e85ebb-7401-45be-8080-4d16df2177bf"))
                return "label-danger";
            else if (userRole.id == Guid.Parse("dd4a293f-8a90-4050-acae-9efafc5b87fe"))
                return "label-danger";
            else if (userRole.id == Guid.Parse("c595596d-8980-4138-bc20-a91056e1b1ce"))
                return "label-success";
            else
                return "label-danger";
        }
    }
}