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
           string guid = context.Request.QueryString["guid"] != null ? context.Request.QueryString["guid"].ToString():"";
            string role = context.Request.QueryString["role"] != null ? context.Request.QueryString["role"].ToString():"";
            string _default = context.Request.QueryString["default_image"] != null ? context.Request.QueryString["default_image"].ToString():"";
            byte[] data = null;
            byte[] roleData = null;
            UserExtension user;
            Artist artist;
            Customer cust;
            Staff staff;
            context.Response.Clear();
            using (ArtShopEntities db = new ArtShopEntities())
            {
                user = db.UserExtensions.Find(Guid.Parse(guid));
                if(user != null)
                    data = user.picture;
                if(role != null)
                {
                    switch (role)
                    {
                        case "A":
                            artist = db.Artists.Find(Guid.Parse(guid));
                            if (artist != null)
                                roleData = artist.picture;
                            break;
                        case "C":
                            cust = db.Customers.Find(Guid.Parse(guid));
                            if (cust != null)
                                roleData = cust.picture;
                            break;
                        case "S":
                            staff = db.Staffs.Find(Guid.Parse(guid));
                            if (staff != null)
                                roleData = staff.picture;
                            break;
                    }
                }
            }
            try
            {
                if(roleData != null ? data.Length > 0: false)
                {
                    context.Response.BinaryWrite(roleData);
                }
                else if (data != null ? data.Length > 0 : false)
                {
                    context.Response.BinaryWrite(data);
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
                if (_default.Length > 0)
                    return _default;

            return "assets/image/profile.png";
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