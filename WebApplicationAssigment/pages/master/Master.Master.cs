using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssigment.pages.master
{
    public partial class Master : System.Web.UI.MasterPage
    {
        private bool navigationOnly = false;
        public bool NavigationOnly
        {
            get
            {
                return this.navigationOnly;
            }
            set
            {
                this.navigationOnly = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}