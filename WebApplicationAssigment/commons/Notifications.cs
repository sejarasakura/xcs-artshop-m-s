using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAssigment.commons
{
    public class Notifications
    {
        public static readonly string WARNING_TYPE = "warning";
        public static readonly string SUCCESS_TYPE = "success";
        public static readonly string ERROR_TYPE = "error";
        public static readonly string INFO_TYPE = "info";

        public static readonly int DEFAULT_TIMES = 1;

        public int times { get; set; }
        public string type { get; set; }
        public string title { get; set; }
        public string detail { get; set; }

        public Notifications(int times, string type, string title, string detail)
        {
            this.times = times;
            this.type = type;
            this.title = title;
            this.detail = detail;
        }

        public Notifications(string type, string title, string detail)
        {
            this.times = DEFAULT_TIMES;
            this.type = type;
            this.title = title;
            this.detail = detail;
        }
    }
}