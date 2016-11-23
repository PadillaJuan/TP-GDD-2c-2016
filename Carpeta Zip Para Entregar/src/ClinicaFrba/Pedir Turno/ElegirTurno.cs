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
        String nombreAfiliado;
        bool control;

        public ElegirTurno(string idP, string apellidoP, string nombreAfiliadoPasado)
        {
            InitializeComponent();
            label2.Text = "Dr. " + apellidoP;

            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
            nombreAfiliado = nombreAfiliadoPasado;

            inicializar();
        }

        public void inicializar()
        {
            dateTimePicker1.Enabled = true;
            dateTimePicker1.Text = DateTime.Parse(Program.nuevaFechaSistema()).ToString();
            dateTimePicker1.MinDate = DateTime.Parse(Program.nuevaFechaSistema());
       }

        private bool validaciones()
        {
            string comando = "SELECT agenda_fechayhora FROM agenda_profesional a JOIN turnos t ON (t.turno_agenda = a.agenda_id) JOIN cancelacion c ON (c.turno_id = t.turno_id)";
            DataTable dt = (new BDConnection()).cargarTablaSQL(comando);


            for (int i = 0; i <= (dt.Rows.Count - 1); i++)
            {
                control = false;
                DateTime idf = Convert.ToDateTime(dt.Rows[i][0]);
                if(dateTimePicker1.Value == idf) control=true;
            }

            return control;
        }

        private void filtrarFecha(DateTime fechaTurno)
        {
            string query2 = "SELECT DATEPART(hour,agenda_fechayhora)  FROM agenda_profesional WHERE agenda_fechayhora =" + fechaTurno.ToString() +")"; 
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
            Pedir_Turno.ListadoProfesionales volver = new Pedir_Turno.ListadoProfesionales(nombreAfiliado);
            volver.ShowDialog();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            if (validaciones() == false)
            {
                MessageBox.Show("El profesional no posee turnos disponibles ese dia");
            }
            filtrarFecha(DateTime.Parse(dateTimePicker1.Text));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Desea elegir ese turno?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
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
            //string query5 = "SELECT af_id FROM afiliado WHERE af_nombre = '" + nombreAfiliado + "'";
            //DataTable dt5 = (new BDConnection()).cargarTablaSQL(query5);
            //string usuarioID = dt5.Rows[0][0].ToString();

            //string agendarTurno = 
            //(new BDConnection()).ejecutarComandoSQL(agendarTurno);
        }
    }
}
