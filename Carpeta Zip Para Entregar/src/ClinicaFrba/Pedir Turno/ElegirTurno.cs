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
        String idProf;
        String idEsp;
        Form formato;
        long idRel;

        public ElegirTurno(string idP, string apellidoP, long idAfiliadoPasado, long relId, string espId, Form formatopasado)
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
            string query = String.Format("SELECT DATEPART(hour,agenda_fechayhora), DATEPART(minute, agenda_fechayhora), agenda_id  FROM agenda_profesional WHERE agenda_fechayhora = {0} ", fechaTurno);
            
            CompletadorDeTablas.hacerQuery(query, ref dataGridView1);
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            Hide();
            formato.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DateTime fechaFiltrar = DateTime.Parse(dateTimePicker1.Text);
            filtrarFecha(fechaFiltrar);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if ((MessageBox.Show("¿Desea elegir ese turno?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
              

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                String agenda_id = row.Cells["agenda_id"].Value.ToString();
                DateTime fecha = DateTime.Parse(dateTimePicker1.Text);

                agendar(fecha, agenda_id, idAfiliado, idProf, idEsp, idRel);
                MessageBox.Show("Turno seleccionado correctamente", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                form.Close();
                this.Close();
            }
        }

        private void agendar(DateTime turno_fecha, String turno_agenda, long turno_afi, String turno_prof, String turno_esp, long turno_af_rel )
        {
            
            string query = "reservarTurno";
            SqlConnection conn = (new BDConnection()).getConnection();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@turno_afi", turno_afi));
            com.Parameters.Add(new SqlParameter("@turno_fecha", turno_fecha));
            com.Parameters.Add(new SqlParameter("@turno_agenda", turno_agenda));
            com.Parameters.Add(new SqlParameter("@turno_prof", turno_prof));
            com.Parameters.Add(new SqlParameter("@turno_esp", turno_esp));
            com.Parameters.Add(new SqlParameter("@turno_esp", turno_af_rel));
            com.ExecuteNonQuery();
        }
    }
}
