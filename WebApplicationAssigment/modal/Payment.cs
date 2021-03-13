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
    
    public partial class Payment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Payment()
        {
            this.PaymentDetails = new HashSet<PaymentDetail>();
        }
    
        public System.Guid id { get; set; }
        public System.Guid payment_method { get; set; }
        public System.Guid payment_status { get; set; }
        public System.Guid UserId { get; set; }
        public Nullable<double> tax_change { get; set; }
        public Nullable<double> net_pay { get; set; }
        public Nullable<double> discount { get; set; }
        public Nullable<double> total_pay { get; set; }
        public Nullable<double> customer_paid { get; set; }
        public Nullable<System.DateTime> payment_date { get; set; }
        public string payment_meta { get; set; }
        public string notes { get; set; }
    
        public virtual aspnet_Users aspnet_Users { get; set; }
        public virtual PaymentMethod PaymentMethod { get; set; }
        public virtual PaymentStatu PaymentStatu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PaymentDetail> PaymentDetails { get; set; }
    }
}
