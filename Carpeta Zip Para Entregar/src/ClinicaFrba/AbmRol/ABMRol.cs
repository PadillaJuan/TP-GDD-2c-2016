using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.AbmRol
{
    public partial class ABMRol : Form
    {
        public ABMRol()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (textBox2.Text.Length == 0)
            { MessageBox.Show("No se ha ingresado ningun valor de busqueda", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            
        }
    }
}
