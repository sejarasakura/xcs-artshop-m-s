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
    
    public partial class Art
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Art()
        {
            this.CartDetails = new HashSet<CartDetail>();
            this.PaymentDetails = new HashSet<PaymentDetail>();
        }
    
        public int id { get; set; }
        public string image { get; set; }
        public decimal price { get; set; }
        public string date { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public Nullable<int> category_id { get; set; }
        public Nullable<System.Guid> artist_id { get; set; }
    
        public virtual Artist Artist { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CartDetail> CartDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PaymentDetail> PaymentDetails { get; set; }
    }
}
