using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Pedir_Turno
{
    public partial class ElegirTurno : Form
    {
        string id;
        string wheres;

        public ElegirTurno(string id, string apellido)
        {
            InitializeComponent();
            label2.Text = "Dr. " + apellido;

            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            //inicializar();
        }

        public void inicializar()
        {
            dateTimePicker1.Enabled = false;
            dateTimePicker1.Text = DateTime.Parse(Program.nuevaFechaSistema()).ToString();

        }

        private void armarWheres()
        {
            /*wheres = "";

            wheres = wheres + "WHERE [Fecha???] IN (";

            wheres = wheres + " AND [Fecha Alta] BETWEEN '" + DateTime.Parse(dateTimePicker1.Text) + "' AND '" + /*fecha dfutura??? + "'";*/
        }

        private bool validaciones()
        {
            DateTime ini = DateTime.Parse(dateTimePicker1.Text);
            DateTime today = DateTime.Parse(Program.nuevaFechaSistema());

            if (ini > today)
            {
                MessageBox.Show("La fecha de inicio tiene que ser anterior o igual a la de hoy", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            return true;
        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void ElegirTurno_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Hide();
            Pedir_Turno.ListadoProfesionales volver = new Pedir_Turno.ListadoProfesionales();
            volver.ShowDialog();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
