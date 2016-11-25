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

namespace ClinicaFrba.Registro_Llegada
{
    public partial class Registro_Llegada : Form
    {
        DataTable tabla;
        int bono;
        List<int> lista;

        public Registro_Llegada()
        {
            InitializeComponent();
            lista = new List<int>();
            llenarComboBox();
            button4.Enabled = false;
            button5.Enabled = false;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (validarEntrada())
            {
                SqlConnection cn = (new BDConnection()).getInstance();
                SqlCommand cm = new SqlCommand("getTurnos", cn);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@af_id", getID());
                cm.Parameters.AddWithValue("@af_rel_id", getRelID());
                cm.Parameters.AddWithValue("@esp_id", getEspID());
                cm.Parameters.AddWithValue("@prof_apellido",textBox1.Text);
                cm.Parameters.AddWithValue("@fecha", DateTime.Parse(Program.nuevaFechaSistema()));
                SqlDataAdapter sda = new SqlDataAdapter(cm);
                tabla = new DataTable();
                sda.Fill(tabla);
                dataGridView1.DataSource = tabla;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SeleccionarBono form = new SeleccionarBono(getID(), getRelID());
            dataGridView1.ReadOnly = true;
            DialogResult res = form.ShowDialog();
            if (res == DialogResult.OK)
            {
                bono = form.bono;
                button5.Enabled = true;
                textBox2.Enabled = false;
                dataGridView1.ReadOnly = true;
            }
            else
            {
                dataGridView1.ReadOnly = false;
            }
            
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                checkearBono();
                int turno = getTurno();
                SqlConnection cn = (new BDConnection()).getInstance();
                SqlCommand cm = new SqlCommand("generateConsultaMedica", cn);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@turno_id", turno);
                cm.Parameters.AddWithValue("@bono_id", bono);
                cm.Parameters.AddWithValue("@hora_llegada", Program.nuevaFechaSistema());
                cm.Parameters.AddWithValue("@af_id", getID());
                cm.Parameters.AddWithValue("@af_rel_id", getRelID());
                cm.ExecuteNonQuery();
                cm.Dispose();
                Close();
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void llenarComboBox()
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand("getEspecialidadesMedicas", cn);
            cm.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cm.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(Int32.Parse(dr.GetValue(0).ToString()));
                comboBox1.Items.Add(dr.GetString(1));
            }
            dr.Close();
            dr.Dispose();
            cm.Dispose();
        }

        private bool validarEntrada()
        {
            bool flag = true;
            int n;
            if (Int32.TryParse(textBox2.ToString(), out n))
            {
                MessageBox.Show("No se ha ingresado ningun numero de afiliado", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                flag = false;
            }
            if (checkBox1.Checked && comboBox1.SelectedIndex == -1)
            {
                MessageBox.Show("Datos invalidos en la seleccion de especialidad", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                flag = false;
            }
            if (checkBox2.Checked && textBox1.Text.Length == 0)
            {
                MessageBox.Show("Datos invalidos en el apellido del profesional", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                flag = false;
            }
            return flag;
        }

        public long getID()
        {
            long ret;
            ret = long.Parse(textBox2.Text) / 100;
            return ret;
        }

        public int getRelID()
        {
            int ret;
            ret = int.Parse(textBox2.Text) % 100;
            return ret;
        }

        public int getEspID()
        {
            int ret;
            int index = comboBox1.SelectedIndex;
            ret = lista[index];
            return ret;
        }

        public int getTurno()
        {
            int ret;
            int index;
            index = dataGridView1.CurrentCell.RowIndex;
            ret = int.Parse(tabla.Rows[index][0].ToString());
            return ret;
        }

        public void checkearBono()
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand("checkBono", cn);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@bono_id", bono);
            cm.Parameters.AddWithValue("@turno_id", getTurno());
            cm.ExecuteNonQuery();
            cm.Dispose();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            button4.Enabled = true;
        }

     }
}
