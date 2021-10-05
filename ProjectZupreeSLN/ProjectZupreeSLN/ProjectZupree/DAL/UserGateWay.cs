using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public class UserGateWay
    {
        public int SaveUser(string FirstName, string LastName, string UserName, int Gender, string Phone,
              string Email, string Password, string ImageName, string ImageUrl)
        {
            int returnCode = 0;
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spRegisterUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter firstName = new SqlParameter("@FirstName", FirstName);
                SqlParameter lastName = new SqlParameter("@LastName", LastName);
                SqlParameter userName = new SqlParameter("@UserName", UserName);
                SqlParameter gender = new SqlParameter("@Gender", Gender);
                SqlParameter phone = new SqlParameter("@Phone", Phone);
                SqlParameter email = new SqlParameter("@Email", Email);
                SqlParameter password = new SqlParameter("@Password", Password);
                SqlParameter imageName = new SqlParameter("@ImageName", ImageName);
                SqlParameter imageUrl = new SqlParameter("@ImageUrl", ImageUrl);
                cmd.Parameters.Add(firstName);
                cmd.Parameters.Add(lastName);
                cmd.Parameters.Add(userName);
                cmd.Parameters.Add(gender);
                cmd.Parameters.Add(phone);
                cmd.Parameters.Add(email);
                cmd.Parameters.Add(password);
                cmd.Parameters.Add(imageName);
                cmd.Parameters.Add(imageUrl);
                con.Open();
                returnCode = (int)cmd.ExecuteScalar();
            }
            return returnCode;
        }
        public int AuthenticateUser(string UserName, string Password)
        {
            int authenticated = 0;
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter username = new SqlParameter("@UserName", UserName);
                SqlParameter password = new SqlParameter("@Password", Password);
                cmd.Parameters.Add(username);
                cmd.Parameters.Add(password);
                con.Open();
                authenticated = (int)cmd.ExecuteScalar();
            }
            return authenticated;
        }
    }
}