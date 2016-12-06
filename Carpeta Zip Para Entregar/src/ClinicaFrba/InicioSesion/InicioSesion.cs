using System;
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
            textBox1.Text = "admin";
            textBox2.Text = "w23e";
        }
     
        private void button1_Click(object sender, EventArgs e)
        {
            int us_id = 0;
            String usuario = textBox1.Text;
            String contrasenia = textBox2.Text;
            us_id = LoginDB.login(usuario, contrasenia);
            if (us_id >= 0)
            {
                Hide();
                Elegir_Rol.Elegir_Rol form = new Elegir_Rol.Elegir_Rol(us_id);
                form.Show();
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
            Application.Exit();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            textBox2.PasswordChar = '*';
        }

    }
}
