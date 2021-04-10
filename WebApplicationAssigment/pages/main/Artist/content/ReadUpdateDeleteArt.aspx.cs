using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;
using System.Data.Entity.Migrations;
using Microsoft.EntityFrameworkCore;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.main.Artist.content
{
    public partial class ReadUpdateDeleteArt : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void Delete(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int x = int.Parse(btn.CommandArgument);

            using (ArtShopEntities db = new ArtShopEntities())
            {
                Art art = db.Arts.Find(x);
                if(art != null)
                {
                    try { 
                        db.Arts.Remove(art);
                        db.SaveChanges();
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.SUCCESS_TYPE,
                            "Deleted Sucessful!!",
                            "you have deleted sucessful !!"));
                    }
                    catch (Exception ex)
                    {
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.ERROR_TYPE,
                            "Deleted Failed!!",
                            "you have following exception : " + ex.Message + " !!"));
                    }
                }
                else
                {
                    Functions.EnqueueNewNotifications(new Notifications(
                        Notifications.ERROR_TYPE,
                        "Deleted Failed!!",
                        "Art not founds !!"));
                }
            }
        }

    }
}