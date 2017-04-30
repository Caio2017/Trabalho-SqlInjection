using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Nome"] != null)
            divLogin.Visible = false;
        else
            divLogin.Visible = true;
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        string usuario = txtUsuario.Text;
        string senha = Request.Form["txtSenha"];

        using (Conexao c = new Conexao())
        {
            c.sqlCommand.CommandText = "select(name) from users where uname = '"+ usuario + "' and pass = '"+ senha + "'";
            c.sqlConnection.Open();
            Session["Nome"] = c.sqlCommand.ExecuteScalar();//retorna null se nao achar
        }

        //Se logou
        if (Session["Nome"] != null)        
            Response.Redirect("produtos.aspx");
        else
            lblStatus.Text = "Usuario ou Senha incorretos";
    }
}