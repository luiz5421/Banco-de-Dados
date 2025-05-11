using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace prj35362_Estoque
{
    public partial class estoque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=prjEstoque";
                MySqlConnection conexao = new MySqlConnection(linhaConexao);
                try
                {
                    conexao.Open();
                    string comando = "select p.nm_produto,p.ds_produto,e.qt_produto,e.vl_unitario_produto from estoque e join produto p on (e.cd_produto = p.cd_produto)";
                    MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                    MySqlDataReader dados = cSQL.ExecuteReader();
                    while (dados.Read())
                    {

                        littabela.Text += "<tr class='info'>";
                        littabela.Text += "<td> " + dados["nm_produto"].ToString() + "</td>";
                        littabela.Text += "<td>" + dados["ds_produto"].ToString() + "</td>";
                        littabela.Text += "<td>" + dados["qt_produto"].ToString() + "</td>";
                        littabela.Text += "<td>R$" + dados["vl_unitario_produto"].ToString() + "</td>";
                        littabela.Text += "</tr>";
                    }
                    dados.Close();
                    conexao.Close();
                }
                catch
                {
                    Response.Redirect("erro.html");
                }

            }
        

        protected void btninseri_Click(object sender, EventArgs e)
        {
            Response.Redirect("index/Inseriproduto.aspx");
        }

        protected void bntinseriestoque_Click(object sender, EventArgs e)
        {
            Response.Redirect("index/Inseriestoque.aspx");
        }

        protected void bntatualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index/Atualizarestoque.aspx");
        }

        protected void btndeletar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index/Excluirprodutoestoque.aspx");
        }
    }
}