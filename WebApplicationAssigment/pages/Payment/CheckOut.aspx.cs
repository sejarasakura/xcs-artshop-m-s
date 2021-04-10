using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.Payment
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private Guid paymentId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Functions.checkValidPayment(Request.QueryString["id"]);
            paymentId = Guid.Parse(Request.QueryString["id"]);
        }
    }
}