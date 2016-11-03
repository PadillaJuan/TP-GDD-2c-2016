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

            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            long id = (long) linea.Cells[0].Value;
            if (id == null)
            {
                MessageBox.Show("No se ha buscado ningun afiliado", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                SqlConnection Conn = BDConnection.getConnection();
                String query = String.Format("exec bajaAfiliado({0})", id);
                SqlCommand com = new SqlCommand(query, Conn);
                com.ExecuteNonQuery();
                Conn.Close();
            }
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



    }
}
