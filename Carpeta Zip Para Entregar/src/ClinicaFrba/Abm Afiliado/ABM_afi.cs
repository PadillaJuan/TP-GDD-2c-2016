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

namespace ClinicaFrba.Abm_Afiliado
{

    public partial class ABM_afi : Form
    {
        long id_;
        int planMed;
        int accionElegida;
        
        public ABM_afi(int accion, long id)
        {
            InitializeComponent();
            setComboBoxes();
            id_ = id;
            this.cargarComboBoxPlanMedico();
            accionElegida = accion;
            switch (accion)
            {
                case 0:
                    nuevoAfiliado();
                    break;
                case 1:
                    setForUpdateAfiliado();
                    break;
                case 2:
                    agregarFamiliar();
                    break;
                default:
                    break;
            }
        }

        private void button1_Click(object sender, EventArgs e) // DAR DE ALTA
        {
            if (this.checkearDatos())
                MessageBox.Show("Datos incorrectos", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                this.darAltaAfiliado();
                MessageBox.Show("El afiliado se ha dado de alta con éxito.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

        }

        private void button2_Click(object sender, EventArgs e) //VOLVER
        {
            Close();
        }

        private void button3_Click(object sender, EventArgs e) //Terminar Actualizacion
        {
            if (this.checkearDatos())
                MessageBox.Show("Datos incorrectos", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            else  
                {
                    updateAfiliado();
                    MessageBox.Show("El afiliado se ha actualizado con éxito.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
            
        }

        private void button4_Click(object sender, EventArgs e) // SALIR
        {
            Application.Exit();
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
            SqlConnection conn = (new BDConnection()).getInstance();
            string query = String.Format("DREAM_TEAM.getPlanesMedicos");
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    comboBox3.Items.Add(dr["planmed_id"]);
                }
                dr.Close();
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

        public void agregarFamiliar()
        {
            button3.Enabled = false;
            textBox1.Text = String.Format("{0}", id_);
            textBox1.Enabled = false;
        }

        public void setForUpdateAfiliado()
        {
            button1.Enabled = false;
            this.cargarDatosALaPlantilla();
            comboBox1.Enabled = false;
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
            textBox4.Enabled = false;
            dateTimePicker1.Enabled = false;
        }

        public void cargarDatosALaPlantilla() 
        {

            String query = "DREAM_TEAM.getDatosDelAfiliado";
            SqlConnection Conn = (new BDConnection()).getInstance();
            SqlCommand consulta = new SqlCommand(query, Conn);
            consulta.CommandType = CommandType.StoredProcedure;
            consulta.Parameters.AddWithValue("@af_id", getId());
            consulta.Parameters.AddWithValue("@af_rel_id", getShortID());
            try
            {
                SqlDataReader execute = consulta.ExecuteReader();
                execute.Read();
                cargarDatos(execute);
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private long getId()
        {
            return (id_ / 100);
        }

        private short getShortID()
        {
            return (short)(id_ % 100);
        }

        public void cargarDatos(SqlDataReader dr)
        {
            textBox1.Text = id_.ToString();
            textBox2.Text = dr.GetString(3);
            textBox3.Text = dr.GetString(4);
            comboBox1.Text = dr.GetString(5);
            textBox4.Text = dr[6].ToString();
            textBox5.Text = dr.GetString(7);
            textBox6.Text = dr[8].ToString();
            planMed = Int32.Parse(dr[13].ToString());
            textBox7.Text = dr.GetString(9);
            dateTimePicker1.Value = dr.GetDateTime(10);
            comboBox2.Text = dr.GetString(11);
            comboBox3.Text = dr[13].ToString();
            comboBox4.Text = dr.GetString(14);
            dr.Close();
        }
           
        public bool checkearDatos()
        {
            bool i = false;
            int n;
            long m;

            if (textBox2.Text.Length == 0 || textBox3.Text.Length == 0 || textBox4.Text.Length == 0) { i = true; }
            if (!textBox2.Text.All(c => Char.IsLetter(c)) || !textBox3.Text.All(d => Char.IsLetter(d)) || !int.TryParse(textBox4.Text, out n)) { i = true;}
            if (comboBox1.SelectedIndex == -1 || comboBox2.SelectedIndex == -1 || comboBox3.SelectedIndex == -1 || comboBox4.SelectedIndex == -1) { i = true;}
            if (dateTimePicker1.Value == DateTime.Parse("1900-01-01 00:00:00.000")) { i = true;  }
            if (dateTimePicker1.Value >= DateTime.Parse(Program.nuevaFechaSistema())) { i = true;  }
            if (textBox5.Text.Length == 0 || textBox6.Text.Length == 0 || textBox7.Text.Length == 0) { i = true;  }
            if (!long.TryParse(textBox6.Text, out m) && dateTimePicker1.Value >= DateTime.Parse(Program.nuevaFechaSistema())) { i = true; }

            return i;
        }

        public void darAltaAfiliado()
        {
            switch (accionElegida)
            {
                case 0:
                    altaNuevoAfiliado();
                    break;
                case 2:
                    altaFamiliar();
                    break;
            }
        }

        public void altaFamiliar()
        {
            try
            {
                string query = "DREAM_TEAM.altaFamiliar";
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@af_id", getId());
                com.Parameters.AddWithValue("@af_rel_id", (Int16)0);
                com.Parameters.AddWithValue("@af_nombre", textBox2.Text);
                com.Parameters.AddWithValue("@af_apellido", textBox3.Text);
                com.Parameters.AddWithValue("@af_tipodoc", comboBox1.Text);
                com.Parameters.AddWithValue("@af_numdoc", textBox4.Text);
                com.Parameters.AddWithValue("@af_direccion", textBox5.Text);
                com.Parameters.AddWithValue("@af_telefono", textBox6.Text);
                com.Parameters.AddWithValue("@af_mail", textBox7.Text);
                com.Parameters.AddWithValue("@af_nacimiento", dateTimePicker1.Value);
                com.Parameters.AddWithValue("@af_estado_civil", comboBox2.Text);
                com.Parameters.AddWithValue("@planmed_id", Int32.Parse(comboBox3.Text));
                com.Parameters.AddWithValue("@af_sexo", comboBox4.Text);
                com.ExecuteNonQuery();
                com.Dispose();
                Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        private void altaNuevoAfiliado()
        {
            try
            {
                string query = "DREAM_TEAM.altaAfiliado";
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@af_rel_id", (Int16)0);
                com.Parameters.AddWithValue("@af_nombre", textBox2.Text);
                com.Parameters.AddWithValue("@af_apellido", textBox3.Text);
                com.Parameters.AddWithValue("@af_tipodoc", comboBox1.Text);
                com.Parameters.AddWithValue("@af_numdoc", textBox4.Text);
                com.Parameters.AddWithValue("@af_direccion", textBox5.Text);
                com.Parameters.AddWithValue("@af_telefono", textBox6.Text);
                com.Parameters.AddWithValue("@af_mail", textBox7.Text);
                com.Parameters.AddWithValue("@af_nacimiento", dateTimePicker1.Value);
                com.Parameters.AddWithValue("@af_estado_civil", comboBox2.Text);
                com.Parameters.AddWithValue("@planmed_id", Int32.Parse(comboBox3.Text));
                com.Parameters.AddWithValue("@af_sexo", comboBox4.Text);
                com.ExecuteNonQuery();
                com.Dispose();
                MessageBox.Show("Si el afiliado tiene familiares para registrar, realizarlo en la opcion \"Agregar Familiar\". Gracias.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }
        
        
        public void updateAfiliado()
        {
            string query = "DREAM_TEAM.actualizarAfiliado";
            SqlConnection con = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, con);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@af_id",getId());
            cm.Parameters.AddWithValue("@af_rel_id",getShortID());
            cm.Parameters.AddWithValue("@af_direccion",textBox5.Text);
            cm.Parameters.AddWithValue("@af_telefono",textBox6.Text);
            cm.Parameters.AddWithValue("@af_mail",textBox7.Text);
            cm.Parameters.AddWithValue("@af_estado_civil", comboBox2.Text);
            cm.Parameters.AddWithValue("@planmed_id", Int32.Parse(comboBox3.Text));
            cm.Parameters.AddWithValue("@af_sexo", comboBox4.Text);
            if (planMed != Int32.Parse(comboBox3.Text))
            {
                Motivo_Cambio_Plan form = new Motivo_Cambio_Plan();
                DialogResult res = form.ShowDialog();
                if (res == DialogResult.OK)
                {
                    cm.Parameters.AddWithValue("@motivoCambio", form.motivoCambio);
                }
            }
            else
            {
                cm.Parameters.AddWithValue("@motivoCambio", ""); 
            }
            cm.Parameters.AddWithValue("@fecha",DateTime.Parse(Program.nuevaFechaSistema()));
            cm.ExecuteNonQuery();
            cm.Dispose();
            planMed = Int32.Parse(comboBox3.Text);
        }


        private void ABM_afi_Load(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

    }
}

