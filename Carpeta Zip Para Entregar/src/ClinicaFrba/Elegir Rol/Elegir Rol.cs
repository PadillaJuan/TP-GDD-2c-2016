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

namespace ClinicaFrba.Elegir_Rol
{
    public partial class Elegir_Rol : Form
    {
        DataTable tabla;
        public Elegir_Rol(long us_id)
        {
            InitializeComponent();
            rolSelection.DropDownStyle = ComboBoxStyle.DropDownList;
            llenarComboBox(us_id);
        }

        public void llenarComboBox(long us_id) 
        {
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            string query = String.Format("exec getRolesPorUsuario({0})",us_id);
            SqlCommand com = new SqlCommand(query, conn);
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    rolSelection.Items.Add(dr["rol_nombre"]);
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

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            int index = rolSelection.SelectedIndex;
            int rol_id = (Int32) tabla.Rows[index]["rol_id"];
            Elegir_Accion.Elegir_Accion form = new Elegir_Accion.Elegir_Accion(rol_id);
            Hide();
            form.Show();
        }
    }
}
