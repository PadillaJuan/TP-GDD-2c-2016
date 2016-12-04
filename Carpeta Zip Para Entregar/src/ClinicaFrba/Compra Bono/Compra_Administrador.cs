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

namespace ClinicaFrba.Compra_Bono
{
    public partial class Compra_Administrador : Form
    {
        public Compra_Administrador()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int n, af_id, af_rel_id;
            af_id = Int32.Parse(textBox1.Text) / 100;
            af_rel_id = Int32.Parse(textBox1.Text) % 100;
            if (textBox1.Text.Length > 0 && !int.TryParse(textBox1.Text, out n))
            {
                MessageBox.Show("No se ha ingresado un numero de afiliado válido", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                int planmed_id;
                SqlConnection conn = (new BDConnection()).getInstance();
                String query = String.Format("DREAM_TEAM.verifyAfiliadoExistance");
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@af_id", af_id);
                com.Parameters.AddWithValue("@af_rel_id", af_rel_id);
                planmed_id = Int32.Parse(com.ExecuteScalar().ToString());
                com.Dispose();
                Compra_Bono form = new Compra_Bono(planmed_id, af_id, af_rel_id);
                form.Show();
                Close();
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
