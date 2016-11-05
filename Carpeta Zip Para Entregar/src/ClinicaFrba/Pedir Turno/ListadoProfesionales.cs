using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Pedir_Turno
{
    public partial class ListadoProfesionales : Form
    {
        int numeroPagina;
        int cantTotalPags;
        String wheres;

        public ListadoProfesionales()
        {
            InitializeComponent();
            /*dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            string comando = "SELECT * FROM especialidad";
            DataTable dt = (new BDConnection()).cargarTablaSQL(comando);

            ChkListEspecialidades.Items.Clear();
            for (int i = 0; i <= (dt.Rows.Count - 1); i++)
            {
                int idf = Convert.ToInt32(dt.Rows[i][0]);
                ChkListEspecialidades.Items.Insert(i, new Especialidades(idf, dt.Rows[i][2].ToString(), this));
            }

            inicializar();*/
          
        }

        /* private void inicializar()
         {
             dataGridView1.RowTemplate.MinimumHeight = 33;
            txtDescrip.Text = "";


             for (int i = 0; i <= ChkListEspecialidades.Items.Count - 1; i++)
             {
                 ChkListEspecialidades.SetItemCheckState(i, CheckState.Checked);
             }

             filtrarPag(1);

         }

         private void armarWhere()
         {
             wheres = wheres + "(";
             foreach (Especialidades elemento in ChkListEspecialidades.CheckedItems)
             {
                 wheres = wheres + " '" + elemento.Descripcion + "',";
             }
             wheres = wheres.Substring(0, wheres.Length - 1);
             wheres = wheres + ")";
             
            if (txtDescrip.Text != "")
            {
                wheres = wheres + " AND profesional.prof_apellido LIKE '%" + txtDescrip.Text + "%'";
            }
   
         }*/

        /*private void filtrarPag(int pagina)
        {
            numeroPagina = pagina;
            labelNumPag.Text = Convert.ToString(pagina);
            if (ChkListEspecialidades.CheckedIndices.Count == 0)
            {
                MessageBox.Show("Se debe elegir al menos una especialidad", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            };

            wheres = "";
            armarWhere();

            string query2 = "SELECT COUNT(prof_id) FROM profesional P JOIN GDD_15.ESTADOS E ON (P.N_ID_ESTADO = E.N_ID_ESTADO) JOIN GDD_15.TIPOS T ON (P.N_ID_TIPO = T.N_ID_TIPO) JOIN GDD_15.VISIBILIDADES V ON (P.C_VISIBILIDAD = V.C_VISIBILIDAD) JOIN GDD_15.USUARIOS U ON (P.N_ID_USUARIO = U.N_ID_USUARIO) JOIN GDD_15.RUBROS R ON (P.N_ID_RUBRO = R.N_ID_RUBRO) WHERE C_TIPO = '" + formato + "' AND C_ESTADO IN ('Activa', 'Pausada') AND C_USUARIO_NOMBRE != '" + nombreUsuario + "' AND R.D_DESCRED IN " + wheres;
            DataTable dt2 = (new BDConnection()).cargarTablaSQL(query2);
            string cantidadProf = dt2.Rows[0][0].ToString();
            int cantProf = Convert.ToInt16(cantidadProf);
            if ((cantProf % 10) == 0)
            {
                cantTotalPags = (cantProf / 10);
            }
            else
            {
                cantTotalPags = (cantProf / 10) + 1;
            }

            if (pagina == cantTotalPags)
            {
                buttonSigPag.Enabled = false;
            }
            else if (pagina < cantTotalPags)
            {
                buttonSigPag.Enabled = true;
            }

            if (pagina == 1)
            {
                buttonPaginaAnt.Enabled = false;
                buttonPriPag.Enabled = false;

                if (cantTotalPags == 1)
                {
                    buttonSigPag.Enabled = false;
                }
                else
                {
                    buttonSigPag.Enabled = true;
                }
            }
            else
            {
                buttonPaginaAnt.Enabled = true;
                buttonPriPag.Enabled = true;
            }

            if (cantProf == 0)
            {
                buttonSigPag.Enabled = false;
            }

            string campos = "";
            string campos2 = "";
            string campos3 = "";

            if (formato == "Compra Inmediata")
            {
                campos = "N_ID_PUBLICACION Código, C_USUARIO_NOMBRE 'Nombre Usuario', P.D_DESCRED Descripción, R.D_DESCRED Rubro, N_PRECIO 'Precio ($)', N_STOCK Stock, C_PERMITE_ENVIO 'Permite envio', F_VENCIMIENTO 'Fecha Vencimiento', C_ESTADO 'Estado'";
                campos2 = "N_ID_PUBLICACION Código, C_USUARIO_NOMBRE, P.D_DESCRED Descripción, R.D_DESCRED Rubro, N_PRECIO, N_STOCK Stock, C_PERMITE_ENVIO, F_VENCIMIENTO, N_COMISION_PRECIO, C_ESTADO";
                campos3 = "Código, C_USUARIO_NOMBRE 'Nombre Usuario', Descripción, Rubro, N_PRECIO 'Precio ($)', Stock, C_PERMITE_ENVIO 'Permite envio', F_VENCIMIENTO 'Fecha Vencimiento', C_ESTADO 'Estado'";
            }
            else if (formato == "Subasta")
            {
                campos = "N_ID_PUBLICACION Código, C_USUARIO_NOMBRE 'Nombre Usuario', P.D_DESCRED Descripción, R.D_DESCRED Rubro, N_PRECIO 'Precio Inicio ($)', C_PERMITE_ENVIO 'Permite envio', F_INICIO 'Fecha Inicio', F_VENCIMIENTO 'Fecha Vencimiento', C_ESTADO 'Estado'";
                campos2 = "N_ID_PUBLICACION Código, C_USUARIO_NOMBRE, P.D_DESCRED Descripción, R.D_DESCRED Rubro, N_PRECIO, C_PERMITE_ENVIO, F_INICIO, F_VENCIMIENTO, N_COMISION_PRECIO, C_ESTADO";
                campos3 = "Código, C_USUARIO_NOMBRE 'Nombre Usuario', Descripción, Rubro, N_PRECIO 'Precio Inicio ($)', C_PERMITE_ENVIO 'Permite envio',  F_INICIO 'Fecha Inicio', F_VENCIMIENTO 'Fecha Vencimiento', C_ESTADO 'Estado'";
            }

            if (pagina == 1)
            {
                CompletadorDeTablas.hacerQuery("SELECT TOP 10 " + campos + " FROM GDD_15.PUBLICACIONES P JOIN GDD_15.ESTADOS E ON (P.N_ID_ESTADO = E.N_ID_ESTADO) JOIN GDD_15.TIPOS T ON (P.N_ID_TIPO = T.N_ID_TIPO) JOIN GDD_15.VISIBILIDADES V ON (P.C_VISIBILIDAD = V.C_VISIBILIDAD) JOIN GDD_15.USUARIOS U ON (P.N_ID_USUARIO = U.N_ID_USUARIO) JOIN GDD_15.RUBROS R ON (P.N_ID_RUBRO = R.N_ID_RUBRO) WHERE C_TIPO = '" + formato + "' AND C_ESTADO IN ('Activa', 'Pausada') AND C_USUARIO_NOMBRE != '" + nombreUsuario + "' AND R.D_DESCRED IN " + wheres + " ORDER BY V.N_COMISION_PRECIO DESC, C_PERMITE_ENVIO DESC, N_PRECIO ASC", ref dataGridView1);
            }
            else
            {
                CompletadorDeTablas.hacerQuery("SELECT TOP 10 " + campos3 + " FROM (SELECT TOP " + (cantPublis - (pagina - 1) * 10).ToString() + " " + campos2 + " FROM GDD_15.PUBLICACIONES P JOIN GDD_15.ESTADOS E ON (P.N_ID_ESTADO = E.N_ID_ESTADO) JOIN GDD_15.TIPOS T ON (P.N_ID_TIPO = T.N_ID_TIPO) JOIN GDD_15.VISIBILIDADES V ON (P.C_VISIBILIDAD = V.C_VISIBILIDAD) JOIN GDD_15.USUARIOS U ON (P.N_ID_USUARIO = U.N_ID_USUARIO) JOIN GDD_15.RUBROS R ON (P.N_ID_RUBRO = R.N_ID_RUBRO) WHERE C_TIPO = '" + formato + "' AND C_ESTADO IN ('Activa', 'Pausada') AND C_USUARIO_NOMBRE != '" + nombreUsuario + "' AND R.D_DESCRED IN " + wheres + " ORDER BY N_COMISION_PRECIO ASC, C_PERMITE_ENVIO ASC, N_PRECIO DESC) SQ ORDER BY N_COMISION_PRECIO DESC, C_PERMITE_ENVIO DESC, N_PRECIO ASC", ref dataGridView1);
            }

            dataGridView1.RowTemplate.MinimumHeight = 33;
          * 
          
        }*/

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            /*inicializar();*/
        }

        private void button3_Click(object sender, EventArgs e)
        {
            /*filtrarPag(1);*/
        }

        private void buttonElegirPub_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count != 0)
            {

            }

            else
            {
                MessageBox.Show("Por favor, elija un Profesional", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void buttonPriPag_Click(object sender, EventArgs e)
        {
            if (ChkListEspecialidades.CheckedIndices.Count == 0)
            {
                MessageBox.Show("Se debe elegir al menos un rubro", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            };

           /* filtrarPag(1);*/
        }

        private void bindingSource1_CurrentChanged(object sender, EventArgs e)
        {

        }

        private void ChkListEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonReestablecer_Click(object sender, EventArgs e)
        {
            for (int i = 0; i <= ChkListEspecialidades.Items.Count - 1; i++)
            {
                ChkListEspecialidades.SetItemCheckState(i, CheckState.Unchecked);
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtDescrip_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
