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
using ClinicaFrba.Dominio;
using System.Globalization;
namespace ClinicaFrba.Listados
{
    public partial class Seleccionar_Periodo : Form
    {
        string query2;
        public Seleccionar_Periodo(string query1)
        {
            InitializeComponent();
            query2 = query1;
            setComboBox();

        }

        private void setComboBox()
        {
            comboBox1.DataSource = Enumerable.Range(2010, 10).ToList();
            comboBox3.DataSource = Enumerable.Range(2010, 10).ToList();
            comboBox2.Items.Add(new Item("Primer semestre", 0));
            comboBox2.Items.Add(new Item("Segundo semestre", 1));
            int i = 0;
            CultureInfo espaniol = new CultureInfo("es-AR");
            string nombreMes;
            for (i = 0; i < 12; i++)
            {
                nombreMes = espaniol.DateTimeFormat.MonthNames[i];
                nombreMes = new CultureInfo("es-AR").TextInfo.ToTitleCase(nombreMes);
                comboBox4.Items.Add(new Item(nombreMes, i));
            }
            comboBox1.SelectedIndex = 0;
            comboBox2.SelectedIndex = 0;
            comboBox3.SelectedIndex = 0;
            comboBox4.SelectedIndex = 0;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox3.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox4.DropDownStyle = ComboBoxStyle.DropDownList;


        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox1.Enabled = true;
            groupBox2.Enabled = false;
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            groupBox1.Enabled = false;
            groupBox2.Enabled = true;
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
            if (comboBox2.SelectedIndex == 1)
            {
                inicio = new DateTime((int) comboBox1.SelectedValue, 07, 01, 0, 0, 0);
                fin = new DateTime((int) comboBox1.SelectedValue, 12, 31, 23, 59, 59);
            }
            else
            {
                inicio = new DateTime((int) comboBox1.SelectedValue, 01, 01, 0, 0, 0);
                fin = new DateTime((int)comboBox1.SelectedValue, 06, 30, 23, 59, 59);
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
            int mes = ((Item)comboBox4.SelectedItem).Value + 1;
            int anio = (int)comboBox3.SelectedValue;
            DateTime inicio = new DateTime(anio, mes, 01);
            DateTime fin = new DateTime(anio, mes, DateTime.DaysInMonth(anio, mes));
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@fecha_inicio", inicio);
            cm.Parameters.AddWithValue("@fecha_fin", fin);
            return cm;
        }

        public int validarEntrada()
        {
            int ret = 0;
            if (radioButton1.Checked) ret = 1;
            if (radioButton2.Checked) ret = 2;
            return ret;
        }

        
    }
}
