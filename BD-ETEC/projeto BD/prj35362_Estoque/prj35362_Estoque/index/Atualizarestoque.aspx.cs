using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace prj35362_Estoque.index
{
    public partial class Atualizarestoque : System.Web.UI.Page
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
                        DPlist.Items.Insert(0, dados["nm_produto"].ToString());

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

        protected void bntlimpar_Click(object sender, EventArgs e)
        {
            txtqte.Text = "";
            txtvlue.Text = "";
            Label1.Text = "";
            txtqte.Focus();
        }

        protected void bntvoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../estoque.aspx");
        }

        protected void bntsalvar1_Click(object sender, EventArgs e)
        {
            if (txtqte.Text == "")
            {
                txtqte.Focus();
                return;
            }
            if (txtvlue.Text == "")
            {
                txtvlue.Focus();
                return;
            }


            string Valor;
            Valor = DPlist.SelectedValue.ToString();
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
               
                string comando3 = " UPDATE estoque SET qt_produto='"+int.Parse(txtqte.Text)+"', vl_unitario_produto='"+ decimal.Parse(txtvlue.Text)+"' WHERE cd_produto='"+int.Parse(cdp)+"'";
                MySqlCommand cSQL3 = new MySqlCommand(comando3, conexao);
                cSQL3.ExecuteNonQuery();
                conexao.Close();
                Label1.Text = "Estoque Atualizado";
            }
            catch
            {
                Response.Redirect("../estoque.aspx");
            }
        }
    }
}