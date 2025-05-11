<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Excluirprodutoestoque.aspx.cs" Inherits="prj35362_Estoque.index.Excluirprodutoestoque" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Excluir Produto do Estoque</title>
    <link href="../css/Estilo.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <main class="oo">
    <h2 class="h3">Excluir Produto do Estoque</h2>
    
    <div class="dd">
    <asp:Label ID="lblnomep" runat="server" Text="Produto"></asp:Label><br />
    <asp:DropDownList ID="DPlistp" runat="server"></asp:DropDownList><br />
    <br />
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="bntexcluir" runat="server" Text="Excluir" onclick="bntexcluir_Click" class="button2"></asp:Button>
    <asp:Button ID="bntvoltar" runat="server" Text="Voltar" onclick="bntvoltar_Click" class="button2"></asp:Button>
    </div>
    
    
    </main>
    </div>
    </form>
</body>
</html>
