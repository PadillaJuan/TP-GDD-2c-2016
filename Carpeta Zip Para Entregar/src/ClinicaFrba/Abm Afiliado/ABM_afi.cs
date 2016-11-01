﻿using System;
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

        }

        public void updateAfiliado(){
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
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
       
    }
}