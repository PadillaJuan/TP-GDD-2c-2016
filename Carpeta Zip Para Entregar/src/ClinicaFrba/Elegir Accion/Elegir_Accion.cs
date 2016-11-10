using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ClinicaFrba.Elegir_Accion
{
    public partial class Elegir_Accion : Form
    {
        DataTable tabla;
        public Elegir_Accion(int rol_id)
        {
            InitializeComponent();
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            llenarComboBox(rol_id);
        }

        public void llenarComboBox(int rol_id)
        {
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            string query = String.Format("exec getFuncionalidadesPorRol({0})", rol_id);
            SqlCommand com = new SqlCommand(query, conn);
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    comboBox1.Items.Add(dr["rol_nombre"]);
                }
                SqlDataAdapter sda = new SqlDataAdapter(com);
                tabla = new DataTable();
                sda.Fill(tabla);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int i = getSelectedAccion();
            switch (i)
            {
                case 1:
                    // ABM ROL
                    break;
                case 2:
                    // ABM AFILIADO
                    BuscarAfiliado.BuscarAfi f2 = new BuscarAfiliado.BuscarAfi();
                    f2.Show();
                    break;
                case 3:
                    // ABM PROFESIONAL
                    break;
                case 4:
                    // REGISTRAR AGENDA PROFESIONAL
                    break;
                case 5:
                    // COMPRA DE BONOS
                    break;
                case 6:
                    // PEDIDO DE TURNO
                    break;
                case 7:
                    // REGISTRO DE LLEGADA
                    break;
                case 8:
                    // REGISTRO DE RESULTADO
                    break;
                case 9:
                    // CANCELAR ATENCION MEDICA
                    break;
                case 10:
                    // LISTADO ESTADISTICO
                    break;
                default:
                    MessageBox.Show("No se ha seleccionado ninguna accion",Application.ProductName,MessageBoxButtons.OK,MessageBoxIcon.Error);
                    break;
            }
        }

        public int getSelectedAccion() 
        {
            int j = 0;
            String texto = comboBox1.Text;
            for (j = 0; j < comboBox1.Items.Count; j++)
            {
                if ((string)tabla.Rows[j]["fun_nombre"] == texto) 
                { 
                    return (int )tabla.Rows[j]["fun_id"]; 
                }
            }
             return 0;
        }
    }
}
