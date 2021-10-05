using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectZupree.AuthorizedPages
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0; 
                refreshdata();
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("order");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;

            Label1.Text = TextBox1.Text;
            Label2.Text = TextBox2.Text;
            Label3.Text = TextBox3.Text;
            Label9.Text = TextBox4.Text;
            Label10.Text = TextBox5.Text;
            Label11.Text = TextBox6.Text;
            Label12.Text = TextBox7.Text;
        }
        private void refreshdata()
        {
            Label13.Text = TextBox8.Text;
            Label14.Text = TextBox9.Text;
            Label15.Text = TextBox10.Text;
            Label16.Text = TextBox11.Text;
            Label17.Text = TextBox12.Text;
            Label18.Text = TextBox13.Text;
            Label19.Text = TextBox14.Text;


        }

        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (e.NextStepIndex == 3)
            {
                refreshdata();
            }

        }
    }
}