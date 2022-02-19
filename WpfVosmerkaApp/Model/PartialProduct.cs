using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfVosmerkaApp.Model
{
    public partial class Product
    {
        public string GetPicture
        {
            get
            {
                return Environment.CurrentDirectory + "\\" + Picture;
            }
            set
            {
                Picture = value;
            }
        }
        public string GetFullTitle
        {
            get
            {
                return $"{ProductType.Title} | {Title}";
            }
        }
    }
}
