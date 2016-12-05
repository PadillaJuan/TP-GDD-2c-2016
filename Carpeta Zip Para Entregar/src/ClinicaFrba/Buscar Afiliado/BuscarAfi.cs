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

namespace ClinicaFrba.BuscarAfiliado
{
    public partial class BuscarAfi : Form
    {
        DataTable dt;
        public BuscarAfi(int asRol)
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
            setButtons(asRol);
        }

        private void button1_Click(object sender, EventArgs e) // AGREGAR FAMILIAR
        {
            
            int index = dataGridView1.CurrentCell.RowIndex;
            if (index == -1)
            {
                MessageBox.Show("No se ha seleccionado un afiliado.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                long id = getId();
                Abm_Afiliado.ABM_afi form = new Abm_Afiliado.ABM_afi(2, id);
            }
        }

        private void button2_Click(object sender, EventArgs e) // DAR DE BAJA
        {

           
        }

        private void button5_Click(object sender, EventArgs e) // VOLVER
        {
            Close();
        }

        private void button6_Click(object sender, EventArgs e) // BUSCAR AFILIADO/S
        {
            if (validarEntrada())
            {
                String query = generateSearchQuery();
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                dt = new DataTable();
                sda.Fill(dt);
                conn.Close();
                dataGridView1.DataSource = dt;
                dataGridView1.AutoGenerateColumns = true;
            }
        }

        private bool validarEntrada()
        {
            bool flag = true;
            int n;
            if (!(textBox1.Text.Length > 0 || textBox2.Text.Length > 0 || textBox3.Text.Length > 0))
            {
                MessageBox.Show("No se ha seleccionado opcion de busqueda.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                flag = false;
            }
            else
            {
                if (textBox1.Text.Length > 0 && !int.TryParse(textBox1.Text,out n))
                {
                    MessageBox.Show("No se ha ingresado un numero de afiliado válido.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    flag = false;
                }
                if (textBox2.Text.Length > 0 && !textBox2.Text.All( c => Char.IsLetter(c)))
                {
                    MessageBox.Show("No se ha ingresado un nombre de afiliado válido.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    flag = false;
                }
                if (textBox3.Text.Length > 0 && !textBox3.Text.All(c => Char.IsLetter(c)))
                {
                    MessageBox.Show("No se ha ingresado un apellido de afiliado válido.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    flag = false;
                }
            }
            return flag;
        }

        private long getId()
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            
            long id = Int64.Parse(dt.Rows[index][0].ToString()) * 100 + Int64.Parse(dt.Rows[index][1].ToString());
            return id;
        }

        private long getIdSinRel()
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            long id = Int64.Parse(dt.Rows[index][0].ToString());
            return id;
        }

        private short getRel_Id()
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            short id = Int16.Parse(dt.Rows[index][1].ToString());
            return id;
        }

        private int getPlanMed()
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataGridViewRow linea = dataGridView1.Rows[index];
            int id = Int32.Parse(dt.Rows[index][13].ToString());
            return id;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        public String generateSearchQuery()
        {
            bool flag= false;
            string query = "SELECT * FROM DREAM_TEAM.afiliado WHERE ";
            if (textBox1.Text.Length > 0) {
                String id;
                id = String.Format("{0}", int.Parse(textBox1.Text) / 100);
                query += String.Format("(af_id = {0} ) ", id);
                flag = true;
                
            }
            if (textBox2.Text.Length > 0)
            {
                if (flag) { query += " AND ";};
                query += String.Format("af_nombre like '{0}'",textBox2.Text);
                flag = true;
            }
            if (textBox3.Text.Length > 0)
            {
                if (flag) { query += " AND "; };
                query += String.Format("af_apellido like '{0}'",textBox3.Text);
            }
            return query;
        }

        // CREAR NUEVO AFILIADO
        private void button7_Click(object sender, EventArgs e)
        {
            Abm_Afiliado.ABM_afi form = new Abm_Afiliado.ABM_afi(0, 0);
            form.Show();
        }

        // DAR AFILIADO DE BAJA
        private void button2_Click_1(object sender, EventArgs e)
        {
            int index;
            try
            {
                index = dataGridView1.CurrentCell.RowIndex;
            }
            catch (Exception a)
            {
                index = -1;
            }
            if (index == -1)
            {
                MessageBox.Show("No se ha seleccionado un afiliado.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                if ((MessageBox.Show(String.Format("Desea dar de baja el afiliado {0}, {1}?", dt.Rows[index][4].ToString(), dt.Rows[index][3].ToString()), "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
                {
                    SqlConnection conn = (new BDConnection()).getInstance();
                    String query = String.Format("DREAM_TEAM.bajaAfiliado");
                    SqlCommand com = new SqlCommand(query, conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@id", getIdSinRel());
                    com.Parameters.AddWithValue("@id_rel", getRel_Id());
                    com.Parameters.AddWithValue("@af_fechaBaja", DateTime.Parse(Program.nuevaFechaSistema()));
                    com.ExecuteNonQuery();
                    conn.Close();
                    MessageBox.Show("El afiliado se dio de baja con éxito.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }
        // AGREGAR FAMILIAR
        private void button1_Click_1(object sender, EventArgs e)
        {
            int index;
            try
            {
                index = dataGridView1.CurrentCell.RowIndex;
            }
            catch (Exception a)
            {
                index = -1;
            }
            if (index == -1)
            {
                MessageBox.Show("No se ha seleccionado un afiliado.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                if (int.Parse(dt.Rows[index][1].ToString()) != 0)
                {
                    MessageBox.Show("Solo un afiliado titular puede agregar familiares.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                if ('d' == Char.Parse(dt.Rows[index][15].ToString()))
                {
                    MessageBox.Show("El afiliado esta dado de baja, no puede ingresar familiares.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                Abm_Afiliado.ABM_afi form = new Abm_Afiliado.ABM_afi(2, getIDForFamiliar());
                form.Show();

            }
        }

        private long getIDForFamiliar()
        {
            int index = dataGridView1.SelectedRows[0].Index;
            return getId() + long.Parse(dt.Rows[index][12].ToString()) + 1;
        }

        public void setButtons(int asRol)
        {
            switch (asRol)
            {
                case 1:
                    break;
                case 2:
                    button1.Enabled = false;
                    button2.Enabled = false;
                    button7.Enabled = false;
                    break;
            }
        }
        // UPDATE AFILIADO
        private void button8_Click(object sender, EventArgs e)
        {
            int index;
            try
            {
                index = dataGridView1.CurrentCell.RowIndex;
            }
            catch (Exception a)
            {
                index = -1;
            }
            if (index == -1)
            {
                MessageBox.Show("No se ha seleccionado un afiliado.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if ('d' == Char.Parse(dt.Rows[index][15].ToString()))
            {
                MessageBox.Show("El afiliado esta dado de baja, no se puede modificar.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            Abm_Afiliado.ABM_afi form = new Abm_Afiliado.ABM_afi(1, getId());
            form.Show();
            
        }
    }
}
