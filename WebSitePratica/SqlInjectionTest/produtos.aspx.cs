using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class produtos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        if (Session["Nome"] == null)
        {
            string s = HttpContext.Current.Request.Url.AbsolutePath;
            string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;// return /produtos.aspx
            string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/"); //return http://localhost:1302

            Response.Write("<script>alert('Você não possui Acesso esta página, Efetue o Login Antes');location.href='" + strUrl+"login.aspx'</script>");
            //Response.Redirect("login.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Logado", "<script>alert('Bem Vindo " + Session["Nome"] + "')</script>");
            exibirProdutos();
        }
    }

    protected void btnPesquisarProdutos_Click(object sender, EventArgs e)
    {
        exibirProdutos();
    }

    private void exibirProdutos()
    {
        GridView1.DataSource = null;
        //System.Threading.Thread.Sleep(2000);

        string text = txtPesquisaProdutos.Text;
        Conexao c = new Conexao();
        c.sqlCommand.CommandText = "SELECT name AS 'Produto', price as 'Preço' from products WHERE name LIKE  '%" + text + "%'";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(c.sqlCommand);
        da.Fill(dt);
        c.Dispose();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}

/*
======================GET URL===============================
string url = HttpContext.Current.Request.Url.AbsoluteUri;
// http://localhost:1302/TESTERS/Default6.aspx

string path = HttpContext.Current.Request.Url.AbsolutePath;
// /TESTERS/Default6.aspx

string host = HttpContext.Current.Request.Url.Host;
// localhost OR http:/www.mysite.com

string page = Path.GetFileName( Request.Url.AbsolutePath )
//Default6.aspx

 string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
 string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");  
============================================================
*/
