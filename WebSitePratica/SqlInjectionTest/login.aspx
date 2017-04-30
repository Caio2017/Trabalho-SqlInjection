<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h2>Inicio</h2>
    <div class="centralizar" runat="server" id="divLogin" style="width: 400px">
        <fieldset>
            <legend>Login</legend>
            <span>Usuario:</span><br />
            <%--<input id="Text1" type="text" name="txtUsuario" /><br />--%>
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox><br />
            <span>Senha..:</span><br />
            <input id="Text1" type="text" name="txtSenha" /><br />
            <%--<asp:textbox id="txtPass" runat="server" width="346px"></asp:textbox>--%>
            <center>
            <asp:label id="lblStatus" runat="server"></asp:label>
            </center>
            <asp:button runat="server" text="Entrar" id="btnEntrar" onclick="btnEntrar_Click"></asp:button>
            <br />
        </fieldset>
    </div>
</asp:Content>

