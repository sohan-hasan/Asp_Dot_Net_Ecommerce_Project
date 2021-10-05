using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.AuthorizedPages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Products"] != null)
            {
                Products1 obj = (Products1)Session["Products"];
                InsertProduct(obj);
                Session["Products"] = null;
            }
        }
        private void InsertProduct(Products1 obj)
        {
            SqlDataSource1.InsertParameters["ProductName"].DefaultValue = obj.ProductName;
            SqlDataSource1.InsertParameters["PurchaseDate"].DefaultValue = obj.PurchaseDate.ToShortDateString();
            SqlDataSource1.InsertParameters["SupplierId"].DefaultValue = obj.SupplierId.ToString();
            SqlDataSource1.InsertParameters["CategoryId"].DefaultValue = obj.CategoryId.ToString();
            SqlDataSource1.InsertParameters["Quantity"].DefaultValue = obj.Quantity.ToString();
            SqlDataSource1.InsertParameters["UnitPrice"].DefaultValue = obj.UnitPrice.ToString();
            SqlDataSource1.InsertParameters["MSRP"].DefaultValue = obj.MSRP.ToString();
            SqlDataSource1.InsertParameters["ImageName"].DefaultValue = obj.ImageName;
            SqlDataSource1.InsertParameters["ImageUrl"].DefaultValue = obj.ImageUrl;
            SqlDataSource1.Insert();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            FileUpload up = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string imagename = ProductGateWay.ImageName(productId);
            string fileUrl = "Images/ProductImages/";
            string newImageName = "";
            if (up.HasFile)
            {
                DeleteExistingImage(imagename);
                newImageName = up.FileName;
                fileUrl += newImageName;
                up.SaveAs(Server.MapPath("AuthorizedPages/" + fileUrl));
            }
            else
            {
                newImageName = imagename;
                fileUrl += newImageName;
            }
            string productName = (GridView1.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text;
            DateTime purchaseDate =Convert.ToDateTime((GridView1.Rows[e.RowIndex].FindControl("txtPurchaseDate") as TextBox).Text);
            DropDownList dlSupplier = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlSupplierCompanyName");
            int supplierId = Convert.ToInt32(dlSupplier.SelectedValue);
            DropDownList dlCategory = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlProductCategory");
            int categoryId = Convert.ToInt32(dlCategory.SelectedValue);
            int quantity = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("txtQuantity") as TextBox).Text);
            decimal unitPrice = Convert.ToDecimal((GridView1.Rows[e.RowIndex].FindControl("txtUnitPrice") as TextBox).Text);
            decimal msrp = Convert.ToDecimal((GridView1.Rows[e.RowIndex].FindControl("txtMSRP") as TextBox).Text);
            TextBox txt = GridView1.Rows[e.RowIndex].FindControl("txtImageName") as TextBox;
            txt.Text = newImageName;
            UpdateSql(productId, productName, purchaseDate, supplierId, categoryId, quantity, unitPrice, msrp,fileUrl, newImageName);
        }
        private void UpdateSql(int productId,string productName, DateTime purchaseDate, int supplierId, int categoryId, int quantity, decimal unitPrice, decimal msrp, string fileUrl, string newImageName)
        {
            SqlDataSource1.UpdateCommand = "Update [Products] set ProductName='" + productName + "', PurchaseDate='" + purchaseDate + "', SupplierId='" + supplierId + "', CategoryId='" + categoryId + "', Quantity='" + quantity + "', UnitPrice='" + unitPrice + "', MSRP='" + msrp + "', ImageName='" + newImageName + "', ImageUrl='" + fileUrl + "' where ProductId='" + productId + "'";
            int affraw_update = SqlDataSource1.Update();
            SqlDataSource1.Dispose();
        }
        private void DeleteExistingImage(string imagename)
        {
            string path = Server.MapPath("AuthorizedPages/Images/ProductImages/" + imagename);
            FileInfo fileObj = new FileInfo(path);
            if (fileObj.Exists)
            {
                fileObj.Delete();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string imagename = ProductGateWay.ImageName(productId);
            DeleteExistingImage(imagename);
        }
    }
}