//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplicationAssigment.modal
{
    using System;
    using System.Collections.Generic;
    
    public partial class vw_customer_cart
    {
        public int id { get; set; }
        public string image { get; set; }
        public decimal price { get; set; }
        public string date { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public System.Guid artist_id { get; set; }
        public bool @virtual { get; set; }
        public System.Guid user_id { get; set; }
        public Nullable<int> availability { get; set; }
        public Nullable<bool> @checked { get; set; }
        public Nullable<System.DateTime> add_date { get; set; }
    }
}
