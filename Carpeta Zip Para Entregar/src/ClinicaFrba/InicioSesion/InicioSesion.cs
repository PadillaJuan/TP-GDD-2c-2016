﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace ClinicaFrba.InicioSesion
{
    public partial class VentanaInicioSesion : Form
    {
        public VentanaInicioSesion()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
           

        }



        private void button1_Click(object sender, EventArgs e)
        {
            int accessgranted = 0;
            long us_id;
            String usuario = textBox1.Text;
            String contrasenia = textBox2.Text;
            accessgranted = LoginDB.login(usuario, contrasenia,us_id);
            if (accessgranted != 0)
            {
                Hide();
                Elegir_Rol.Elegir_Rol(us_id);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            textBox2.PasswordChar = '*';
        }
    }
}
