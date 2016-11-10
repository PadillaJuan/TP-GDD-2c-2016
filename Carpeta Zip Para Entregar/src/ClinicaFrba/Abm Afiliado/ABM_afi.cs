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

namespace ClinicaFrba.Abm_Afiliado
{

    public partial class ABM_afi : Form
    {

        public ABM_afi(int accion, long id)
        {
            InitializeComponent();
            setComboBoxes();
            this.cargarComboBoxPlanMedico();
            switch (accion)
            {
                case 0:
                    nuevoAfiliado();
                    break;
                case 1:
                    updateAfiliado(id);
                    break;
                case 2:
                    agregarFamiliar(id);
                    break;
                default:
                    break;
            }
        }

        private void setComboBoxes()
        {
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox3.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox4.DropDownStyle = ComboBoxStyle.DropDownList;
            dateTimePicker1.Value = DateTime.Parse("1900-01-01 00:00:00.000");
        }

        public void cargarComboBoxPlanMedico()
        {
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            string query = String.Format("exec getPlanesMedicos()");
            SqlCommand com = new SqlCommand(query, conn);
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    comboBox3.Items.Add(dr["planmed_id"]);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        public void nuevoAfiliado()
        {
            textBox1.Enabled = false;
            button3.Enabled = false;
        }

        public void agregarFamiliar(long id)
        {
            textBox1.Text = String.Format("{0}", id);
            textBox1.Enabled = false;
        }

        public void updateAfiliado(long id)
        {
            button1.Enabled = false;
            this.cargarDatosALaPlantilla(id);
            comboBox1.Enabled = false;
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
            textBox5.Enabled = false;
            dateTimePicker1.Enabled = false;
        }

        public void cargarDatosALaPlantilla(long id) 
        {

            String afi_id = String.Format("{0}", id / 100);
            String afi_id_rel = String.Format("{0}", id % 100);
            String query = String.Format("Select * from afiliados WHERE af_id = {0} AND af_rel_id = {1}", afi_id, afi_id_rel);
            SqlConnection Conn = (new BDConnection()).getConnection();
            SqlCommand consulta = new SqlCommand(query, Conn);
            dataLogin lg = new dataLogin();
            try
            {
                SqlDataReader execute = consulta.ExecuteReader();
                cargarDatos(execute);
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void cargarDatos(SqlDataReader dr)
        {
            textBox1.Text = String.Concat(dr.GetInt32(0), dr.GetInt16(1));
            textBox2.Text = dr.GetString(3);
            textBox3.Text = dr.GetString(4);
            comboBox1.Text = dr.GetString(5);
            textBox4.Text = String.Format("{0}",dr.GetInt32(6));
            textBox5.Text = dr.GetString(7);
            textBox6.Text = String.Format("{0}", dr.GetInt32(8));
            textBox7.Text = dr.GetString(9);
            dateTimePicker1.Value = dr.GetDateTime(10);
            comboBox2.Text = dr.GetString(11);
            comboBox3.Text = dr.GetString(13);
            comboBox4.Text = dr.GetString(14);
        }

        private void button1_Click(object sender, EventArgs e) // DAR DE ALTA
        {
            if (this.checkearDatos())
                MessageBox.Show("Datos incorrectos", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                this.darAltaAfiliado();
            }

        }

        public bool checkearDatos()
        {
            bool i = false;
            int n,m,p;
            
            if (textBox2.Text.Length == 0 || textBox3.Text.Length == 0 || textBox4.Text.Length == 0 ) { i = true; }
            if (!textBox2.Text.All(c => Char.IsLetter(c)) || !textBox3.Text.All(d => Char.IsLetter(d)) || !int.TryParse(textBox4.Text, out n)) { i = true; }
            if (comboBox1.SelectedIndex == -1 || comboBox2.SelectedIndex == -1 || comboBox3.SelectedIndex == -1 || comboBox4.SelectedIndex == -1 ) { i = true; }
            if (dateTimePicker1.Value == DateTime.Parse("1900-01-01 00:00:00.000")) { i = true; }
            if (textBox5.Text.Length == 0 || textBox6.Text.Length == 0 || textBox7.Text.Length == 0) { i = true; }
            if (!textBox5.Text.All(e => Char.IsLetter(e)) || !int.TryParse(textBox6.Text, out m) || !textBox7.Text.All(f => Char.IsLetter(f))) { i = true; }


            return i;
        }

        public void darAltaAfiliado()
        {       
            /*string query = String.Format("exec altaAfiliado({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, {11})", 0, textBox2.Text, textBox3.Text, comboBox1.Text, textBox4.Text, textBox5.Text, textBox6.Text, textBox7.Text, dateTimePicker1.Value.Date, comboBox2.Text,comboBox3.Text, comboBox4.Text);
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();
            conn.Close();
            conn.Dispose();
        */
            MessageBox.Show(String.Format("exec altaAfiliado({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, {11})", 0, textBox2.Text, textBox3.Text, comboBox1.Text, textBox4.Text, textBox5.Text, textBox6.Text, textBox7.Text, dateTimePicker1.Value.Date, comboBox2.Text, comboBox3.Text, comboBox4.Text), "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void button2_Click(object sender, EventArgs e) //VOLVER
        {
            Hide();
        }


        private void button4_Click(object sender, EventArgs e) // SALIR
        {
            Close();
        }



        private void ABM_afi_Load(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show(dateTimePicker1.ToString(), "mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
        
  

}

