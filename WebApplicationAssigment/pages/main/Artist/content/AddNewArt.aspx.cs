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
            art.image = "asdafas";
            art.category_id = int.Parse(this.Category.SelectedItem.Value);
            using (ArtShopEntities db = new ArtShopEntities())
            {
                
                art.id=db.Arts.Count()+1;
                string fileName = art.id + "-" + art.title;
                FileUpload.SaveAs(Server.MapPath("~/assets/image/Art/") + fileName);
                try
                {
                //    string fileName = "adasd";
                  //  FileUpload.SaveAs(Server.MapPath("~/asset/image/Art/") + fileName);
                    db.Arts.Add(art);
                    db.SaveChanges();
                  //  Art result = db.Arts.LastOrDefault<Art>();
                  //  string fileName = result.id + "-" + result.title;
                   // FileUpload.SaveAs(Server.MapPath("~/asset/image/Art/") + fileName);


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
    }
}