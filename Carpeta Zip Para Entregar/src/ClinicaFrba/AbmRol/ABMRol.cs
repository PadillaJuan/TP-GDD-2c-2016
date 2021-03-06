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

namespace ClinicaFrba.AbmRol
{
    public partial class ABMRol : Form
    {

        DataTable dt;

        public ABMRol()
        {
            InitializeComponent();
            button3.Enabled = false ;
            button6.Enabled = false ;
            button9.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e) // Dar rol de alta
        {
                Funcionalidades form = new Funcionalidades(0,0,"");
                form.Show();
        }

        private void button2_Click(object sender, EventArgs e) // VOLVER
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e) // Dar de baja
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            if ((MessageBox.Show(String.Format("Desea dar de baja el rol {0}?",(String)linea.Cells[1].Value), "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
                if (((String)linea.Cells[2].Value).Equals("a"))
                {
                    int rol_id = getRolId();
                    string query = "DREAM_TEAM.deactivateRol";
                    SqlConnection conn = (new BDConnection()).getInstance();
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add(new SqlParameter("@rol_id", rol_id));
                    com.ExecuteNonQuery();
                    dt.Rows[index][2] = 'd';
                    MessageBox.Show("El rol se ha dado de baja correctamente.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                    MessageBox.Show("El rol ya se encuentra desactivado.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button5_Click(object sender, EventArgs e)  // Buscar Rol
        {
            if (textBox2.Text.Length == 0)
            { MessageBox.Show("No se ha ingresado ningun valor de busqueda.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                string query = "DREAM_TEAM.getRol";
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand cm = new SqlCommand(query, conn);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.Add(new SqlParameter("@rol_nombre",textBox2.Text));
                fillDataTable(cm);
            }
        }

        private void button6_Click_1(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            if ((MessageBox.Show(String.Format("Desea dar de alta el rol {0}?", (String)linea.Cells[1].Value), "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
                if (((String)linea.Cells[2].Value).Equals("d"))
                {
                    int rol_id = getRolId();
                    string query = "DREAM_TEAM.activateRol";
                    SqlConnection conn = (new BDConnection()).getInstance();
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add(new SqlParameter("@rol_id", rol_id));
                    com.ExecuteNonQuery();
                    dt.Rows[index][2] = 'a';
                    MessageBox.Show("El rol se ha dado de alta correctamente.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                    MessageBox.Show("El rol ya se encuentra activado.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button8_Click(object sender, EventArgs e) // Buscar todos los roles
        {
            string query = "DREAM_TEAM.getAllRoles";
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, conn);
            cm.CommandType = CommandType.StoredProcedure;
            fillDataTable(cm);
        }

        private void button9_Click(object sender, EventArgs e) // Ver funcionalidades del Rol
        {
            try{
                Funcionalidades form = new Funcionalidades(1, getRolId(), getRolNombre());
                form.Show();
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }

        private void button10_Click(object sender, EventArgs e) // Limpiar Tabla
        {
            dataGridView1.DataSource = null;
            dataGridView1.Rows.Clear();
        }

        private void fillDataTable(SqlCommand cm)
        { 
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            dt = new DataTable();
            sda.Fill(dt);
            dataGridView1.DataSource = dt;
            dataGridView1.AutoResizeColumns();
            dataGridView1.ReadOnly = true;
            dataGridView1.MultiSelect = false;
        }

        public int getRolInsertado(string rol)
        {
            int id_rol = 0;
            string query = String.Format("SELECT id_rol FROM DREAM_TEAM.rol WHERE rol_nombre = {0}", rol);
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader dr = cm.ExecuteReader();
            id_rol = dr.GetInt32(0);
            return id_rol;
        }

        private int getRolId()
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            int id = (int)linea.Cells[0].Value;
            return id;
        }

        private string getRolNombre()
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            string nombre = (string)dt.Rows[index]["Nombre del rol"];
            return nombre;       
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Funcionalidades form = new Funcionalidades(0,0, "");
            form.Show();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            button3.Enabled = true;
            button6.Enabled = true;
            button9.Enabled = true;
        }

    }
}
