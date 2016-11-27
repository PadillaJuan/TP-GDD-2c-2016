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
            dataGridView1.AutoResizeColumns();
        }

        private void filtrarFecha()
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand("dameTurnosDisponiblesDeLaFecha", cn);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@fecha", dateTimePicker1.Value.ToString("yyyy-MM-dd HH:mm:ss"));
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            sda.Dispose();
            dataGridView1.DataSource = tabla;
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            filtrarFecha();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("No se ha seleccionado ningun tunro", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if ((MessageBox.Show("¿Desea elegir ese turno?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
              

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                int agenda_id = Int32.Parse(row.Cells["ID de la agenda"].Value.ToString());
                DateTime fecha = dateTimePicker1.Value;
                fecha.AddHours(Double.Parse(row.Cells["Hora"].Value.ToString()));
                fecha.AddMinutes(Double.Parse(row.Cells["Minutos"].Value.ToString()));
                agendar(fecha, agenda_id);
                MessageBox.Show("Turno seleccionado correctamente", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                this.Close();
            }
        }

        private void agendar(DateTime turno_fecha, int turno_agenda)
        {
            string query = "reservarTurno";
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@turno_afi", idAfiliado);
            com.Parameters.AddWithValue("@turno_fecha", turno_fecha);
            com.Parameters.AddWithValue("@turno_agenda", turno_agenda);
            com.Parameters.AddWithValue("@turno_prof", idProf);
            com.Parameters.AddWithValue("@turno_esp", idEsp);
            com.Parameters.AddWithValue("@turno_af_rel", idRel);
            com.ExecuteNonQuery();
        }
    }
}
