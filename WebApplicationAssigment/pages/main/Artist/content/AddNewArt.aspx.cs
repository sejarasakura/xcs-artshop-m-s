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
            art.title = this.TitleText.Text;
            art.description = this.Discription.Text;
            art.date = this.DateCreation.Text;
            art.price = decimal.Parse(this.Price.Text);
            art.artist_id = (Guid)Functions.getLoginUser().ProviderUserKey;
            using (ArtShopEntities db = new ArtShopEntities())
            {
                art.id = db.Arts.Count() <= 0 ? 1 : db.Arts.OrderByDescending(u => u.id).FirstOrDefault().id + 1;
                try
                {
                    string fileName = art.id + "-" + art.title;
                    art.image = "/asset/image/Art/" + fileName;
                    Art result = db.Arts.Add(art);
                    Console.Out.WriteLine(fileName);
                    xFileUpload.SaveAs(Server.MapPath(Constant.DEFAULT_URL + "/asset/image/Art/") + fileName);
                    db.SaveChanges();
                }
                catch (Exception x)
                {
                    Console.Out.WriteLine(x.Message);
                }
            }
        }
    }
}