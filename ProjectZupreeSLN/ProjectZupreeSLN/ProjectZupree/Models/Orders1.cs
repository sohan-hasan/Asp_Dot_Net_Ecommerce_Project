using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectZupree.Models
{
    public class Orders1
    {
        public int OrderNumber { get; set; }
        public string CustomerName { get; set; }
        public string CustomerPhone { get; set; }
        public string CustomerEmail { get; set; }
        public int ProductId { get; set; }
        public int PaymentId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }

    }
}