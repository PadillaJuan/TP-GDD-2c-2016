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

        public ElegirTurno(string idP, string apellidoP, string idAfiliadoPasado)
        {
            InitializeComponent();
            label2.Text = "Dr. " + apellidoP;

            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
            idAfiliado = idAfiliadoPasado;
            idProf = idP; 

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
            string query2 = "SELECT DATEPART(hour,agenda_fechayhora), agenda_id  FROM agenda_profesional WHERE agenda_fechayhora =" + fechaTurno +")"; 
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            Hide();
            Pedir_Turno.ListadoProfesionales volver = new Pedir_Turno.ListadoProfesionales(idAfiliado);
            volver.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
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

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                String agenda_id = row.Cells["agenda_id"].Value.ToString();
                DateTime fecha = Convert.ToDateTime(dateTimePicker1.Text);

                agendar(fecha, agenda_id, idAfiliado, idProf);
                MessageBox.Show("Turno seleccionado correctamente", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                form.Close();
                this.Close();
            }
        }

        private void agendar(DateTime turno_fecha, String turno_agenda, String turno_afi, String turno_prof )
        {
            
            string query = "reservarTurno";
            SqlConnection conn = (new BDConnection()).getConnection();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@turno_afi", turno_afi));
            com.Parameters.Add(new SqlParameter("@turno_fecha", turno_fecha));
            com.Parameters.Add(new SqlParameter("@turno_agenda", turno_agenda));
            com.Parameters.Add(new SqlParameter("@turno_prof", turno_prof));
            com.ExecuteNonQuery();
        }

        private void ElegirTurno_Load(object sender, EventArgs e)
        {

        }
    }
}
