using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public class OrderGateWay
    {
        ZupreeDBEntities db = new ZupreeDBEntities();
        public IQueryable<Order> GetOrderList()
        {
            return from ordr in db.Orders select ordr;
        }
        public Order GetOrder(int ordNumber)
        {
            Order ord = db.Orders.FirstOrDefault(c => c.OrderNumber == ordNumber);
            return ord;
        }
        public void InsertOrder(Order obj)
        {
            db.Orders.Add(obj);
            db.SaveChanges();
        }
        public int UpdateOrder(Order upobj)
        {
            int count = 0;
            Order obj = GetOrder(upobj.OrderNumber);
            obj.CustomerName = upobj.CustomerName;
            obj.CustomerPhone = upobj.CustomerPhone;
            obj.CustomerEmail = upobj.CustomerEmail;
            obj.ProductId = upobj.ProductId;
            obj.ProductId = upobj.ProductId;
            obj.Quantity = upobj.Quantity;
            obj.UnitPrice = upobj.UnitPrice;
            count = db.SaveChanges();
            return count;
        }
        public int DeleteOrder(int id)
        {
            int count = 0;
            Order delOrder = GetOrder(id);
            db.Orders.Remove(delOrder);
            count = db.SaveChanges();
            return count;
        }
    }
}