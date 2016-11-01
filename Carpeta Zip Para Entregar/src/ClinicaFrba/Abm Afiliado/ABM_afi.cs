using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Abm_Afiliado
{
    public partial class ABM_afi : Form
    {
        int cantidad = 1;
        public ABM_afi(int accion)
        {
            InitializeComponent();
            switch (accion)
            {
                case 0:
                    nuevoAfiliado();
                    break;
                case 1:
                    updateAfiliado();
                    break;
                default:
                    break;
            }
        }
        public void nuevoAfiliado(){
            textBox1.Enabled = false;
        }

        public void updateAfiliado(){
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox1.Enabled = false;
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
            textBox5.Enabled = false;
            dateTimePicker1.Enabled = false;
        }


        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Hide();
            Elegir_Accion.Elegir_Accion form = new Elegir_Accion.Elegir_Accion();
            form.Show();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            cantidad++;
            String texto = String.Concat("Afiliado ", cantidad);
            TabPage tp = new TabPage(texto);
            tabControl1.TabPages.Add(tp);
            
        }
       
    }
}
