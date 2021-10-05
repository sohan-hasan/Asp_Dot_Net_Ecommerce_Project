using ProjectZupree.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.All_Report
{
    public partial class Product_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Data"] != null)
            {
                var list = Session["Data"] as List<ProductReportObj>;
                CrystalProductReport productReportObj = new CrystalProductReport();
                productReportObj.SetDataSource(list);
                CrystalReportViewer1.ReportSource = productReportObj;
            }
        }
    }
}