    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectZupree.Models
{
    public class Products1
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public DateTime PurchaseDate { get; set; }
        public int SupplierId { get; set; }
        public int CategoryId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal MSRP { get; set; }
        public string ImageName { get; set; }
        public string ImageUrl { get; set; }
    }
}