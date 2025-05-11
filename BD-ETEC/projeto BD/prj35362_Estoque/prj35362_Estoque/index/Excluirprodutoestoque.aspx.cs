using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace prj35362_Estoque.index
{
    public partial class Excluirprodutoestoque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=prjEstoque";
                MySqlConnection conexao = new MySqlConnection(linhaConexao);
                try
                {
                    conexao.Open();
                    string comando = "select nm_produto from produto";
                    MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                    MySqlDataReader dados = cSQL.ExecuteReader();
                    while (dados.Read())
                    {
                        DPlistp.Items.Insert(0, dados["nm_produto"].ToString());

                    }
                    dados.Close();
                    conexao.Close();
                }
               catch
               {
                   Response.Redirect("../estoque.aspx");
               }
        }
            
        }


        protected void bntvoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../estoque.aspx");
        }

        protected void bntexcluir_Click(object sender, EventArgs e)
        {
            string Valor;
            Valor = DPlistp.SelectedValue.ToString();
            string cdp = "";

            string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=prjEstoque";
            MySqlConnection conexao = new MySqlConnection(linhaConexao);
            try
            {
                conexao.Open();
                string comando = "select cd_produto from produto where nm_produto='" + Valor + "'";
                MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                MySqlDataReader dados = cSQL.ExecuteReader();

                while (dados.Read())
                {
                    cdp = "" + dados["cd_produto"].ToString() + "";

                }
                dados.Close();
                string comando3 = "delete from estoque where cd_produto='"+ int.Parse(cdp) +"'";
                MySqlCommand cSQL2 = new MySqlCommand(comando3, conexao);
                cSQL2.ExecuteNonQuery();

                conexao.Close();
                Label1.Text = "Produto Excluido do Estoque";
            }
            catch
            {
                Response.Redirect("../estoque.aspx");
            }
           
        }


    }
}