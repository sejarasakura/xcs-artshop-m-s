using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace WebApplicationAssigment.pages.main.ArtShop
{
    public partial class AddArtWorkTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUploadAdd_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;attachdbfilename=|DataDirectory|\\UserDB.mdf;integrated security=True;");


            string path = Server.MapPath("Image/");

            if (fuAddImage.HasFile)
            {
                string ext = Path.GetExtension(fuAddImage.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
                {
                    fuAddImage.SaveAs(path + fuAddImage.FileName);
                    string name = "Image/" + fuAddImage.FileName;
                    string ss = "INSERT INTO Artwork(artworkName, artworkImage, artworkQty, artworkDesc, artworkPrice) VALUES('" + txtAddArtsName.Text + "', '" + name + "', '" + txtAddStock.Text + "', '" + txtAddDesc.Text + "', '" + txtAddPrice.Text + "')";

                    SqlCommand cmd = new SqlCommand(ss, connection);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();

                    lblMessage.Visible = true;
                    lblMessage.Text = "Upload succesfully...";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    txtAddArtsName.Text = "";
                    txtAddDesc.Text = "";
                    txtAddPrice.Text = "";
                    txtAddStock.Text = "";
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "You have to upload jpg, png or jpeg file only...";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please select file..";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Artwork(gallery)artist.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAddArtsName.Text = "";
            txtAddDesc.Text = "";
            txtAddPrice.Text = "";
            txtAddStock.Text = "";
        }
    }
    }
}