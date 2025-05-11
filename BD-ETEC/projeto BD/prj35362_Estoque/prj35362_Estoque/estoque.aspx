<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="estoque.aspx.cs" Inherits="prj35362_Estoque.estoque" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Estoque</title>
    <link href="css/Estilo.css" rel=Stylesheet />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <main>
    <h1>Lista de Produtos no Estoque</h1>
    <div class="button">
      <asp:Button ID="btninseri" runat="server" Text="Adicionar Produto" 
            onclick="btninseri_Click" ></asp:Button>
      <asp:Button ID="bntinseriestoque" runat="server" Text="Inseri Produto no Estoque" 
            onclick="bntinseriestoque_Click"></asp:Button>
      <asp:Button ID="bntatualizar" runat="server" Text="Atualizar Estoque" 
            onclick="bntatualizar_Click"></asp:Button>
      <asp:Button ID="btndeletar" runat="server" Text="Deletar Produto do Estoque" 
            onclick="btndeletar_Click"></asp:Button>  
      </div>
    <table>
            <thead>
            <th>Nome do Produto</th>
            <th>Descrição do Produto</th>
            <th>Quantidade do Produto</th>
            <th>Valor por Unidade</th>
            </thead>
            <tbody>
            <asp:Literal ID="littabela" runat="server"></asp:Literal>
            </tbody>

    </table>
    </main>
    </div>
    </form>
</body>
</html>
