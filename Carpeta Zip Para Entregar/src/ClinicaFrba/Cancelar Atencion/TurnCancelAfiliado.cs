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
        long afiliadoId;

        public TurnCancelAfiliado(int us_id)
        {
            getID(us_id);
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            string query ="SELECT DATEPART(MINUTE,turno_fecha) 'Minutos', DATEPART(hour,turno_fecha) 'Hora',DATEPART(day,turno_fecha)'Dia',DATEPART(month,turno_fecha)'Mes',DATEPART(year,turno_fecha)'Año', turno_id 'ID del turno' ";
            query += "FROM DREAM_TEAM.turnos t ";
            query += "JOIN DREAM_TEAM.afiliado a ON (t.turno_af=a.af_id) ";
            query += String.Format("WHERE a.af_id={0} ", af_id());
            query += String.Format("AND a.af_rel_id={0} ", af_rel_id());
            query += "AND t.turno_estado = 0";
           
            CompletadorDeTablas.hacerQuery(query, ref dataGridView1);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cancel_motivo = textBox1.Text;
            
            if (dataGridView1.SelectedRows.Count != 0)
            {
                if (textBox1.Text.Length >= 0)
                {
                    DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                    string turno_id = row.Cells["ID del turno"].Value.ToString();
                    string query = "DREAM_TEAM.cancelTurno";
                    SqlConnection conn = (new BDConnection()).getInstance();
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add(new SqlParameter("@turno_id", turno_id));
                    com.Parameters.Add(new SqlParameter("@cancel_motivo", cancel_motivo));
                    com.Parameters.Add(new SqlParameter("@cancel_tipo", 'a'));
                    com.ExecuteNonQuery();

                    MessageBox.Show("El turno ha sido cancelado con exito", this.Text, MessageBoxButtons.OK, MessageBoxIcon.None);
                    Close();
                }
                else
                {
                    MessageBox.Show("Por favor, ingrese el motivo de la cancelacion del turno", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }

            }
            else
            {
                MessageBox.Show("Por favor, elija el turno que desea cancelar", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void getID(int us_id)
        {
            string query = String.Format("SELECT af_id*100+af_rel_id FROM DREAM_TEAM.afiliado WHERE us_id = {0}",us_id);
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, cn);
            afiliadoId = long.Parse(cm.ExecuteScalar().ToString());
        }

        private short af_rel_id()
        {
            return short.Parse((afiliadoId % 100).ToString());
        }

        private long af_id()
        {
            return (long)afiliadoId / 100; 
        }

        private void TurnCancelAfiliado_Load(object sender, EventArgs e)
        {

        }

    }
}
