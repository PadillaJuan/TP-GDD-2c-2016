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
using System.Data.Sql;

using ClinicaFrba.Utils;

namespace ClinicaFrba.Cancelar_Atencion
{
    public partial class TurnCancelProfesional : Form
    {
        DataTable tabla;
        int prof_id;
        public TurnCancelProfesional(int us_id)
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = true;
            dataGridView1.ReadOnly = true;
            getprof_id(us_id);
            setDatePickers();

            textBox1.MaxLength = 100;
        }

        private void setDatePickers()
        {
            dateTimePicker1.MinDate = DateTime.Parse(Program.nuevaFechaSistema());
            dateTimePicker2.MinDate = DateTime.Parse(Program.nuevaFechaSistema());
            dateTimePicker1.Value = DateTime.Parse(Program.nuevaFechaSistema());
            dateTimePicker2.Value = DateTime.Parse(Program.nuevaFechaSistema());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cancel_motivo = textBox1.Text;
            switch (getRadio())
            {
                case 0:
                    cancelarIntervalo();
                    break;
                case 1:
                    cancelarTurno();
                    break;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            tabla = new DataTable();
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand("getTurnosDelProfesional", cn);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@prof_id", prof_id);
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            sda.Fill(tabla);
            dataGridView1.DataSource = tabla;
            sda.Dispose();
        }

        /*
            if (dataGridView1.SelectedRows.Count != 0)
            {
                if (dataGridView1.SelectedRows.Count != 0)
                {

                    DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                    string turno_id = row.Cells["turno_Id"].Value.ToString();
                    string query = "cancelTurno";
                    SqlConnection conn = (new BDConnection()).getConnection();
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add(new SqlParameter("@turno_id", turno_id));
                    com.Parameters.Add(new SqlParameter("@cancel_motivo", cancel_motivo));
                    com.Parameters.Add(new SqlParameter("@cancel_tipo", 'p'));
                    com.ExecuteNonQuery();

                    MessageBox.Show("El turno ha sido cancelado con exito", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.None);
                    Close();
                }
                else
                {
                    MessageBox.Show("Por favor, elija el turno que desea cancelar", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Por favor, ingrese el motivo de cancelacion", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }*/

        private void cancelarIntervalo()
        {
            if (dateTimePicker1.Value < dateTimePicker2.Value)
            {
                    string query = "bajaIntervalo";
                    SqlConnection conn = (new BDConnection()).getConnection();
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@prof_id", prof_id);
                    com.Parameters.AddWithValue("@desde", dateTimePicker1.Value.ToString("yyyy-MM-dd HH:mm:ss"));
                    com.Parameters.AddWithValue("@hasta", dateTimePicker2.Value.ToString("yyyy-MM-dd HH:mm:ss"));
                    com.ExecuteNonQuery();
                    MessageBox.Show("Los turnos pertenecientes al intervalo fueron dados de baja", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.None);
            }
            else
            {
                MessageBox.Show("Por favor, ingrese un intervalo de tiempo vàlido", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cancelarTurno()
        {
            if (dataGridView1.SelectedRows.Count != 0)
            {
                if (textBox1.Text.Length >= 0)
                {
                    string query = "cancelTurno";
                    SqlConnection conn = (new BDConnection()).getConnection();
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add(new SqlParameter("@turno_id", getTurnoID()));
                    com.Parameters.Add(new SqlParameter("@cancel_motivo", textBox1.Text));
                    com.Parameters.Add(new SqlParameter("@cancel_tipo", 'p'));
                    com.ExecuteNonQuery();
                }
                else
                {
                    MessageBox.Show("Por favor, ingrese el motivo de cancelacion", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Por favor, elija el turno que desea cancelar", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        private void getprof_id(int us_id)
        {
            string query = String.Format("SELECT prof_id FROM profesional WHERE us_id = {0}", us_id);
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, cn);
            prof_id = (int) cm.ExecuteScalar();
        }
        
        private int getRadio()
        {
            if (radioButton1.Checked)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }

        private int getTurnoID()
        {
            int row = dataGridView1.SelectedRows[0].Index;
            int turno_id = Int32.Parse(tabla.Rows[row][0].ToString());
            return turno_id;
        }
    }
}
            
        

