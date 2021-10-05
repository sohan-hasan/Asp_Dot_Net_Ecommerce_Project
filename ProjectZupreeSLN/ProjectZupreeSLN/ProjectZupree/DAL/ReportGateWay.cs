using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public static class ReportGateWay
    {

        public static List<ProductReportObj> GetProductList(string path)
        {
            List<ProductReportObj> list = new List<ProductReportObj>();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT P.ProductId, P.ProductName,P.PurchaseDate,P.Quantity,P.UnitPrice,P.MSRP,P.ImageName,P.ImageUrl,S.SupplierId," +
                    "S.CompanyName,S.ContactName,S.Email,S.Phone,C.CategoryId,C.CategoryName FROM Products AS P JOIN Suppliers AS S " +
                    "ON P.SupplierId = S.SupplierId JOIN Category AS C " +
                    "ON P.CategoryId = C.CategoryId";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ProductReportObj obj = new ProductReportObj();
                    obj.ProductId = Convert.ToInt32(rdr["ProductId"]);
                    obj.ProductName = rdr["ProductName"].ToString();
                    obj.PurchaseDate = Convert.ToDateTime(rdr["PurchaseDate"].ToString());
                    obj.Quantity = Convert.ToInt32(rdr["Quantity"]);
                    obj.UnitPrice = Convert.ToDecimal(rdr["UnitPrice"]);
                    obj.MSRP = Convert.ToDecimal(rdr["MSRP"]);
                    obj.ImageName = rdr["ImageName"].ToString();
                    obj.ImageUrl = path+ "AuthorizedPages/" + rdr["ImageUrl"].ToString();
                    obj.SupplierId = Convert.ToInt32(rdr["SupplierId"]);
                    obj.CompanyName = rdr["CompanyName"].ToString();
                    obj.ContactName = rdr["ContactName"].ToString();
                    obj.Phone = rdr["Phone"].ToString();
                    obj.Email = rdr["Email"].ToString();
                    obj.CategoryId = Convert.ToInt32(rdr["CategoryId"]);
                    obj.CategoryName = rdr["CategoryName"].ToString();
                    list.Add(obj);
                }
                return list;
            }
        }

        //public static List<Products1> GetProductList()
        //{
        //    List<Products1> list = new List<Products1>();
        //    using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
        //    {
        //        SqlCommand cmd = con.CreateCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = "SELECT ProductId, ProductName,PurchaseDate,Quantity,UnitPrice,MSRP,ImageName,ImageUrl,SupplierId,CategoryId FROM Products";
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            Products1 obj = new Products1();
        //            obj.ProductId = Convert.ToInt32(rdr["ProductId"]);
        //            obj.ProductName = rdr["ProductName"].ToString();
        //            obj.PurchaseDate = Convert.ToDateTime(rdr["PurchaseDate"].ToString());
        //            obj.Quantity = Convert.ToInt32(rdr["Quantity"]);
        //            obj.UnitPrice = Convert.ToDecimal(rdr["UnitPrice"]);
        //            obj.MSRP = Convert.ToDecimal(rdr["MSRP"]);
        //            obj.ImageName = rdr["ImageName"].ToString();
        //            obj.ImageUrl = rdr["ImageUrl"].ToString();
        //            obj.SupplierId = Convert.ToInt32(rdr["SupplierId"]);
        //            //obj.CompanyName = rdr["CompanyName"].ToString();
        //            //obj.ContactName = rdr["ContactName"].ToString();
        //            //obj.Phone = rdr["Phone"].ToString();
        //            //obj.Email = rdr["Email"].ToString();
        //            obj.CategoryId = Convert.ToInt32(rdr["CategoryId"]);
        //            //obj.CategoryName = rdr["CategoryName"].ToString();
        //            list.Add(obj);
        //        }
        //        return list;
        //    }
        //}
    }
}