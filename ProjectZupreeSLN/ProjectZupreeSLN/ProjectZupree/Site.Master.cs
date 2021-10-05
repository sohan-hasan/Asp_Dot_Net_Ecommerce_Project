using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
                {
                    AppUser1 userInfo = new AppUser1();
                    string userName = Session["User"].ToString();
                    string Query =  "SELECT * FROM Users WHERE UserName='" + userName + "'";
                    SqlCommand cmd = new SqlCommand(Query, con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                    userInfo.FirstName = dr["FirstName"].ToString();
                    userInfo.LastName = dr["LastName"].ToString();
                    lblUserName.Text = (userInfo.FirstName + "&nbsp;&nbsp;" + userInfo.LastName).ToString();
                    userInfo.ImageUrl = dr["ImageUrl"].ToString();
                    Image1.ImageUrl = userInfo.ImageUrl;

                }
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
                Session["User"] = null;
                FormsAuthentication.SignOut();
                Response.Redirect("login");
        }

        protected void linkBtnProductReport_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('product_report','_newtab');", true);
        }
    }
}