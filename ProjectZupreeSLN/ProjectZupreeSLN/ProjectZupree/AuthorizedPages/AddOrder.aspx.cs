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
    public partial class AddOrder : System.Web.UI.Page
    {
        OrderGateWay dbobj = new OrderGateWay();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridView();
            }
        }

        private void LoadGridView()
        {
            List<Order> data = dbobj.GetOrderList().ToList();
            if (data.Count > 0)
            {
                GridView1.DataSource = data;
            }
            else
            {
                GridView1.DataSource = null;
            }
            GridView1.DataBind();
        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGridView();
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            int orderNumber = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            Order obj = new Order();
            obj.OrderNumber = orderNumber;
            obj.CustomerName = e.NewValues["CustomerName"].ToString();
            obj.CustomerPhone = e.NewValues["CustomerPhone"].ToString();
            obj.CustomerEmail = e.NewValues["CustomerEmail"].ToString();
            obj.ProductId = Convert.ToInt32(e.NewValues["ProductId"].ToString());
            obj.PaymentId = Convert.ToInt32(e.NewValues["PaymentId"].ToString());
            obj.Quantity = Convert.ToInt32(e.NewValues["Quantity"].ToString());
            obj.UnitPrice = Convert.ToDecimal(e.NewValues["UnitPrice"].ToString());
            dbobj.UpdateOrder(obj);
            GridView1.EditIndex = -1;
            LoadGridView();
        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int orderNumber = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            dbobj.DeleteOrder(orderNumber);
            GridView1.EditIndex = -1;
            LoadGridView();
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGridView();

        }

        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadGridView();
        }
    }
}