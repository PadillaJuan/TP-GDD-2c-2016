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
        public Elegir_Rol(int us_id)
        {
            InitializeComponent();
            rolSelection.DropDownStyle = ComboBoxStyle.DropDownList;
            llenarComboBox(us_id);
        }

        public void llenarComboBox(int us_id) 
        {
            SqlConnection conn = (new BDConnection()).getConnection();
            string query = String.Format("getRolesPorUsuario",us_id);
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@us_id", us_id));
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

            int i = 0, j = 0;
            String texto = rolSelection.Text;
            for (j = 0; j < rolSelection.Items.Count; j++)
            {
                if ((string)tabla.Rows[j]["rol_nombre"] == texto)
                {
                   i = (int)tabla.Rows[j]["rol__id"];
                }
            }
            if (i > 0)
            {
                Elegir_Accion.Elegir_Accion form = new Elegir_Accion.Elegir_Accion(i);
                Hide();
                form.Show();
            }
            else 
            {
                MessageBox.Show("No se ha seleccionado ningun rol", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
