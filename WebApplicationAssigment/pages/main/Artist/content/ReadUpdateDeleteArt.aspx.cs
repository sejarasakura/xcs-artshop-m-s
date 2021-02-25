using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssigment.pages.main.Artist.content
{
    public partial class ReadUpdateDeleteArt : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
          

            
          //  GridView1.DataSource = (DataTable)ViewState["Customers"];

          

            dt.Rows.Add("a", "a", "a", "a", "a", "a");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}