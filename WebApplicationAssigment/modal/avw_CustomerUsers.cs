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
    
    public partial class avw_CustomerUsers
    {
        public System.Guid UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string LoweredEmail { get; set; }
        public bool IsApproved { get; set; }
        public bool IsLockedOut { get; set; }
        public System.DateTime CreateDate { get; set; }
        public System.DateTime LastActivityDate { get; set; }
        public System.DateTime LastLoginDate { get; set; }
        public System.DateTime LastLockoutDate { get; set; }
        public System.DateTime LastPasswordChangedDate { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string gender { get; set; }
        public byte[] picture { get; set; }
        public Nullable<System.DateTime> birthday_date { get; set; }
        public string membership { get; set; }
        public byte[] private_pic { get; set; }
    }
}