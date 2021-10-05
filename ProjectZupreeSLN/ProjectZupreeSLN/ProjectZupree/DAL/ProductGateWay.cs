using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public static class ProductGateWay
    {
        public static string ImageName(int ProductId)
        {
            string imageName = "";
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT ImageName FROM Products WHERE ProductId=@ProductId";
                cmd.Parameters.AddWithValue("@ProductId", ProductId);
                con.Open();
                imageName = cmd.ExecuteScalar().ToString();
            }
            return imageName;
        }
        public static DataTable GetProduct()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Products";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }

    }
}