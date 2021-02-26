using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAssigment.pages.diagram_reader
{
    public class XWebConfig
    {
        public static XWebConfig instance = new XWebConfig();

        private string con;
        public string ConnectionString
        {
            get{return this.con;}
        }
        XWebConfig()
        {
            con = System.Configuration.ConfigurationManager.ConnectionStrings["CustomArtShopEntities"].ConnectionString;
        }
    }
}