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

        DataTable dt;

        public ABMRol()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e) // Dar rol de alta
        {
                Funcionalidades form = new Funcionalidades(0,"");
                form.Show();
        }

        private void button2_Click(object sender, EventArgs e) // VOLVER
        {
            Hide();
        }

        private void button3_Click(object sender, DataGridViewCellEventArgs e) // Dar de baja
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            if ((int)linea.Cells[3].Value == 1)
            {
                int rol_id = getRolId(e);
                string query = String.Format("UPDATE rol SET rol_status = 0 WHERE rol_id = {0}", rol_id);
                SqlConnection conn = (new BDConnection()).getConnection();
                SqlCommand com = new SqlCommand(query, conn);
                com.ExecuteNonQuery();
            }
            else
                MessageBox.Show("El rol ya se encuentra desactivado", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);

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



        private void button8_Click(object sender, EventArgs e) // Buscar todos los roles
        {
            string query = "exec getAllRoles()";
            fillDataTable(query);
        }

        private void button9_Click(object sender, DataGridViewCellEventArgs e) // Ver funcionalidades del Rol
        {
            string rol_nombre = getRolNombre(e);
            Funcionalidades form = new Funcionalidades(1, rol_nombre);
            form.Show();
        }

        private void button10_Click(object sender, EventArgs e) // Limpiar Tabla
        {
            dataGridView1.DataSource = null;
            dataGridView1.Rows.Clear();
        }

        private void fillDataTable(string query)
        {
            SqlConnection conn = (new BDConnection()).getConnection();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            dt = new DataTable();
            sda.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        public int getRolInsertado(string rol)
        {
            int id_rol = 0;
            string query = String.Format("SELECT id_rol FROM rol WHERE rol_nombre = {0}", rol);
            SqlConnection conn = (new BDConnection()).getConnection();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader dr = cm.ExecuteReader();
            id_rol = dr.GetInt32(0);
            return id_rol;
        }

        private int getRolId(DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            int id = (int)linea.Cells[0].Value;
            return id;
        }

        private string getRolNombre(DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            string nombre = (string)linea.Cells[1].Value;
            return nombre;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Funcionalidades form = new Funcionalidades(0, "");
            form.Show();
        }

        private void button6_Click_1(object sender, DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            if ((int)linea.Cells[3].Value == 0)
            {
                int rol_id = getRolId(e);
                string query = String.Format("UPDATE rol SET rol_status = 1 WHERE rol_id = {0}", rol_id);
                SqlConnection conn = (new BDConnection()).getConnection();
                SqlCommand com = new SqlCommand(query, conn);
                com.ExecuteNonQuery();
            }
            else
                MessageBox.Show("El rol ya se encuentra activado", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
       

        
    }
}
