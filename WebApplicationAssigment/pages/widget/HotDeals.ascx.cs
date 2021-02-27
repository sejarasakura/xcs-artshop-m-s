using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.widget
{
    public partial class HotDeals : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                List<Art> ts = db.Arts.ToList();
                Repeater1.DataSource = ts.GetRange(0, ts.Count >= 5?5:ts.Count);

            }
        }
    }
}