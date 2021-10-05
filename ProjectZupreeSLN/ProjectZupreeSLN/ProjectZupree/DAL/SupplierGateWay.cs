using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public class SupplierGateWay
    {
        public static List<Suppliers1> GetSupplierList()
        {
            List<Suppliers1> list = new List<Suppliers1>();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT SupplierId,CompanyName,ContactName,Address,Phone,Email,ImageName, ImageUrl FROM Suppliers";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Suppliers1 obj = new Suppliers1();
                    obj.SupplierId = Convert.ToInt32(rdr["SupplierId"]);
                    obj.CompanyName = rdr["CompanyName"].ToString();
                    obj.ContactName = rdr["ContactName"].ToString();
                    obj.Address = rdr["Address"].ToString();
                    obj.Phone = rdr["Phone"].ToString();
                    obj.Email = rdr["Email"].ToString();
                    obj.ImageName = rdr["ImageName"].ToString();
                    obj.ImageUrl = rdr["ImageUrl"].ToString();
                    list.Add(obj);
                }
                return list;
            }
        }
        public static void SaveSupplier(string CompanyName,
            string ContactName, string Address, string Phone, string Email, string ImageName, string ImageUrl)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Suppliers (CompanyName,ContactName,Address,Phone,Email,ImageName,ImageUrl) VALUES (@CompanyName,@ContactName,@Address,@Phone,@Email,@ImageName,@ImageUrl)";
                cmd.Parameters.AddWithValue("@CompanyName", CompanyName);
                cmd.Parameters.AddWithValue("@ContactName", ContactName);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@Phone", Phone);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@ImageName", ImageName);
                cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void UpdateSupplier(string CompanyName,
            string ContactName, string Address, string Phone, string Email, string ImageName, string ImageUrl, int SupplierId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Suppliers Set CompanyName=@CompanyName, ContactName=@ContactName, Address=@Address,  Phone=@Phone, Email=@Email WHERE SupplierId=@SupplierId";
                cmd.Parameters.AddWithValue("@CompanyName", CompanyName);
                cmd.Parameters.AddWithValue("@ContactName", ContactName);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@Phone", Phone);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void DeleteSupplier(int SupplierId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "DELETE FROM  Suppliers WHERE SupplierId=@SupplierId";
                cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static string ImageName(int SupplierId)
        {
            string imageName = "";
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT ImageName FROM Suppliers WHERE SupplierId=@SupplierId";
                cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                con.Open();
                imageName = cmd.ExecuteScalar().ToString();
            }
            return imageName;
        }
        public static void UpdateImageById(string ImageName, string ImageUrl, int SupplierId)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Suppliers Set ImageName=@ImageName, ImageUrl=@ImageUrl WHERE SupplierId=@SupplierId";
                cmd.Parameters.AddWithValue("@ImageName", ImageName);
                cmd.Parameters.AddWithValue("@ImageUrl", ImageUrl);
                cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static DataTable GetSupplier()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Suppliers";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }
    }
}