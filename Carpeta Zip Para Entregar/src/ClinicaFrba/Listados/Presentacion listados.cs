using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Listados
{
    public partial class Presentacion_Listados : Form
    {
        public Presentacion_Listados()
        {
            InitializeComponent();
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (validarEntrada())
            {
                string query1 = "getListado" + (comboBox1.SelectedIndex + 1).ToString();
                Seleccionar_Periodo form = new Seleccionar_Periodo(query1);
                form.Show();

            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Close();
        }

        private bool validarEntrada()
        {
            return comboBox1.SelectedIndex != -1;
        }
        
    }
}
