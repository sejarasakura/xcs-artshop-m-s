using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
namespace WebApplicationAssigment.commons
{
    public class Functions
    {
        public static byte[] ImmageAssetToByte(string path)
        {
            byte[] imageBytes = null;
            using (var webClient = new WebClient())
            {
                imageBytes = webClient.DownloadData(Constant.DEFAULT_URL + path);
            }
            return imageBytes;
        }

        public static MembershipUser getLoginUser()
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                MembershipUser user = Membership.GetUser(
                    HttpContext.Current.User.Identity.Name
                );
                // (Guid) user.ProviderUserKey
                return user;
            }
            return null;
        }

    }
}