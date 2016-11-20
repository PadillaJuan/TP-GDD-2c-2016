using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using ClinicaFrba.Utils;

namespace ClinicaFrba.Pedir_Turno
{
    public partial class ElegirTurno : Form
    {
        string id;
        string wheres;
        Form form;
        String nombreUsuario;

        public ElegirTurno(string idP, string apellidoP, string nombreUsuarioPasado)
        {
            InitializeComponent();
            label2.Text = "Dr. " + apellidoP;

            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
            nombreUsuario = nombreUsuarioPasado;

            inicializar();
        }

        public void inicializar()
        {
            dateTimePicker1.Enabled = false;
            dateTimePicker1.Text = DateTime.Parse(Program.nuevaFechaSistema()).ToString();

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

        private void filtrarFecha(DateTime fechaTurno)
        {
            string query2 = "SELECT DATEPART ( HOUR , turno_fecha )  FROM Turnos WHERE turno_fecha > fechaTurno"; 
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);
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
            //Pedir_Turno.ListadoProfesionales volver = new Pedir_Turno.ListadoProfesionales();
            //volver.ShowDialog();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            if (!validaciones())
            {
                return;
            }

            filtrarFecha(dateTimePicker1.Value);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Desea realizar la oferta?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
                if (!validaciones())
                {
                    return;
                }

                agendar();
                MessageBox.Show("Turno seleccionado correctamente", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                form.Close();
                this.Close();
            }
        }

        private void agendar()
        {
            //string query5 = "SELECT us_id FROM usuarios WHERE  = '" + nombreUsuario + "'";
            //DataTable dt5 = (new ConexionSQL()).cargarTablaSQL(query5);
            //string usuarioID = dt5.Rows[0][0].ToString();
        }
    }
}
