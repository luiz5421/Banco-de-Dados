using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace prj35362_Estoque.index
{
    public partial class Inseridados : System.Web.UI.Page
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
                    string comando = "select nm_tipo_produto from tipo_produto";
                    MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                    MySqlDataReader dados = cSQL.ExecuteReader();
                    while (dados.Read())
                    {
                        DP1.Items.Insert(0, dados["nm_tipo_produto"].ToString());

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
            
                txtnomep.Text = "";
                txtdsp.Text = "";
                Label1.Text = "";
                txtnomep.Focus();
            
        }

        protected void bntvoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../estoque.aspx");
        }

        protected void bntsalvar_Click(object sender, EventArgs e)
        {
            
                if (txtnomep.Text == "")
                {

                    txtnomep.Focus();
                    return;
                }

                if (txtdsp.Text == "")
                {

                    txtdsp.Focus();
                    return;
                }
                string Valor;
                Valor = DP1.SelectedValue.ToString();
                Label1.Text = Valor;
                string cdtp="", cdp="", nmp="";

                string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=prjEstoque";
                MySqlConnection conexao = new MySqlConnection(linhaConexao);
                try
                {
                    
                    conexao.Open();

                    string comand = "select nm_produto from produto where nm_produto='" + txtnomep.Text+"'";
                    MySqlCommand cSQL1 = new MySqlCommand(comand, conexao);
                    MySqlDataReader dados1 = cSQL1.ExecuteReader();

                    while (dados1.Read())
                    {
                        nmp = "" + dados1["nm_produto"].ToString() + "";

                    }
                    if (txtnomep.Text==nmp)
                    {
                        Label1.Text = "Produto já está no sistema";
                        return;
                    }
                    dados1.Close();



                    string comando = "select cd_tipo_produto from tipo_produto where nm_tipo_produto='"+Valor+"'";
                    MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                    MySqlDataReader dados = cSQL.ExecuteReader();

                    while (dados.Read())
                    {
                        cdtp = ""+dados["cd_tipo_produto"].ToString()+"";
                        
                    }

                    dados.Close();
                    string comando2 = "select max(cd_produto+1) as nk from produto";
                    MySqlCommand cSQL2 = new MySqlCommand(comando2, conexao);
                    MySqlDataReader dados2 = cSQL2.ExecuteReader();

                    while (dados2.Read())
                    {
                        cdp = "" + dados2["nk"].ToString() + "";
                    }
                    dados2.Close();

                    string comando3 =" insert into produto values('"+ int.Parse(cdp) + "','"+ int.Parse(cdtp) +"','"+ txtnomep.Text+"','"+ txtdsp.Text+"')";
                    MySqlCommand cSQL3 = new MySqlCommand(comando3, conexao);
                    cSQL3.ExecuteNonQuery();
                    conexao.Close();
                    Label1.Text = "Produto Adicionado no Sistema";
                }
                catch
                {
                    Response.Redirect("../estoque.aspx");
                }
            } 
        }
    }

            
                
                
       
        
