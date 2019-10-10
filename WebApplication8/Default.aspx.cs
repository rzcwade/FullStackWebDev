using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(!String.IsNullOrEmpty(TextBox1.Text))
            {
                Label1.Text = "Welcome, " + Server.HtmlEncode(TextBox1.Text) + "!";
            }
        }
    }
}