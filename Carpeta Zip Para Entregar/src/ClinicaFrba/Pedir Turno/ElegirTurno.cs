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
        String idAfiliado;
        bool control;
        String idProf;
        String idEsp;

        public ElegirTurno(string idP, string apellidoP, string idAfiliadoPasado, string espId)
        {
            InitializeComponent();
            label2.Text = "Dr. " + apellidoP;

            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
            idAfiliado = idAfiliadoPasado;
            idProf = idP;
            idEsp = espId;

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
            Pedir_Turno.ListadoProfesionales volver = new Pedir_Turno.ListadoProfesionales(idAfiliado);
            volver.ShowDialog();
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

                string idRel = getIdRel();

                agendar(fecha, agenda_id, idAfiliado, idProf, idEsp, idRel);
                MessageBox.Show("Turno seleccionado correctamente", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                form.Close();
                this.Close();
            }
        }

        private void agendar(DateTime turno_fecha, String turno_agenda, String turno_afi, String turno_prof, String turno_esp, String turno_af_rel )
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

        private void ElegirTurno_Load(object sender, EventArgs e)
        {

        }

        String getIdRel()
        {

            string query = String.Format("SELECT af_rel_id FROM afiliado WHERE af_id = {0}", idAfiliado);
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, cn);
            string idRel = cm.ExecuteScalar().ToString();
            return idRel;
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}
