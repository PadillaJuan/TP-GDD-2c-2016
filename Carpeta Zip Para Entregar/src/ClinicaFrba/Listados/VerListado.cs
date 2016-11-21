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

namespace ClinicaFrba.Listados
{
    public partial class VerListado : Form
    {
        public VerListado(SqlCommand cm)
        {
            InitializeComponent();
            fillDGV(cm);
        }

        private void fillDGV(SqlCommand cm)
        {
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            sda.Dispose();
            dataGridView1.DataSource = tabla;
            dataGridView1.AutoResizeColumns();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
