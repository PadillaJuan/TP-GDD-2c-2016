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
            String texto = comboBox1.Text;
            switch (texto)
            {
                case "ABM de Rol":
                    // ABM ROL
                    break;
                case "ABM de Afiliado":
                    // ABM AFILIADO
                    BuscarAfiliado.BuscarAfi f2 = new BuscarAfiliado.BuscarAfi();
                    f2.Show();
                    break;
                case "ABM de Profesional":
                    // ABM PROFESIONAL
                    break;
                case "Registrar Agenda Profesional":
                    // REGISTRAR AGENDA PROFESIONAL
                    break;
                case "Compra de Bonos":
                    // COMPRA DE BONOS
                    break;
                case "Pedido de Turno":
                    // PEDIDO DE TURNO
                    break;
                case "Registro de Llegada":
                    // REGISTRO DE LLEGADA
                    break;
                case "Registro de Resultado":
                    // REGISTRO DE RESULTADO
                    break;
                case "Cancelar Atencion Medica":
                    // CANCELAR ATENCION MEDICA
                    break;
                case "Listado Estadistico":
                    // LISTADO ESTADISTICO
                    break;
                default:
                    MessageBox.Show("No se ha seleccionado ninguna accion",Application.ProductName,MessageBoxButtons.OK,MessageBoxIcon.Error);
                    break;
            }
        }
    }
}
