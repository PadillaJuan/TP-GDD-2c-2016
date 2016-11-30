using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace ClinicaFrba.Listados
{
    public partial class Seleccionar_Periodo : Form
    {
        string query2;
        public Seleccionar_Periodo(string query1)
        {
            InitializeComponent();
            dateTimePicker1.Enabled = false;
            dateTimePicker2.Enabled = false;
            query2 = query1;
            dateTimePicker1.Value = DateTime.Parse("1900-01-01");
            dateTimePicker2.Value = DateTime.Parse("1900-01-01");
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            dateTimePicker1.Enabled = true;
            dateTimePicker2.Enabled = false;
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            dateTimePicker2.Enabled = true;
            dateTimePicker1.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int i = validarEntrada();
            SqlCommand cm;
            VerListado form;
            switch(i)
            {
                case 0: 
                    MessageBox.Show("No se ha seleccionado ninguna fecha",Application.ProductName,MessageBoxButtons.OK,MessageBoxIcon.Error);
                    break;
                case 1:
                    cm = generateSqlCommandSemestral();
                    form = new VerListado(cm);
                    form.Show();
                    break;
                case 2:
                    cm = generateSqlCommandMensual();
                    form = new VerListado(cm);
                    form.Show();
                    break;
            }
        }
        // GENERA EL COMANDO PARA EL LISTADO SEMESTRAL
        private SqlCommand generateSqlCommandSemestral()
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query2,cn);
            DateTime inicio;
            DateTime fin;
            if (dateTimePicker1.Value >= new DateTime(dateTimePicker1.Value.Year, 7, 1))
            {
                inicio = new DateTime(dateTimePicker1.Value.Year, 07, 01);
                fin = new DateTime(dateTimePicker1.Value.Year, 12, 31);
            }
            else
            {
                inicio = new DateTime(dateTimePicker1.Value.Year, 01, 01);
                fin = new DateTime(dateTimePicker1.Value.Year, 06, 30);
            }
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@fecha_inicio", inicio);
            cm.Parameters.AddWithValue("@fecha_fin", fin);
            return cm;
        }

        // GENERA EL COMANDO PARA EL LISTADO MENSUAL
        private SqlCommand generateSqlCommandMensual()
        {
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query2, cn);
            DateTime inicio;
            DateTime fin;
            inicio = new DateTime(dateTimePicker2.Value.Year, dateTimePicker2.Value.Month, 01);
            fin = new DateTime(dateTimePicker2.Value.Year, dateTimePicker2.Value.Month, DateTime.DaysInMonth(dateTimePicker2.Value.Year, dateTimePicker2.Value.Month));
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@fecha_inicio", inicio);
            cm.Parameters.AddWithValue("@fecha_fin", fin);
            return cm;
        }

        public int validarEntrada()
        {
            int ret = 0;
            if (radioButton1.Checked && dateTimePicker1.Value != DateTime.Parse("1900-01-01")) ret = 1;
            if (radioButton2.Checked && dateTimePicker2.Value != DateTime.Parse("1900-01-01")) ret = 2;
            return ret;
        }
    }
}
