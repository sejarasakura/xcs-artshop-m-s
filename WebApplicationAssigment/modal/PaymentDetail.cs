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
    
    public partial class PaymentDetail
    {
        public int payment_id { get; set; }
        public int art_id { get; set; }
        public Nullable<bool> availability { get; set; }
        public Nullable<System.DateTime> add_date { get; set; }
    
        public virtual Art Art { get; set; }
        public virtual Payment Payment { get; set; }
    }
}
