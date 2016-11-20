using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using ClinicaFrba.Utils;


namespace ClinicaFrba.Pedir_Turno
{
    public partial class ListadoProfesionales : Form
    {
        
        String wheres;
       String nombreAfiliado;

        public ListadoProfesionales(String nombreAfiliadoPasado)
        {
          InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            nombreAfiliado = nombreAfiliadoPasado;

            string comando = "SELECT * FROM especialidad";
            DataTable dt = (new BDConnection()).cargarTablaSQL(comando);

          

            ChkListEspecialidades.Items.Clear();
            for (int i = 0; i <= (dt.Rows.Count - 1); i++)
            {
                int idf = Convert.ToInt32(dt.Rows[i][0]);
                ChkListEspecialidades.Items.Insert(i, new Especialidades(idf, dt.Rows[i][1].ToString(), this));
            }

            inicializar();
          
        }

         private void inicializar()
         {
             dataGridView1.RowTemplate.MinimumHeight = 33;
            txtDescrip.Text = "";


         

             for (int i = 0; i <= ChkListEspecialidades.Items.Count - 1; i++)
             {
                 ChkListEspecialidades.SetItemCheckState(i, CheckState.Unchecked);
             }

             ChkListEspecialidades.SetItemCheckState(0, CheckState.Checked);
             
             filtrarPag(1);

         }

         private void armarWhere()
         {
             wheres = wheres + "(";
             foreach (Especialidades elemento in ChkListEspecialidades.CheckedItems)
             {
                 wheres = wheres + " '" + elemento.Descripcion + "',";
             }
             wheres = wheres.Substring(0, wheres.Length - 1);
             wheres = wheres + ")";
             
            if (txtDescrip.Text != "")
            {
                wheres = wheres + " AND p.prof_apellido LIKE '%" + txtDescrip.Text + "%'";
            }
   
         }

        private void filtrarPag(int pagina)
        {
           
            if (ChkListEspecialidades.CheckedIndices.Count == 0)
            {
                MessageBox.Show("Se debe elegir al menos una especialidad", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            };

            wheres = "";
            armarWhere();

            string query2 = "SELECT DISTINCT(p.prof_id), prof_nombre, prof_apellido FROM especialidad e JOIN especialidad_por_profesional r ON (e.esp_id = r.esp_id) JOIN profesional p ON ( r.prof_id = p.prof_id) WHERE esp_descripcion IN " + wheres;
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            inicializar();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            filtrarPag(1);
        }

        private void buttonElegirPub_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count != 0)
            {
                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                string profesional_id = row.Cells["prof_id"].Value.ToString();
                string profesional_apellido = row.Cells["prof_apellido"].Value.ToString();
                Pedir_Turno.ElegirTurno turno = new Pedir_Turno.ElegirTurno(profesional_id, profesional_apellido, nombreAfiliado);
                turno.ShowDialog();

            }

            else
            {
                MessageBox.Show("Por favor, elija un Profesional", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void buttonPriPag_Click(object sender, EventArgs e)
        {
            if (ChkListEspecialidades.CheckedIndices.Count == 0)
            {
                MessageBox.Show("Se debe elegir al menos un rubro", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            };

            filtrarPag(1);
        }

        private void bindingSource1_CurrentChanged(object sender, EventArgs e)
        {

        }

        private void ChkListEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonReestablecer_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtDescrip_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void buttonReestablecer_Click_1(object sender, EventArgs e)
        {
            for (int i = 0; i <= ChkListEspecialidades.Items.Count - 1; i++)
            {
                ChkListEspecialidades.SetItemCheckState(i, CheckState.Unchecked);
            }
        }
    }
}
