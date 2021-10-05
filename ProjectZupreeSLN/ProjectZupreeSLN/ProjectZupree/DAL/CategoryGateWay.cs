using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public static class CategoryGateWay
    {
        public static DataTable GetCategories()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Category";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }
        public static void Savecategory(string CategoryName)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Category (CategoryName) VALUES(@CategoryName)";
                cmd.Parameters.AddWithValue("@CategoryName", CategoryName);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}