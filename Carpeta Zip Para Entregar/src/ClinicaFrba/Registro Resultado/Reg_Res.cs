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
        int consulta;

        public Reg_Res()
        {
            InitializeComponent();
            setButtons();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.AutoResizeColumns();
            dataGridView1.ReadOnly = true;
            dataGridView1.MultiSelect = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            button2.Enabled = true;
            dataGridView1.DataSource = null;
            if (validarEntrada())
            {
                DataTable table = new DataTable();
                int id = Int32.Parse(textBox1.Text)/100;
                int id_rel = Int32.Parse(textBox1.Text)%100;
                SqlConnection cn = (new BDConnection()).getInstance();
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
            if (validarSeleccion())
            {
                button4.Enabled = true;
                dataGridView1.ReadOnly = true;
                button2.Enabled = false;
                textBox1.Enabled = false;
                textBox2.Enabled = true;
                textBox3.Enabled = true;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (validarTexto())
            {
                SqlConnection cn = (new BDConnection()).getInstance();
                SqlCommand cm = new SqlCommand("finalizarConsulta", cn);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@cons_id", consulta);
                cm.Parameters.AddWithValue("@sintomas", textBox2.Text);
                cm.Parameters.AddWithValue("@diagnostico", textBox3.Text);
                cm.ExecuteNonQuery();
                Close();
            }
        }

        private void setButtons()
        {
            button2.Enabled = false;
            button4.Enabled = false;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
        }

        public bool validarEntrada()
        {
            int n;
            return Int32.TryParse(textBox1.Text, out n);
        }

        public bool validarSeleccion()
        {
            bool flag = false;
            try
            {
                int index = dataGridView1.CurrentCell.RowIndex;
                consulta = Int32.Parse(dataGridView1.Rows[index].Cells[0].Value.ToString());
                flag = true;
            }
            catch (Exception e)
            {
                MessageBox.Show("No se ha seleccionado ninguna consulta", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return flag;
        }

        public bool validarTexto()
        {
            bool n = textBox2.Text.Length > 0 && textBox3.Text.Length > 0;
            return n;
        }

    }
}
