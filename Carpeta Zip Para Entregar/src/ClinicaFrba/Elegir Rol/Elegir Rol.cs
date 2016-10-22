using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Elegir_Rol
{
    public partial class Elegir_Rol : Form
    {
        public Elegir_Rol()
        {
            InitializeComponent();
            rolSelection.DropDownStyle = ComboBoxStyle.DropDownList;
            rolSelection.Text = "Presione Aqui";
            //ORIGEN DE DATOS
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
