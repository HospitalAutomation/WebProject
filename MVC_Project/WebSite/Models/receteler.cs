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
    
    public partial class receteler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public receteler()
        {
            this.recetelerSatirlaris = new HashSet<recetelerSatirlari>();
        }
    
        public int receteNo { get; set; }
        public System.DateTime tarih { get; set; }
        public int doktorID { get; set; }
        public int hastaID { get; set; }
    
        public virtual hastalar hastalar { get; set; }
        public virtual personeller personeller { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<recetelerSatirlari> recetelerSatirlaris { get; set; }
    }
}
