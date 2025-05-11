using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace prj35362_Estoque.index
{
    public partial class Inseriestoque : System.Web.UI.Page
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
                        DropDownList1.Items.Insert(0, dados["nm_produto"].ToString());

                    }
                    dados.Close();
                    conexao.Close();
                    
                }
                catch
               {
                    Response.Redirect("erro.htm");
                }


            }
        }

        protected void bntlimpar_Click(object sender, EventArgs e)
        {
            txtqt.Text = "";
            txtvlu.Text = "";
            Label1.Text = "";
            txtqt.Focus();
        }

        protected void bntvoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../estoque.aspx");
        }

        protected void bntsalvar_Click(object sender, EventArgs e)
        {
            if (txtqt.Text== "") 
            {
                txtqt.Focus();
                return;
            }
            if (txtvlu.Text== "")
            {
                txtvlu.Focus();
                return;
            }
            string Valor;
            Valor = DropDownList1.SelectedValue.ToString();
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
                 
                 string comando3 = " insert into estoque values(01,'" + int.Parse(cdp) + "','" + int.Parse(txtqt.Text) + "','" + decimal.Parse(txtvlu.Text) + "')";
                 MySqlCommand cSQL3 = new MySqlCommand(comando3, conexao);
                 cSQL3.ExecuteNonQuery();
                 conexao.Close();
                 Label1.Text = "Produto Adicionado no Estoque";
            }
            catch
            {
                Response.Redirect("../estoque.aspx");
            }
        }
    }
}