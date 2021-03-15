using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;
using WebApplicationAssigment.commons;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using WebApplicationAssigment.pages.main.ArtShop;
using System.Web.Security;

namespace WebApplicationAssigment.pages.main.Artist.content
{
    public partial class AddNewArt : System.Web.UI.Page
    {
        protected List<Category> catergories = new List<Category>();
        protected List<CategoryCopy> allcats;
        protected string allCatStr;

        protected void Page_Init(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters.Add("UserId", Functions.getLoginUser().ProviderUserKey.ToString());
            using (ArtShopEntities db = new ArtShopEntities())
            {
                allcats = new List<CategoryCopy>();
                int p_level = Roles.GetRolesForUser().Contains("Administrator") ? 1 : 0;
                db.Categories.Where(c => c.enable == true && c.permission_level == p_level).ToList().ForEach(c => allcats.Add(new CategoryCopy(c)));
                allCatStr = JsonConvert.SerializeObject(allcats);
            }
        }
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setValidatorAndVisible(true);
            }

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
            JArray data = (JArray)JsonConvert.DeserializeObject(realCatergory.Value);
            using (ArtShopEntities db = new ArtShopEntities())
            {
                art.id = db.Arts.OrderByDescending(u => u.id).FirstOrDefault().id + 1; ;
                string fileName = art.id + "-" + art.title.Replace(" ", "-");
                string exe = new FileInfo(xFileUpload.PostedFile.FileName).Extension;
                art.image = "/assets/image/Art/" + fileName + exe;
                art.@virtual = Virtual.Checked;
                xFileUpload.SaveAs(Server.MapPath("~/assets/image/Art/") + fileName + exe);

                for (int i = 0; i < data.Count; i++)
                {
                    art.Categories.Add(db.Categories.Find(data[i].ToObject<int>()));
                }

                if (!Virtual.Checked)
                {
                    Painting p = new Painting();
                    p.art_id = art.id;
                    p.quantity = int.Parse(this.txbQuantity.Text);
                    p.weight_g = int.Parse(this.txbWeight.Text);
                    p.lenght_mm = int.Parse(this.txbLL.Text);
                    p.width_mm = int.Parse(this.txbWW.Text);
                    p.height_mm = int.Parse(this.txbHH.Text);
                    p.Address = db.Addresses.Find(Guid.Parse(ddlAddress.SelectedValue));

                    db.Paintings.Add(p);
                }

                try
                {
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
            CheckBox check = (CheckBox)sender;
            if (check.Checked)
            {
                setValidatorAndVisible(false);
            }
            else
            {
                setValidatorAndVisible(true);
            }
        }

        public void setValidatorAndVisible(bool choise)
        {
            this.ext1.Enabled = choise;
            this.ext2.Enabled = choise;
            this.ext3.Enabled = choise;
            this.ext4.Enabled = choise;
            this.ext5.Enabled = choise;
            this.ext6.Enabled = choise;
            this.ext7.Enabled = choise;
            this.ext8.Enabled = choise;
            this.ext9.Enabled = choise;
            this.ext10.Enabled = choise;

            this.NotVirtualExtensions.Visible = choise;
            this.Virtual.Checked = !choise;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["AccountMenuSession"] = "#address";
            Response.Redirect(Constant.PROFILE_URL + "/MyAccount.aspx");
        }
    }
}