using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Conexao
/// </summary>
public class Conexao : IDisposable
{
    public SqlConnection sqlConnection { get; set; }
    public SqlCommand sqlCommand { get; set; }

    // TODO: Add constructor logic here
    public Conexao()
    {
        //string strConexao = "Server=localhost;DataBase=exe_produtos;trusted_connection=true";
        sqlConnection = new SqlConnection("Server=localhost;DataBase=db_testSqlInjection;user id=sa;password=12345");
        sqlCommand = new SqlCommand();
        sqlCommand.Connection = sqlConnection;
    }

    // Public implementation of Dispose pattern callable by consumers.
    bool disposed = false;

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }
    // Protected implementation of Dispose pattern.
    protected virtual void Dispose(bool disposing)
    {

        if (disposed)
            return;

        if (disposing)
        {
            // Free any other managed objects here.
            sqlConnection.Dispose();
            sqlCommand.Dispose();
        }

        // Free any unmanaged objects here.
        //
        disposed = true;
    }

    // Use C# destructor syntax for finalization code.
    ~Conexao()
    {
        // Simply call Dispose(false).
        Dispose(false);
    }
}