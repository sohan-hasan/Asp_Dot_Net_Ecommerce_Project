using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public static class PaymentGateWay
    {
        public static DataTable GetPaymentMethod()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Payment";
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr, LoadOption.Upsert);
            }
            return dt;
        }
        public static void SavePaymentMethod(string PaymentType)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Payment (PaymentType) VALUES(@PaymentType)";
                cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}