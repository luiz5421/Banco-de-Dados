<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inseriproduto.aspx.cs" Inherits="prj35362_Estoque.index.Inseridados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inseri produto</title>
    <link href="../css/Estilo.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <main class="oo">
    <h2 class="h3">Adicionar Produto</h2>
    
    <div class="dd">
    <asp:Label ID="lblnomep" runat="server" Text="Nome do Produto:"></asp:Label><br />
    <asp:TextBox ID="txtnomep" runat="server" MaxLength="50"></asp:TextBox><br />
    <br />
    <asp:Label ID="lbldsp" runat="server" Text="Descrição do Produto"></asp:Label><br />
    <asp:TextBox ID="txtdsp" runat="server" MaxLength="80"></asp:TextBox><br />
    <br />
    <asp:Label ID="lbltipop" runat="server" Text="Tipo do Produto"></asp:Label><br />
    <asp:DropDownList ID="DP1" runat="server"></asp:DropDownList><br />
    <br />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label> <br />
    <asp:Button ID="bntsalvar" runat="server" Text="Salvar" onclick="bntsalvar_Click" class=" button2"></asp:Button>
    <asp:Button ID="bntlimpar" runat="server" Text="Limpar" onclick="bntlimpar_Click" class=" button2"></asp:Button>
    <asp:Button ID="bntvoltar" runat="server" Text="Voltar" onclick="bntvoltar_Click" class=" button2"></asp:Button>
    </div>
    
    
    </main>
    </div>
    </form>
</body>
</html>
