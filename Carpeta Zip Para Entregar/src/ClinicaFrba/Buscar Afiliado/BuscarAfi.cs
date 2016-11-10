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
        }

        private void button2_Click(object sender, DataGridViewCellEventArgs e)
        {

            long id = getId(e);
            if (id == null)
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

        private long getId(DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            long id = (long)linea.Cells[0].Value;
            return id;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Hide();
            Elegir_Accion.Elegir_Accion form = new Elegir_Accion.Elegir_Accion();
            form.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, DataGridViewCellEventArgs e)
        {
            long id = getId(e);
            Abm_Afiliado.ABM_afi form = new Abm_Afiliado.ABM_afi(2,id);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            String query = generateQuery();
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            SqlCommand cm = new SqlCommand(query,conn);

        }

        public String generateQuery()
        {
            bool flag= false;
            string query = "SELECT * FROM afiliados WHERE ";
            if (checkBox1.Checked) { 
                String id,rel;
                id = String.Format("{0}",int.Parse(textBox1.Text)/100);
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
