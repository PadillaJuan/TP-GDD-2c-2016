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
using System.Data.Sql;

namespace ClinicaFrba.BuscarAfiliado
{
    public partial class BuscarAfi : Form
    {
        public BuscarAfi()
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
        }

        private void button1_Click(object sender, DataGridViewCellEventArgs e) // AGREGAR FAMILIAR
        {
            long id = getId(e);
            Abm_Afiliado.ABM_afi form = new Abm_Afiliado.ABM_afi(2, id);
        }

        private void button2_Click(object sender, DataGridViewCellEventArgs e) // DAR DE BAJA
        {

            long id = getId(e);
            if (id == 0)
            {
                MessageBox.Show("No se ha seleccionado", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                SqlConnection Conn = (new BDConnection()).getConnection();
                String query = String.Format("exec bajaAfiliado({0})", id);
                SqlCommand com = new SqlCommand(query, Conn);
                com.ExecuteNonQuery();
                Conn.Close();
            }
        }

        private void button4_Click(object sender, EventArgs e) // CERRAR PROGRAMA
        {
            Close();
        }

        private void button5_Click(object sender, EventArgs e) // VOLVER
        {
            Hide();
        }

        private void button6_Click(object sender, EventArgs e) // BUSCAR AFILIADO/S
        {
            if (validarEntrada())
            {
                String query = generateSearchQuery();
                SqlConnection conn = new SqlConnection();
                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataAdapter sda = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                dataGridView1.DataSource = dt;
            }

        }

        private bool validarEntrada()
        {
            bool flag = true;
            int n;
            if (!(checkBox1.Checked || checkBox2.Checked || checkBox3.Checked))
            {
                MessageBox.Show("No se ha seleccionado opcion de busqueda", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                flag = false;
            }
            else
            {
                if (checkBox1.Checked && (textBox1.Text.Length == 0 || !int.TryParse(textBox1.Text,out n)))
                {
                    MessageBox.Show("No se ha ingresado un numero de afiliado válido", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    flag = false;
                }
                if (checkBox2.Checked && (textBox2.Text.Length == 0 || !textBox2.Text.All( c => Char.IsLetter(c) )))
                {
                    MessageBox.Show("No se ha ingresado un nombre de afiliado válido", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    flag = false;
                }
                if (checkBox3.Checked && (textBox3.Text.Length == 0 || !textBox3.Text.All(c => Char.IsLetter(c)  ))) 
                {
                    MessageBox.Show("No se ha ingresado un apellido de afiliado válido", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    flag = false;
                }
            }
            return flag;
        }

        private long getId(DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            long id = ((long)linea.Cells[0].Value) * 100 + (long)linea.Cells[1].Value;
            return id;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        public String generateSearchQuery()
        {
            bool flag= false;
            string query = "SELECT * FROM afiliados WHERE ";
            if (checkBox1.Checked) {
                String id, rel;
                id = String.Format("{0}", int.Parse(textBox1.Text) / 100);
                rel = String.Format("{0}", int.Parse(textBox1.Text) % 100);
                query += String.Format("af_id = {0} AND af_rel_id = {1} ", id, rel);
                flag = true;
                
            }
            if (checkBox2.Checked)
            {
                if (flag) { query += "AND";};
                query += String.Format("af_nombre like {0}",textBox2.Text);
                flag = true;
            }
            if (checkBox3.Checked)
            {
                if (flag) { query += "AND"; };
                query += String.Format("af_apellido like {0}",textBox3.Text);
            }
            return query;

        }

    }
}
