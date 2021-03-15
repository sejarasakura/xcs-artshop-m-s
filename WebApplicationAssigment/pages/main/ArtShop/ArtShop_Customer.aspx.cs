using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class ArtShop_Customer : System.Web.UI.Page
    {
        public Category cat;
        public Art[] arts;
        public int i;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void details_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ArtShop_Cust_Details.aspx");
        }
    }
}