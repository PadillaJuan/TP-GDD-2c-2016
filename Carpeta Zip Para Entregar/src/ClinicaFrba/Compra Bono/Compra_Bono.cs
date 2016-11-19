﻿using System;
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
        short idRel;
        int planMed;

        public Compra_Bono(long id, short id_rel, int plan)
        {
            InitializeComponent();
            idFamiliar = id;
            idRel = id_rel;
            planMed = plan;
            textBox1.Text = String.Format("{0}",id);
            textBox1.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
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
    }
}