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
    using System.Collections.Generic;
    
    public partial class ProductMaterial
    {
        public int ID { get; set; }
        public int IDProduct { get; set; }
        public int IDMaterial { get; set; }
        public int MaterialQuantity { get; set; }
    
        public virtual Material Material { get; set; }
        public virtual Product Product { get; set; }
    }
}