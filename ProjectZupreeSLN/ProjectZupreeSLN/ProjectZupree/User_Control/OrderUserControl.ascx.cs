using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.User_Control
{
    public partial class OrderUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LaodddlProduct();
                LaodddlPaymentMethod();
            }
        }
        private void LaodddlPaymentMethod()
        {
            DataTable dt = PaymentGateWay.GetPaymentMethod();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "->select product<-" };
            dt.Rows.InsertAt(dr, 0);

            ddlPaymentId.DataSource = dt;
            ddlPaymentId.DataTextField = dt.Columns["PaymentType"].ToString();
            ddlPaymentId.DataValueField = dt.Columns["PaymentId"].ToString();
            ddlPaymentId.DataBind();
        }

        private void LaodddlProduct()
        {
            DataTable dt = ProductGateWay.GetProduct();

            DataRow dr = dt.NewRow();
            dr.ItemArray = new object[] { 0, "->select product<-" };
            dt.Rows.InsertAt(dr, 0);

            ddlProductId.DataSource = dt;
            ddlProductId.DataTextField = dt.Columns["ProductName"].ToString();
            ddlProductId.DataValueField = dt.Columns["ProductId"].ToString();
            ddlProductId.DataBind();
        }

        protected void ddlProductId_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                Products1 product = new Products1();
                int productId = Convert.ToInt32(ddlProductId.SelectedValue);
                string Query = "select * from Products where ProductId = " + productId;
                SqlCommand cmd = new SqlCommand(Query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (productId > 0)
                {
                    product.ImageUrl = dr["ImageUrl"].ToString();
                    Image1.ImageUrl = "../AuthorizedPages/"+ product.ImageUrl;
                }
                else
                {
                    Image1.ImageUrl = "";
                }

            }
        }

        protected void btnSavePaymentType_Click(object sender, EventArgs e)
        {
            Payment obj = new Payment();
            obj.PaymentType = txtPaymentType.Text;
            PaymentGateWay.SavePaymentMethod(obj.PaymentType);
            Response.Redirect("order");
        }

        protected void btnSaveOrder_Click(object sender, EventArgs e)
        {
            OrderGateWay dbobj = new OrderGateWay();
            Order obj = new Order();
            obj.CustomerName = txtCustomerName.Text;
            obj.CustomerPhone = txtPhone.Text;
            obj.CustomerEmail = txtEmail.Text;
            obj.ProductId = Convert.ToInt32(ddlProductId.SelectedValue);
            obj.PaymentId = Convert.ToInt32(ddlPaymentId.SelectedValue);
            obj.Quantity = Convert.ToInt32(txtSalesQuantity.Text);
            obj.UnitPrice = Convert.ToDecimal(txtSalesUnitPrice.Text);
            dbobj.InsertOrder(obj);
            Response.Redirect("order");
        }
    }
}