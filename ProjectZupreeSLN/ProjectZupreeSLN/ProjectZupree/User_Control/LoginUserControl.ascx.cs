using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.User_Control
{
    public partial class LoginUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int authenticated = 0;
            AppUser1 obj = new AppUser1();
            obj.UserName = txtUserName.Text;
            obj.Password = txtPassword.Text;
            string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(obj.Password, "SHA1");
            UserGateWay gateObj = new UserGateWay();
            authenticated = gateObj.AuthenticateUser(obj.UserName, encryptedPass);
            if (authenticated == 1)
            {
                Session["User"] = obj.UserName;
                FormsAuthentication.RedirectFromLoginPage(obj.UserName, chkBoxRememberMe.Checked);
            }
            else
            {
                lblMsg.Text = "Invalid UserName or Password";
            }
        }
    }
}