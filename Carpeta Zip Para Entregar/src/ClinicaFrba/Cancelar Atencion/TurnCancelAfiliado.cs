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
    public partial class TurnCancelAfiliado : Form
    {
        String afiliadoId;
        String cancel_motivo;

        public TurnCancelAfiliado(string idAfiliado)
        {

            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            

            afiliadoId = idAfiliado;
            string query ="SELECT DATEPART(MINUTE,turno_fecha), DATEPART(hour,turno_fecha),DATEPART(day,turno_fecha),DATEPART(month,turno_fecha),DATEPART(year,turno_fecha) ";
            query += "FROM turnos t ";
            query += "JOIN afiliado a ON (t.turno_af=a.af_id) ";
            query += "WHERE a.af_id=afiliadoId ";
            query += "AND t.turno_id NOT IN (SELECT cons_turno FROM consulta_medica ";
           
            CompletadorDeTablas.hacerQuery(query, ref dataGridView1);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            cancel_motivo = "";
            cancel_motivo = richTextBox1.Text;

            if (dataGridView1.SelectedRows.Count != 0)
            {

                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                string turno_id = row.Cells["turno_id"].Value.ToString();
                string query = "cancelTurno";
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@turno_id", turno_id));
                com.Parameters.Add(new SqlParameter("@cancel_motivo", cancel_motivo));
                com.Parameters.Add(new SqlParameter("@cancel_tipo", 'a'));
                com.ExecuteNonQuery();

                MessageBox.Show("El turno ha sido cancelado con exito", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                Cancelar_Atencion.TurnCancelAfiliado cancelacion = new Cancelar_Atencion.TurnCancelAfiliado(afiliadoId);
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
