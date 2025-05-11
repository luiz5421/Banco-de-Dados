<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Atualizarestoque.aspx.cs" Inherits="prj35362_Estoque.index.Atualizarestoque" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Atualizar Estoque</title>
    <link href="../css/Estilo.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <main class="oo">
    <h2 class="h3">Atualizar Estoque</h2>
    
    <div class="dd">
    <asp:Label ID="lblnomep" runat="server" Text="Produto"></asp:Label><br />
    <asp:DropDownList ID="DPlist" runat="server"></asp:DropDownList><br />
    <br />
    <asp:Label ID="lblqt" runat="server" Text="Quantidade do Produto:"></asp:Label><br />
    <asp:TextBox ID="txtqte" runat="server"></asp:TextBox><br />
    <br />
    <asp:Label ID="lblvlu" runat="server" Text="Valor Unitario:"></asp:Label><br />
    <asp:TextBox ID="txtvlue" runat="server"></asp:TextBox><br />
    <br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="bntsalvar" runat="server" Text="Salvar" onclick="bntsalvar1_Click" class="button2"></asp:Button>
    <asp:Button ID="bntlimpar" runat="server" Text="Limpar" onclick="bntlimpar_Click" class="button2"></asp:Button>
    <asp:Button ID="bntvoltar" runat="server" Text="Voltar" onclick="bntvoltar_Click" class="button2"></asp:Button>
    </div>
    
    
    </main>
    </div>
    </form>
</body>
</html>
