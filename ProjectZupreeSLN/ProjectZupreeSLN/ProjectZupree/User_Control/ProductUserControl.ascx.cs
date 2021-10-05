using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.User_Control
{
    public partial class ProductUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Calendar1.Visible = false;
                LaodddlCategory();
                LaodddlSupplier();
            }
            ShowImage();
        }

        private void LaodddlSupplier()
        {
            DataTable dt = SupplierGateWay.GetSupplier();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "->select supplier<-" };
            dt.Rows.InsertAt(dr, 0);

            ddlCompany.DataSource = dt;
            ddlCompany.DataTextField = dt.Columns["CompanyName"].ToString();
            ddlCompany.DataValueField = dt.Columns["SupplierId"].ToString();
            ddlCompany.DataBind();
        }

        private void LaodddlCategory()
        {
            DataTable dt = CategoryGateWay.GetCategories();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "->select category<-" };
            dt.Rows.InsertAt(dr, 0);

            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = dt.Columns["CategoryName"].ToString();
            ddlCategory.DataValueField = dt.Columns["CategoryId"].ToString();
            ddlCategory.DataBind();
        }

        private void ShowImage()
        {
            if (FileUpload1.HasFile)
            {
                string imageName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                HiddenFieldImageName.Value = imageName;
                string filePath = "AuthorizedPages/Images/ProductImages/" + imageName;
                HiddenFieldImageUrl.Value = "Images/ProductImages/" + imageName;
                FileUpload1.SaveAs(Server.MapPath(filePath));
                Image1.ImageUrl = "../AuthorizedPages/Images/ProductImages/" + imageName;
                lblMessage.Visible = true;
            }
        }

        //protected void btnDatePicker_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (Calendar1.Visible)
        //    {
        //        Calendar1.Visible = false;
        //    }
        //    else
        //    {
        //        Calendar1.Visible = true;
        //    }
        //}

        //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        //{
        //    txtPurchaseDate.Text = Calendar1.SelectedDate.ToShortDateString();
        //    Calendar1.Visible = false;
        //}

        protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                Suppliers1 suppliers = new Suppliers1();
                int supplierId = Convert.ToInt32(ddlCompany.SelectedValue);
                string Query = "select * from Suppliers where SupplierId = " + supplierId;
                SqlCommand cmd = new SqlCommand(Query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (supplierId > 0)
                {
                    suppliers.Phone = dr["Phone"].ToString();
                    suppliers.Email = dr["Email"].ToString();
                    txtPhone.Text = suppliers.Phone;
                    txtEmail.Text = suppliers.Email;
                }
                else
                {
                    txtPhone.Text = "";
                    txtEmail.Text = "";
                }

            }
        }


        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Products1 obj = new Products1();
                obj.ProductName = txtProductName.Text;
                //string purchaseDate = txtPurchaseDate.Text;
                obj.PurchaseDate = DateTime.Parse(txtPurchaseDate.Text, CultureInfo.CreateSpecificCulture("fr-FR"));
                obj.SupplierId = Convert.ToInt32(ddlCompany.SelectedValue);
                obj.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                obj.Quantity = Convert.ToInt32(txtPurchaseQuantity.Text);
                obj.Quantity = Convert.ToInt32(txtPurchaseQuantity.Text);
                obj.UnitPrice = Convert.ToDecimal(txtPurchaseUnitPrice.Text);
                obj.MSRP = Convert.ToDecimal(txtMaximumSalesRetailPrice.Text);
                obj.ImageName = HiddenFieldImageName.Value;
                obj.ImageUrl = HiddenFieldImageUrl.Value;
                Session["Products"] = obj;
                Response.Redirect("product");
            }
        }

        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            Category obj = new Category();
            obj.CategoryName = txtCategoryName.Text;
            CategoryGateWay.Savecategory(obj.CategoryName);
            Response.Redirect("product");
        }
    }
}