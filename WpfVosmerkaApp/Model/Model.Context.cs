//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfVosmerkaApp.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class VosmerkaBaseEntities : DbContext
    {
        public VosmerkaBaseEntities()
            : base("name=VosmerkaBaseEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AgentType> AgentType { get; set; }
        public virtual DbSet<DirectorName> DirectorName { get; set; }
        public virtual DbSet<Manager> Manager { get; set; }
        public virtual DbSet<Material> Material { get; set; }
        public virtual DbSet<MaterialType> MaterialType { get; set; }
        public virtual DbSet<PointOfSale> PointOfSale { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductMaterial> ProductMaterial { get; set; }
        public virtual DbSet<ProductType> ProductType { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Unit> Unit { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Agent> Agent { get; set; }
    }
}
