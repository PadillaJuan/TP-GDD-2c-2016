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

namespace ClinicaFrba.Registro_Resultado
{
    public partial class Reg_Res : Form
    {
        public Reg_Res()
        {
            InitializeComponent();
            setButtons();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            button2.Enabled = true;
            if (validarEntrada())
            {
                DataTable table = new DataTable();
                int id = Int32.Parse(textBox1.Text)/100;
                int id_rel = Int32.Parse(textBox1.Text)%100;
                SqlConnection cn = new SqlConnection();
                SqlCommand cm = new SqlCommand("getConsultas", cn);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@af_id", id);
                cm.Parameters.AddWithValue("@af_rel_id", id_rel);
                SqlDataAdapter sda = new SqlDataAdapter(cm);
                sda.Fill(table);
                dataGridView1.DataSource = table;
            }
            else
            {
                MessageBox.Show("No se ingreso un numero de afiliado válido", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            button4.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void setButtons()
        {
            button2.Enabled = false;
            button4.Enabled = false;
        }

        public bool validarEntrada()
        {
            int n;
            return !Int32.TryParse(textBox1.Text, out n);
        }
    }
}
