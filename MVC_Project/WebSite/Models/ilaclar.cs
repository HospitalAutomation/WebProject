//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ilaclar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ilaclar()
        {
            this.recetelerSatirlaris = new HashSet<recetelerSatirlari>();
        }
    
        public int ilacId { get; set; }
        public long barkod { get; set; }
        public string ilacAdi { get; set; }
        public string etkenMadde { get; set; }
        public Nullable<decimal> birim { get; set; }
        public string birimCins { get; set; }
        public string farmaForm { get; set; }
        public string ambalaj { get; set; }
        public string ambalajBirimi { get; set; }
        public string firma { get; set; }
        public string ithalImal { get; set; }
        public Nullable<decimal> fiyatı { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<recetelerSatirlari> recetelerSatirlaris { get; set; }
    }
}
