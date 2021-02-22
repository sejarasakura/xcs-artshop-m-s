using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class ArtShop_Cust_Details : System.Web.UI.Page
    {
        public static Art art = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            init_data();
        }

        protected void init_data()
        {
            try
            {
                int id = Int32.Parse(Request["id"]);
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    art = db.Arts.Find(id); 
                }
            }
            catch { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }


}