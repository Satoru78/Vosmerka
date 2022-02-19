using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiVosmerka.Model
{
    public class ResponseProduct
    {
        public ResponseProduct (Product product)
        {
            this.ID = product.ID;
            this.Title = product.Title;
            this.Articul = product.Articul;
            this.Cost = product.Cost;
            this.Picture = product.Picture;
            this.IDProductType = product.IDProductType;
            this.CountOfPerson = product.CountOfPerson;
            this.WorkshopNumber = product.WorkshopNumber;
        }
        public ResponseProduct () { }
        public int ID { get; set; }
        public string Title { get; set; }
        public int Articul { get; set; }
        public decimal Cost { get; set; }
        public string Picture { get; set; }
        public int IDProductType { get; set; }
        public int CountOfPerson { get; set; }
        public int WorkshopNumber { get; set; }
    }
}
