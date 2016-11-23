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

namespace ClinicaFrba.Cancelar_Atencion
{
    public partial class TurnCancelProfesional : Form
    {
        String idProfesional;
        String cancel_motivo;

        public TurnCancelProfesional(string profesionalId)
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = true;
            dataGridView1.ReadOnly = true;

            idProfesional = profesionalId;


            string query2 = "SELECT turno_id, DATEPART(hour,turno_fecha),DATEPART(day,turno_fecha),DATEPART(month,turno_fecha),DATEPART(year,turno_fecha) FROM turnos t JOIN profesional p ON (t.turno_afi=p.prof_id) WHERE p.prof_id=idProfesional";
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            cancel_motivo = "";
            cancel_motivo = richTextBox1.Text;

            if (dataGridView1.SelectedRows.Count != 0)
            {

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                string turno_id = row.Cells["turno_Id"].Value.ToString();
                string query = "cancelTurno";
                SqlConnection conn = (new BDConnection()).getConnection();
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("turno_id", turno_id));
                com.Parameters.Add(new SqlParameter("cancel_motivo", cancel_motivo));
                com.Parameters.Add(new SqlParameter("cancel_tipo", 'p'));
                com.ExecuteNonQuery();


                Cancelar_Atencion.TurnCancelAfiliado cancelacion = new Cancelar_Atencion.TurnCancelAfiliado(idProfesional);
                cancelacion.ShowDialog();

            }

            else
            {
                MessageBox.Show("Por favor, elija el turno que desea cancelar", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }
    }
}
            
        

