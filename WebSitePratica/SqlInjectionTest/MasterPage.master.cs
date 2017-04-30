using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Nome"] != null)
        {
            lblBemVindo.Text = "Bem Vindo " + Session["Nome"];
            LinkButtonSairConta.Visible = true;
        }
        else
        {
            lblBemVindo.Text = "";
            LinkButtonSairConta.Visible = false;
        }

    }

    protected void linkSairConta_Click(object sender, EventArgs e)
    {
        Session["Nome"] = null;
        Response.Redirect("login.aspx");
    }
}
