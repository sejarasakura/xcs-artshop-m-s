using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplicationAssigment.modal;

namespace WebApplicationAssigment.commons
{
    /// <summary>
    /// Summary description for ArtistSigniture
    /// </summary>
    public class ArtistSigniture : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string guid = context.Request.QueryString["guid"].ToString();
            string _default = context.Request.QueryString["default"].ToString();
            byte[] data = null;
            Artist artist;
            using (ArtShopEntities db = new ArtShopEntities())
            {
                artist = db.Artists.Find(Guid.Parse(guid));
                data = artist.signature;
            }
            try
            {
                if (data != null)
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
                return "asset/signature.png";
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