using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace WebApplicationAssigment.commons
{
    public class Functions
    {
        public static byte[] ImmageAssetToByte(String path)
        {
            byte[] imageBytes = null;
            using (var webClient = new WebClient())
            {
                imageBytes = webClient.DownloadData("https://" + HttpContext.Current.Request.Url.Authority + path);
            }
            return imageBytes;
        }
    }
}