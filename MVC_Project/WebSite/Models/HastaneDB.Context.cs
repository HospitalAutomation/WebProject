﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HastaneDBEntities : DbContext
    {
        public HastaneDBEntities()
            : base("name=HastaneDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<hastaKabul> hastaKabuls { get; set; }
        public virtual DbSet<hastalar> hastalars { get; set; }
        public virtual DbSet<hastaSikayetleri> hastaSikayetleris { get; set; }
        public virtual DbSet<ilaclar> ilaclars { get; set; }
        public virtual DbSet<muayeneler> muayenelers { get; set; }
        public virtual DbSet<personeller> personellers { get; set; }
        public virtual DbSet<poliklinikler> polikliniklers { get; set; }
        public virtual DbSet<randevular> randevulars { get; set; }
        public virtual DbSet<receteler> recetelers { get; set; }
        public virtual DbSet<recetelerSatirlari> recetelerSatirlaris { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<tahliller> tahlillers { get; set; }
        public virtual DbSet<tahlillerSonuc> tahlillerSonucs { get; set; }
        public virtual DbSet<teshisler> teshislers { get; set; }
        public virtual DbSet<unvanlar> unvanlars { get; set; }
    }
}
