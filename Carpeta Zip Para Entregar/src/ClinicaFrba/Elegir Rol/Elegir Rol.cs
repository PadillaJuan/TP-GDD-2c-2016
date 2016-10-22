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
        public Elegir_Rol(long us_id)
        {
            InitializeComponent();
            rolSelection.DropDownStyle = ComboBoxStyle.DropDownList;
            rolSelection.Text = "Presione Aqui";
            //ORIGEN DE DATOS
        }

                /*("SELECT r.rol_id, r.rol_nombre, r.rol_status
                FROM rol r JOIN rol_por_usuarios u
                WHERE r.rol_id = u.rol_id AND u.id_usuario =  {0}", us_id);
                */

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
