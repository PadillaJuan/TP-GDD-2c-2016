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

namespace ClinicaFrba.Abm_Afiliado
{
    public partial class Motivo_Cambio_Plan : Form
    {
        int cambio_ids;

        public Motivo_Cambio_Plan(int cambio_id)
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Length == 0)
                MessageBox.Show("No ha ingresado ninguna razon", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                SqlConnection Conn = (new BDConnection()).getConnection();
                SqlCommand consulta = new SqlCommand("agregarMotivoCambioPlan", Conn);
                consulta.CommandType = CommandType.StoredProcedure;
            }
        }

        private void cambioPlan(long id, short id_rel, int pviejo, int pnuevo)
        {
            string query = "cambioPlan";
            SqlConnection con1 = (new BDConnection()).getConnection();
            SqlCommand cm1 = new SqlCommand(query, con1);
            cm1.CommandType = CommandType.StoredProcedure;
            cm1.Parameters.AddWithValue("@af_id", id);
            cm1.Parameters.AddWithValue("@af_rel_id", id_rel);
            cm1.Parameters.AddWithValue("@plan_id_ant", pviejo);
            cm1.Parameters.AddWithValue("@plan_id_new", pnuevo);
            cm1.Parameters.AddWithValue("@cambio_plan_motivo", textBox1.Text);
            cm1.Parameters.AddWithValue("@cambio_plan_fecha", DateTime.Parse(Program.nuevaFechaSistema()));
            cm1.ExecuteNonQuery();
        }
    }
}
