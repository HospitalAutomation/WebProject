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
    
    public partial class recetelerSatirlari
    {
        public int satırID { get; set; }
        public Nullable<int> ilacID { get; set; }
        public string dozu { get; set; }
        public string kullanımSekli { get; set; }
        public Nullable<int> adet { get; set; }
        public Nullable<int> receteNo { get; set; }
        public Nullable<int> barkod { get; set; }
    
        public virtual ilaclar ilaclar { get; set; }
        public virtual receteler receteler { get; set; }
    }
}
