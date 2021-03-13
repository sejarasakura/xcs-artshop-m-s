using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.main.Artist.content
{
    public partial class AddNewArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Art art = new Art();
          //  Art atr2;
            art.title = this.TitleText.Text;
            art.description = this.Discription.Text;
            art.date = this.DateCreation.Text;
            art.price = decimal.Parse(this.Price.Text);
            art.artist_id = (Guid)Functions.getLoginUser().ProviderUserKey;
            using (ArtShopEntities db = new ArtShopEntities())
            {
                art.id = db.Arts.OrderByDescending(u => u.id).FirstOrDefault().id + 1; ;
                string fileName = art.id + "-" + art.title.Replace(" ", "-");
                string exe = new FileInfo(xFileUpload.PostedFile.FileName).Extension;
                art.image = "/assets/image/Art/" + fileName + exe;
                xFileUpload.SaveAs(Server.MapPath("~/assets/image/Art/") + fileName + exe);
                try
                {
                    string coulmn_name = art.id.GetType().Name;

                    db.Arts.Add(art);
                    db.SaveChanges();
                }
                catch (Exception x)
                {
                    Console.Out.WriteLine(x.Message);
                }
            }
            Response.Redirect("ReadUpdateDeleteArt.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NonVirtual_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}