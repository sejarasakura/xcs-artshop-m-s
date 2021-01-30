using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssigment.pages.widget
{
    public partial class ProfilePicture : System.Web.UI.UserControl
    {
        public int PictureSize
        {
            get; set;
        }
        public int UserID
        {
            get; set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Content.Style.Add(HtmlTextWriterStyle.Width, PictureSize.ToString());
            Content.Style.Add(HtmlTextWriterStyle.Height, PictureSize.ToString());
        }
    }
}