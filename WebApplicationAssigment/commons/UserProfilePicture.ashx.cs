using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.commons
{
    /// <summary>
    /// Summary description for UserProfilePicture
    /// </summary>
    public class UserProfilePicture : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string guid = context.Request.QueryString["guid"].ToString();
            string role = context.Request.QueryString["role"].ToString();
            string _default = context.Request.QueryString["default"].ToString();
            byte[] data = null;
            byte[] roleData = null;
            UserExtension user;
            Artist artist;
            Customer cust;
            Staff staff;
            using (ArtShopEntities db = new ArtShopEntities())
            {
                user = db.UserExtensions.Find(Guid.Parse(guid));
                data = user.picture;
                switch (role)
                {
                    case "A":
                        artist = db.Artists.Find(Guid.Parse(guid));
                        roleData = artist.picture;
                        break;
                    case "C":
                        cust = db.Customers.Find(Guid.Parse(guid));
                        roleData = cust.picture;
                        break;
                    case "S":
                        staff = db.Staffs.Find(Guid.Parse(guid));
                        roleData = staff.picture;
                        break;
                }
            }
            try
            {
                if(roleData != null)
                {
                    context.Response.BinaryWrite((byte[])roleData);
                }
                else if (data != null)
                {
                    context.Response.BinaryWrite((byte[])data);
                }
                else
                {
                    context.Response.BinaryWrite(
                        Functions.ImmageAssetToByte(getSelectionImage(_default))
                    );
                }
            }
            catch
            {
                context.Response.BinaryWrite(
                    Functions.ImmageAssetToByte(getSelectionImage(_default))
                );
            }
        }

        private string getSelectionImage(string _default)
        {
            if (_default != null)
                return _default;
            else
                return "asset/profile.png";
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}