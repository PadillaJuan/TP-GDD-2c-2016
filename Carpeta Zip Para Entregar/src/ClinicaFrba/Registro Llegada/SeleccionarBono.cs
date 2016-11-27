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
    public partial class SeleccionarBono : Form
    {
        DataTable tabla;

        public int bono
        {
            get
            {
                return getBonoSeleccionado();
            }
        }

        public SeleccionarBono(long af_id, int af_rel_id)
        {
            InitializeComponent();
            llenarDGV(af_id, af_rel_id);
            dataGridView1.AutoResizeColumns();
            dataGridView1.MultiSelect = false;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.ReadOnly = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        public void llenarDGV(long af_id, int af_rel_id)
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand("getBonosDisponibles", cn);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@af_id", af_id);
            tabla = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            sda.Fill(tabla);
            dataGridView1.DataSource = tabla;
            sda.Dispose();
            cm.Dispose();
        }

        public int getBonoSeleccionado()
        {
            int ret, index;
            index = dataGridView1.CurrentCell.RowIndex;
            ret = int.Parse(tabla.Rows[index][0].ToString());
            return ret;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                int index;
                index = dataGridView1.CurrentCell.RowIndex;
                this.DialogResult = System.Windows.Forms.DialogResult.OK;
                Close();
            }
            catch (Exception a)
            {
                MessageBox.Show("No se ha seleccionado ningun bono", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
