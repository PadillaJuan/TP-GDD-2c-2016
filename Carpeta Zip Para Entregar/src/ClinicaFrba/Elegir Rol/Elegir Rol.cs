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
        int us_idG;
        DataTable tabla;
        public Elegir_Rol(int us_id)
        {
            InitializeComponent();
            rolSelection.DropDownStyle = ComboBoxStyle.DropDownList;
            llenarComboBox(us_id);
        }

        //TRAE LOS ROLES DEL USUARIO
        public void llenarComboBox(int us_id) 
        {
            SqlConnection conn = (new BDConnection()).getInstance();
            string query = String.Format("DREAM_TEAM.getRolesPorUsuario", us_id);
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@us_id", us_id));
            string rol;
            us_idG = us_id;
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    rol = dr.GetString(1);
                    rolSelection.Items.Add(dr.GetString(1));
                }
                dr.Dispose();
                SqlDataAdapter sda = new SqlDataAdapter(com);
                tabla = new DataTable();
                sda.Fill(tabla);
                sda.Dispose();
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
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int i = rolSelection.SelectedIndex;
            String texto = rolSelection.Text;
            if (i != -1)
            {
                i = (int ) tabla.Rows[i][0];
                Elegir_Accion.Elegir_Accion form = new Elegir_Accion.Elegir_Accion(i,us_idG);
                Close();
                form.Show();
            }
            else 
            {
                MessageBox.Show("No se ha seleccionado ningun rol", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
