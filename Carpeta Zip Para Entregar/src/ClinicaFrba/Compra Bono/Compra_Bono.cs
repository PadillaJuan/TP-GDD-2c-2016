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
    public partial class Compra_Bono : Form
    {
        long idFamiliar;
        int idRel;
        int planMed;

        public Compra_Bono(int pm, long af_id, int af_rel_id)
        {
            InitializeComponent();
            idFamiliar = af_id;
            idRel = af_rel_id;
            planMed = pm;
            textBox1.Text = String.Format("{0}",idFamiliar * 100 + idRel);

            textBox1.Enabled = false;
        }

        public Compra_Bono(int us_id)
        {
            InitializeComponent();
            getDatos(us_id);
            textBox1.Enabled = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (validarEntrada())
            {
                MessageBox.Show("No se ha ingresado un valor valido para la cantidad de bono", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                Confirmacion_Compra form = new Confirmacion_Compra(idFamiliar, idRel ,planMed, getCantidadBonos());
                form.Show();
            }
        }

        public int getCantidadBonos()
        {
            return Int32.Parse(textBox2.Text);
        }

        public bool validarEntrada()
        {
            int n;
            return !int.TryParse(textBox2.Text, out n); 
        }

        public void getDatos(int us_id)
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand("DREAM_TEAM.getDatosForCompraBono", cn);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@us_id",us_id);
            SqlDataReader dr = cm.ExecuteReader();
            dr.Read();
            idFamiliar = long.Parse(dr.GetValue(0).ToString());
            idRel = short.Parse(dr.GetValue(1).ToString());
            planMed = int.Parse(dr.GetValue(2).ToString());
            dr.Close();
            cm.Dispose();
            textBox1.Text = String.Format("{0}", idFamiliar);
        }

    }
}
