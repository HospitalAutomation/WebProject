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
    
    public partial class teshisler
    {
        public int teshisID { get; set; }
        public Nullable<System.DateTime> tarih { get; set; }
        public string teshis { get; set; }
        public Nullable<int> doktorID { get; set; }
        public Nullable<int> muayeneID { get; set; }
    
        public virtual muayeneler muayeneler { get; set; }
        public virtual personeller personeller { get; set; }
    }
}
