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
using System.Data.Sql;

namespace ClinicaFrba.AbmRol
{
    public partial class ABMRol : Form
    {
        public ABMRol()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e) // Dar rol de alta
        {
            if (textBox2.Text.Length == 0)
            { MessageBox.Show("No se ha ingresado ningun nombre para el nuevo rol", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else 
            {
                string valor = textBox2.Text;
                string query = String.Format("exec nuevoRol({0})", valor);
                SqlConnection bd = (new BDConnection()).getMiConnectionSQL();
                SqlCommand cm = new SqlCommand(query,bd);
                cm.ExecuteNonQuery();
                insertarRoles(getRolInsertado(valor));
            }
        }

        private void button2_Click(object sender, EventArgs e) // VOLVER
        {
            Hide();
        }

        private void button3_Click(object sender, EventArgs e) // Dar de baja
        {

        }

        private void button4_Click(object sender, EventArgs e)  // SALIR 
        {
            Close();
        }

        private void button5_Click(object sender, EventArgs e)  // Buscar Rol
        {
            if (textBox2.Text.Length == 0)
            { MessageBox.Show("No se ha ingresado ningun valor de busqueda", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                string query = String.Format("exec getRol({0})",textBox2.Text);
                fillDataTable(query);
            }
        }

        private void button6_Click(object sender, EventArgs e) // Buscar todas las funcionalidades
        {

        }

        private void button7_Click(object sender, EventArgs e) // Limpiar seleccion
        {

        }

        private void button8_Click(object sender, EventArgs e) // Buscar todos los roles
        {
            string query = "exec getAllRoles()";
            fillDataTable(query);
        }

        private void button9_Click(object sender, EventArgs e) // Ver funcionalidades del Rol
        {

        }

        private void button10_Click(object sender, EventArgs e) // Limpiar Tabla
        {
            dataGridView1.DataSource = null;
            dataGridView1.Rows.Clear();
            checkedListBox1.ClearSelected();
        }

        private void fillDataTable(string query)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private long getId(DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            long id = ((long)linea.Cells[0].Value) * 100 + (long)linea.Cells[1].Value;
            return id;
        }

        public void insertarRoles(int id)
        { 
            
        }

        public int getRolInsertado(string rol)
        {
            int id_rol = 0;
            string query = String.Format("SELECT id_rol FROM rol WHERE rol_nombre = {0}", rol);
            SqlConnection bd = (new BDConnection()).getMiConnectionSQL();
            SqlCommand cm = new SqlCommand(query, bd);
            SqlDataReader dr = cm.ExecuteReader();
            id_rol = dr.GetInt32(0);
            return id_rol;
        }

       
       

        
    }
}
