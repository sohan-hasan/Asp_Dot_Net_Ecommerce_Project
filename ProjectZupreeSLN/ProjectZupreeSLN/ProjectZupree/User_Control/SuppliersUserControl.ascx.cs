using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.User_Control
{
    public partial class SuppliersUserControl : System.Web.UI.UserControl
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
                string filePath = "~/Images/SupplierLogos/" + imageName;
                HiddenFieldImageUrl.Value = filePath;
                FileUpload1.SaveAs(Server.MapPath(filePath));
                Image1.ImageUrl = filePath; 
                lblMessage.Visible = true;
            }
        }

        protected void btnSaveSupplier_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Suppliers1 obj = new Suppliers1();
                obj.CompanyName = txtCompanyName.Text;
                obj.ContactName = txtContactName.Text;
                obj.Address = txtAddress.Text;
                obj.Phone = txtPhone.Text;
                obj.Email = txtEmail.Text;
                obj.ImageName = HiddenFieldImageName.Value;
                obj.ImageUrl = HiddenFieldImageUrl.Value;
                SupplierGateWay.SaveSupplier(obj.CompanyName, obj.ContactName, obj.Address, obj.Phone, obj.Email, obj.ImageName, obj.ImageUrl);
                Response.Redirect("suppliers");

            }
        }
    }
}