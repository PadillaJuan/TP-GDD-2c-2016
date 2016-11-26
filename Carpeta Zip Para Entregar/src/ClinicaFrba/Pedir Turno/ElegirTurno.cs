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

using ClinicaFrba.Utils;


namespace ClinicaFrba.Pedir_Turno
{
    public partial class ElegirTurno : Form
    {
        string id;
        string wheres;
        Form form;
        long idAfiliado;
        bool control;
        int idProf;
        int idEsp;
        Form formato;
        long idRel;

        public ElegirTurno(int idP, string apellidoP, long idAfiliadoPasado, long relId, int espId, Form formatopasado)
        {
            InitializeComponent();
            label2.Text = "Dr. " + apellidoP;

            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
            idAfiliado = idAfiliadoPasado;
            idProf = idP;
            idEsp = espId;
            idRel = relId;
            formato = formatopasado;

            inicializar();
        }

        public void inicializar()
        {
            dateTimePicker1.Enabled = true;
            dateTimePicker1.Text = DateTime.Parse(Program.nuevaFechaSistema()).ToString();
            dateTimePicker1.MinDate = DateTime.Parse(Program.nuevaFechaSistema());
       }

        private void filtrarFecha(DateTime fechaTurno)
        {
            string query = String.Format("SELECT DATEPART(hour,agenda_fechayhora), DATEPART(minute, agenda_fechayhora), agenda_id  FROM agenda_profesional WHERE agenda_fechayhora = CONVERT(DATETIME,'{0}') ", fechaTurno.ToString());
            
            CompletadorDeTablas.hacerQuery(query, ref dataGridView1);
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DateTime fechaFiltrar = dateTimePicker1.Value;
            filtrarFecha(fechaFiltrar);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Desea elegir ese turno?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
              

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                int agenda_id = Int32.Parse(row.Cells["agenda_id"].Value.ToString());
                DateTime fecha = dateTimePicker1.Value;

                agendar(fecha, agenda_id);
                MessageBox.Show("Turno seleccionado correctamente", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                form.Close();
                this.Close();
            }
        }

        private void agendar(DateTime turno_fecha, int turno_agenda)
        {
            string query = "reservarTurno";
            SqlConnection conn = (new BDConnection()).getConnection();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@turno_afi", idAfiliado);
            com.Parameters.AddWithValue("@turno_fecha", turno_fecha);
            com.Parameters.AddWithValue("@turno_agenda", turno_agenda);
            com.Parameters.AddWithValue("@turno_prof", idProf);
            com.Parameters.AddWithValue("@turno_estado" , 0);
            com.Parameters.AddWithValue("@turno_esp", idEsp);
            com.Parameters.AddWithValue("@turno_af_rel", idRel);
            com.ExecuteNonQuery();
        }
    }
}
