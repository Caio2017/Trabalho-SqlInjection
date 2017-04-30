<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="produtos.aspx.cs" Inherits="produtos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 164px;
            height: 164px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Pesquisar Produtos:</h2>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:TextBox ID="txtPesquisaProdutos" runat="server" CssClass="txtSearch"></asp:TextBox>
            <br />
            <asp:Button ID="btnPesquisarProdutos" runat="server" OnClick="btnPesquisarProdutos_Click" Text="Pesquisar" />
            <input id="btnLimparCampoTexto" type="button" value="Limpar" onclick="document.getElementById('ContentPlaceHolder1_txtPesquisaProdutos').value = '';"/><br />
            <br /><br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <img src="Images/carregando.gif" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <br />
</asp:Content>

