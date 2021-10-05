using ProjectZupree.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.AuthorizedPages
{
    public partial class AddSuppliers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int supplierId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            FileUpload up = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string imagename = SupplierGateWay.ImageName(supplierId);
            string fileUrl = "~/Images/SupplierLogos";
            string newImageName = "";
            if (up.HasFile)
            {
                DeleteExistingImage(imagename);
                newImageName = up.FileName;
                fileUrl += newImageName;
                up.SaveAs(Server.MapPath(fileUrl));
                SupplierGateWay.UpdateImageById(newImageName, fileUrl, supplierId);
            }
        }
        private void DeleteExistingImage(string imagename)
        {
            string path = Server.MapPath("~/Images/SupplierLogos" + imagename);
            FileInfo fileObj = new FileInfo(path);
            if (fileObj.Exists)
            {
                fileObj.Delete();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int supplierId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string imagename = SupplierGateWay.ImageName(supplierId);
            DeleteExistingImage(imagename);
        }
    }
}