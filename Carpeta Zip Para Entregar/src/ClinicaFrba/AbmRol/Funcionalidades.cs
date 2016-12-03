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
        int id_rol;
        int Funcion;
        public Funcionalidades(int accion,int rol_id, string nombreRol)
        {
            InitializeComponent();
            setCheckBox();
            Funcion = accion;
            
            switch (accion)
            {
                case 0:
                    nuevoRol();
                    break;
                case 1:
                    oldRol(rol_id, nombreRol);
                    id_rol = rol_id;
                    break;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        public void setCheckBox()
        {
            string query = "DREAM_TEAM.getAllFuncionalidades";
            SqlConnection conn = new BDConnection().getInstance();
            SqlCommand cm = new SqlCommand(query, conn);
            cm.CommandType = CommandType.StoredProcedure;
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

        public void oldRol(int rol_id, string nombreRol)
        {
            deactivateModifications();
            checkedListBox1.Enabled = false;
            checkFuncionalidadesDelRol(rol_id);
            textBox1.Text = nombreRol;
            
        }

        private void deactivateModifications()
        {
            button4.Enabled = false;
            button5.Enabled = false;
            button6.Enabled = false;
            textBox1.Enabled = false;
        }


        //Pone en checked o no las funcionalidades del rol
        public void checkFuncionalidadesDelRol(int rol_id)
        {
            string query = "DREAM_TEAM.getFuncionalidadDelRol";
            SqlConnection conn = (new BDConnection()).getInstance();
            int i;
            SqlCommand cm = new SqlCommand(query, conn);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.Add(new SqlParameter("@id_rol", rol_id));
            SqlDataReader sda = cm.ExecuteReader();
            try
            {
                while (sda.Read())
                {
                    for (i = 0; i < checkedListBox1.Items.Count; i++)
                    {
                        if ((int)sda["fun_id"] == (int)dt.Rows[i]["fun_id"])
                        {
                            checkedListBox1.SetItemChecked(i, true);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "Clinica FRBA");
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
            textBox1.Enabled = true;
            textBox1.MaxLength = 30;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (Funcion == 0) { insertarRol(); }
            else { setForNewRol(); }
            InsertarFuncionalidades();
            deactivateModifications();
            MessageBox.Show("Los cambios fueron ingresados con éxito", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
            Close();
        }

        // Update al nombre del rol
        public void setForNewRol()
        {
            string query = String.Format("DREAM_TEAM.updateRol", textBox1.Text);
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nombre_rol", textBox1.Text);
            com.Parameters.AddWithValue("@id_rol", id_rol);
            com.ExecuteNonQuery();
        }

        // Inserta el nuevo rol
        public void insertarRol() 
        {
            string query = String.Format("DREAM_TEAM.InsertarRol", textBox1.Text);
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nombre_rol", textBox1.Text);
            com.ExecuteNonQuery();
        }

        public void InsertarFuncionalidades() 
        {
            int i = 0;
            if (Funcion == 1) { deleteFun(); }
            for (i = 0; i < checkedListBox1.Items.Count; i++)
            {
                if (checkedListBox1.GetItemChecked(i) )
                {
                    insertFuncionalidad(id_rol,i);
                }
            }       
        }

        // Saca las funcionalidades viejas
        public void deleteFun()
        {
            string query = "DREAM_TEAM.UpdateRXF";
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("id_rol", id_rol);
            com.ExecuteNonQuery();
        }
        // Inserta individualmente las funcionalidades
        public void insertFuncionalidad(int id_rol, int i)
        {
            int fun_id = (int)dt.Rows[i]["fun_id"];
            string query = "DREAM_TEAM.InsertarRolXFuncionalidad";
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nombre_rol",textBox1.Text);
            com.Parameters.AddWithValue("@fun_id",fun_id);
            com.ExecuteNonQuery();
        }


    }
}
