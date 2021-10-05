using CrystalDecisions.Shared;
using ProjectZupree.DAL;
using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.AuthorizedPages
{
    public partial class ProductReport : System.Web.UI.Page
    {

        //string path = Server.MapPath("/");
        //List<ProductReportObj> products = ReportGateWay.GetProductList(path);
        //Session["Data"] = products;
        //Page.ClientScript.RegisterStartupScript(
        //this.GetType(), "OpenWindow", "window.open('product_report','_newtab');", true);
        //Response.Redirect("AuthorizedPages/ProductReportPage.aspx");


        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Server.MapPath("/");

            List<ProductReportObj> products = ReportGateWay.GetProductList(path);

            Session["Data"] = products;
            //Response.Redirect("ReportViewPage.aspx");
            if (Session["Data"] != null)
            {

                var list = Session["Data"] as List<ProductReportObj>;
                CrystalProductReport reportObj = new CrystalProductReport();
                reportObj.SetDataSource(list);
                CrystalReportViewer1.ReportSource = reportObj;
                reportObj.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "User Info");

            }
        }
    }
}