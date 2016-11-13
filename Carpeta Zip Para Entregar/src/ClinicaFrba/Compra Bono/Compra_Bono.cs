using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Compra_Bono
{
    public partial class Compra_Bono : Form
    {
        public Compra_Bono(long id)
        {
            InitializeComponent();
            textBox1.Text = String.Format("{0}",id);
            textBox1.Enabled = false;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Hide();
        }
    }
}
