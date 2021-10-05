using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.User_Control
{
    public partial class RegistrationUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowImage();
        }

        private void ShowImage()
        {
            if (FileUpload1.HasFile)
            {
                string imageName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                HiddenFieldImageName.Value = imageName;
                string filePath = "~/Images/UserImages/" + imageName;
                HiddenFieldImageUrl.Value = filePath;
                FileUpload1.SaveAs(Server.MapPath(filePath));
                Image1.ImageUrl = filePath; 
                lblMessage.Visible = true;
            }
        }
        //public void MsgBox(String ex, Page pg, Object obj)
        //{
        //    string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        //    Type cstype = obj.GetType();
        //    ClientScriptManager cs = pg.ClientScript;
        //    cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        //}
        protected void btnSingUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                AppUser1 obj = new AppUser1();
                obj.FirstName = txtFirstName.Text;
                obj.LastName = txtLastName.Text;
                obj.UserName = txtUserName.Text;
                bool isChecked = radioFemale.Checked;
                if (isChecked)
                {
                    obj.Gender = 1;
                }
                else
                {
                    obj.Gender = 2;
                }
                obj.Phone = txtPhone.Text;
                obj.Email = txtEmail.Text;
                obj.Password = txtPassword.Text;
                obj.ImageName = HiddenFieldImageName.Value;
                obj.ImageUrl = HiddenFieldImageUrl.Value;
                string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(obj.Password, "SHA1");
                UserGateWay getobj = new UserGateWay();
                int returnCode = getobj.SaveUser(obj.FirstName, obj.LastName, obj.UserName,
                    obj.Gender, obj.Phone, obj.Email, encryptedPass, obj.ImageName, obj.ImageUrl);
                if (returnCode == -1)
                {
                    lblUserExist.Text = "UserName Already Exists.";
                }
                else
                {
                     Response.Redirect("~/login");
                }
            }
        }
    }
}