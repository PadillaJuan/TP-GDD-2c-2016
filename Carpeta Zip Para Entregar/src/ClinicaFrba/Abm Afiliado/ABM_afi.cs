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
        public ABM_afi(int accion, long id)
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
                case 2:
                    agregarFamiliar(id);
                    break;
                default:
                    break;
            }
        }
        public void nuevoAfiliado(){
            textBox1.Enabled = false;
        }

        public void agregarFamiliar(long id) {
            textBox1.Text = String.Format("{0}",id);
            textBox1.Enabled = false;
            setComboBox1();
            
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox3.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox4.DropDownStyle = ComboBoxStyle.DropDownList;

        }

        public void setComboBox1()
        {
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
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


        private void button4_Click(object sender, EventArgs e)
        {
            Close();
        }

     
        private void button2_Click(object sender, EventArgs e)
        {
            Hide();
            Elegir_Accion.Elegir_Accion form = new Elegir_Accion.Elegir_Accion();
            form.Show();
        }

    }
}
