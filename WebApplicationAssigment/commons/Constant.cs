﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAssigment.commons
{
    public class Constant
    {
        public static readonly String COMPANY_CODE = "";
        public static readonly String COMPANY_NAME = "";
        public static readonly String COMPANY_LOGO = "";
        public static readonly String COMPANY_PHONE = "";

        public static readonly string DEFAULT_URL = "https://" + HttpContext.Current.Request.Url.Authority;
        public static readonly string PAGES_URL = DEFAULT_URL + "/pages";
        public static readonly string ADMIN_URL = PAGES_URL + "/main/admin";
        public static readonly string HOME_URL = PAGES_URL + "/main/Home.aspx";
        public static readonly string ARTIST_URL = PAGES_URL + "/main/Artist/content";
        public static readonly string IMAGE_URL = PAGES_URL + "/diagram_reader";
        public static readonly string AUTH_URL = PAGES_URL + "/main/Authentication";
    }
}