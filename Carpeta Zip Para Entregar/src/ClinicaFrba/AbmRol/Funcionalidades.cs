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
    public partial class Funcionalidades : Form
    {
        DataTable dt;
        int Funcion;
        public Funcionalidades(int accion,string nombreRol)
        {
            InitializeComponent();
            llenarCheckBox();
            Funcion = accion;
            switch (accion)
            {
                case 0:
                    nuevoRol();
                    break;
                case 1:
                    oldRol(nombreRol);
                    break;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Hide();
        }

        public void setCheckBox()
        {
            string query = "exec getAllFuncionalidades()";
            SqlConnection conn = new SqlConnection();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cm);
            dt = new DataTable();
            sda.Fill(dt);
            llenarCheckBox();
        }

        public void llenarCheckBox()
        {
            int i;
            for (i = 0; i < dt.Rows.Count; i++)
            {
                checkedListBox1.Items.Add(dt.Rows[i]["fun_nombre"]);
            }
        }

        public void nuevoRol()
        {
            button3.Enabled = false;
        }

        public void oldRol(string nombreRol)
        {
            deactivateModifications();
            checkedListBox1.Enabled = false;
            checkFuncionalidadesDelRol(nombreRol);
            textBox1.Text = nombreRol;
            

        }

        private void deactivateModifications()
        {
            button4.Enabled = false;
            button5.Enabled = false;
            button6.Enabled = false;
            textBox1.Enabled = false;
        }

        public void checkFuncionalidadesDelRol(string nombreRol)
        {
            string query = String.Format("exec getFuncionalidadDelRol({0})",nombreRol);
            SqlConnection conn = new SqlConnection();
            int i;
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sda = cm.ExecuteReader();
            while (sda.Read()) 
            {
                for (i = 0; i < checkedListBox1.Items.Count; i++) 
                {
                    if (sda["fun_id"] == dt.Rows[i]["fun_id"]) 
                    {
                        checkedListBox1.SetItemChecked(i, true);
                    }
                }
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int i;
            for (i = 0; i < checkedListBox1.Items.Count; i++) {
                checkedListBox1.SetItemChecked(i, true);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            int i;
            for (i = 0; i < checkedListBox1.Items.Count; i++)
            {
                checkedListBox1.SetItemChecked(i, false);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            checkedListBox1.Enabled = true;
            button4.Enabled = true;
            button5.Enabled = true;
            button6.Enabled = true;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (Funcion == 0) { insertarRol(); }
            InsertarFuncionalidades();
            deactivateModifications();
        }

        public void insertarRol() 
        {
            string query = String.Format("exec InsertarRol({0})", textBox1.Text);
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();
        }

        public void InsertarFuncionalidades() 
        {
            int id_rol = getId_Rol();
            int i = 0;
            for (i = 0; i < checkedListBox1.Items.Count; i++)
            {
                if (checkedListBox1.GetItemChecked(i) )
                {
                    insertFuncionalidad(id_rol,i);
                }
            }
            
            
        }

        public int getId_Rol()
        {
            string query = String.Format("SELECT rol_id FROM rol WHERE rol_nombre = {0}",textBox1.Text);
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            SqlCommand com = new SqlCommand(query, conn);
            SqlDataReader sdr = com.ExecuteReader();
            sdr.Read();
            return (int) sdr["rol_id"];
        }

        public void insertFuncionalidad(int id_rol, int i)
        {
            int fun_id = (int)dt.Rows[i]["fun_id"];

            string query = String.Format("exec InsertarRolXFuncionalidad({0},{1})", id_rol,fun_id);
            SqlConnection conn = (new BDConnection()).getMiConnectionSQL();
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();
        }


    }
}
