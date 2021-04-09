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
        protected string artId;
        protected bool editMode;

        protected void Page_Init(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters.Add("UserId", Functions.getLoginUser().ProviderUserKey.ToString());
            using (ArtShopEntities db = new ArtShopEntities())
            {
                allcats = new List<CategoryCopy>();
                int p_level = Roles.GetRolesForUser().Contains("Administrator") ? 1 : 0;
                db.Categories.Where(c => c.enable == true && c.permission_level <= p_level)
                    .ToList().ForEach(c => allcats.Add(new CategoryCopy(c)));
                allCatStr = JsonConvert.SerializeObject(allcats);
            }
            artId = Request.QueryString["id"];
            editMode = artId != null;
        }
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setValidatorAndVisible(true);
                if (editMode)
                {
                    using (ArtShopEntities db = new ArtShopEntities())
                    {
                        try
                        {
                            Art art = db.Arts.Find(int.Parse(artId));
                            this.putData(art);
                        }
                        catch (Exception ex)
                        {
                            Functions.EnqueueNewNotifications(new Notifications(
                                Notifications.ERROR_TYPE,
                                "Art not found!!",
                                "you have following exception : " + ex.Message + " !!"));
                        }
                    }
                    btnSubmit.Text = "Updates Art";
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            if (this.editMode)
            {

            }
            else
            {
                addNew();
            }
        }

        protected void putData(Art art)
        {
            List<int> catrgory_data = new List<int>();
            string catergory_preview = "";
            art.Categories.ToList().ForEach(c => catrgory_data.Add(c.id));
            art.Categories.ToList().ForEach(c => catergory_preview += "<span style='background-color: " + c.color + "; padding: 5px' class='badge mr-1 card-link-secondary'>" + c.name + " <span onclick=\"deletedataintcat(this, " + c.id + ")\"><i class='delete fa fa-times text-danger' aria-hidden='true'></i></span></span>");
            this.TitleText.Text = art.title;
            this.Discription.Text = art.description;
            this.DateCreation.Text = art.date;
            this.Price.Text = art.price.ToString();
            this.cat_preview.InnerHtml = catergory_preview;
            this.realCatergory.Value = JsonConvert.SerializeObject(catrgory_data);
            this.Image1.ImageUrl = art.image;
            this.Virtual.Checked = art.@virtual;
            setValidatorAndVisible(!art.@virtual);
            if (!art.@virtual)
            {
                this.txbQuantity.Text = art.Painting.quantity.ToString();
                this.txbWeight.Text = art.Painting.width_mm.ToString();
                this.txbLL.Text = art.Painting.lenght_mm.ToString();
                this.txbWW.Text = art.Painting.width_mm.ToString();
                this.txbHH.Text = art.Painting.height_mm.ToString();
                this.address_preview.InnerHtml = art.Painting.Address.details;
            }
        }
        protected Art getData(ArtShopEntities db)
        {
            Art art = new Art();
            //  Art atr2;
            art.title = this.TitleText.Text;
            art.description = this.Discription.Text;
            art.date = this.DateCreation.Text;
            art.price = decimal.Parse(this.Price.Text);
            art.artist_id = (Guid)Functions.getLoginUser().ProviderUserKey;
            JArray data = (JArray)JsonConvert.DeserializeObject(realCatergory.Value);
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
                art.Categories.Add(db.Categories.Find(7));
            }
            else
            {
                art.Categories.Add(db.Categories.Find(8));
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

                art.Painting = p;
            }

            if (!this.editMode)
            {
                art.id = db.Arts.OrderByDescending(u => u.id).FirstOrDefault().id + 1; ;
            }
            else
            {
                art.id = int.Parse(artId);
            }
            return art;
        }
        protected void addNew()
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Art art = getData(db);
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
        
        protected void updates()
        {
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Art art = getData(db);
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