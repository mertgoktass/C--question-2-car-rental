//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShoppingCartMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblInvoice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblInvoice()
        {
            this.tblOrders = new HashSet<tblOrder>();
        }
    
        public int InvoiceId { get; set; }
        public Nullable<int> UserId { get; set; }
        public Nullable<int> Bill { get; set; }
        public string Payment { get; set; }
        public Nullable<System.DateTime> InvoiceDate { get; set; }
        public Nullable<byte> Status { get; set; }
    
        public virtual tblUser tblUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrder> tblOrders { get; set; }
    }
}
