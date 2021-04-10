using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;

namespace WebApplicationAssigment.pages.Payment
{
    public partial class SelectMethod : System.Web.UI.Page
    {
        protected Guid paymentId;

        protected void Page_Init(object sender, EventArgs e)
        {
            Functions.checkValidPayment(Request.QueryString["id"]);
            paymentId = Guid.Parse(Request.QueryString["id"]);
        }


    }
}