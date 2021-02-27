using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.pages.main.Profile
{
    public partial class Register : System.Web.UI.Page
    {
        bool firstTime = true;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

        }

        public static Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
                return root;

            return root.Controls.Cast<Control>()
               .Select(c => FindControlRecursive(c, id))
               .FirstOrDefault(c => c != null);
        }

        public string getFileUploadID(string id)
        {
            return FindControlRecursive(CreateUserWizard1, id).ClientID;
        }
        public string getImageID(string id)
        {
            return FindControlRecursive(CreateUserWizard1, id).ClientID;
        }

        protected void ChckedChangedArt(object sender, EventArgs e)
        {
            CheckBox artistCheckBox = (CheckBox)FindControlRecursive(CreateUserWizard1, "ArtistOnly");
            CheckBox custCheckBox = (CheckBox)FindControlRecursive(CreateUserWizard1, "CustomerOnly");
            HtmlGenericControl artExtensions = (HtmlGenericControl)FindControlRecursive(CreateUserWizard1, "artExtensions");
            HtmlGenericControl custExtensions = (HtmlGenericControl)FindControlRecursive(CreateUserWizard1, "custExtensions");
            if (firstTime)
            {
                custCheckBox.Checked = false;
                custExtensions.Visible = false;
            }
            artExtensions.Visible = artistCheckBox.Checked;
        }
        protected void ChckedChangedCustomer(object sender, EventArgs e)
        {
            CheckBox custCheckBox = (CheckBox)FindControlRecursive(CreateUserWizard1, "CustomerOnly");
            HtmlGenericControl custExtensions = (HtmlGenericControl)FindControlRecursive(CreateUserWizard1, "custExtensions");

            custExtensions.Visible = custCheckBox.Checked;
        }

        protected Guid getUserId()
        {
            MembershipUser newUser = Membership.GetUser(CreateUserWizard1.UserName);
            Guid newUserId = (Guid)newUser.ProviderUserKey;
            Console.Out.WriteLine("The user id is: " + newUserId);
            return newUserId;
        }

        protected void StepNextButton_Click(object sender, EventArgs e)
        {
            Guid userId = getUserId();
            TextBox fname = (TextBox)FindControlRecursive(CreateUserWizard1, "firstName");
            TextBox lname = (TextBox)FindControlRecursive(CreateUserWizard1, "lastName");
            TextBox date = (TextBox)FindControlRecursive(CreateUserWizard1, "birthdayDate");
            TextBox description = (TextBox)FindControlRecursive(CreateUserWizard1, "Description");
            FileUpload profilePicture = (FileUpload)FindControlRecursive(CreateUserWizard1, "FileUploader");
            FileUpload signature = (FileUpload)FindControlRecursive(CreateUserWizard1, "FileUploader2");
            DropDownList dropDownMember = (DropDownList)FindControlRecursive(CreateUserWizard1, "ddlMembership");
            CheckBox artistCheckBox = (CheckBox)FindControlRecursive(CreateUserWizard1, "ArtistOnly");
            CheckBox custCheckBox = (CheckBox)FindControlRecursive(CreateUserWizard1, "CustomerOnly");
            RadioButton radioMale = (RadioButton)FindControlRecursive(CreateUserWizard1, "radioMale");


            modal.Artist newArtist = new modal.Artist();
            modal.Customer newCustomer = new Customer();
            modal.UserExtension newUserExtension = new UserExtension();
            

            newArtist.UserId = getUserId();
            newCustomer.UserId = getUserId();
            newUserExtension.UserId = getUserId();


            newUserExtension.first_name = fname.Text;
            newUserExtension.last_name = lname.Text;
            newUserExtension.picture = profilePicture.FileBytes;
            newUserExtension.gender = radioMale.Checked?"Male":"Female";


            newArtist.signature = signature.FileBytes;
            newArtist.description = description.Text;
            newArtist.birthday_date = DateTime.ParseExact(date.Text, "yyyy-MM-dd", null);


            newCustomer.membership = dropDownMember.SelectedValue;
            newCustomer.birthday_date = DateTime.ParseExact(date.Text, "yyyy-MM-dd", null);


            using (ArtShopEntities db = new ArtShopEntities())
            {
                Console.Out.WriteLine(userId);
                db.UserExtensions.Add(newUserExtension);


                if (artistCheckBox.Checked)
                {
                    Roles.AddUserToRole(CreateUserWizard1.UserName, "Artist");
                    db.Artists.Add(newArtist);
                }
                if (custCheckBox.Checked)
                {
                    Roles.AddUserToRole(CreateUserWizard1.UserName, "Customer");
                    db.Customers.Add(newCustomer);
                }

                db.SaveChanges();
            }
        }


    }
}