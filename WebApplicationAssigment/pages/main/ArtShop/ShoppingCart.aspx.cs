﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            double total;

            using (ArtShopEntities db = new ArtShopEntities())
            {

                total = 0;
                Guid id = (Guid)Functions.getLoginUser().ProviderUserKey;
                
                IQueryable<vw_customer_cart> x = db.vw_customer_cart.Where(s => s.user_id == id);
                vw_customer_cart[] y = x.ToArray();
                for (int i = 0; i < x.Count(); i++)
                {
                    total += Convert.ToDouble(y[i].price);
                }

                SqlDataSource1.SelectParameters.Remove(new Parameter("@user_id"));
                SqlDataSource1.SelectParameters.Add("user_id", id.ToString());
                int cart_id = db.Carts.Where(s => s.user_id == id).FirstOrDefault().id;
                SqlDataSource1.DeleteParameters.Remove(new Parameter("@cart_id"));
                SqlDataSource1.DeleteParameters.Add("cart_id", cart_id.ToString());



                totalprice.Text ="Total price : RM" + total.ToString();
            }
        }

    }
}