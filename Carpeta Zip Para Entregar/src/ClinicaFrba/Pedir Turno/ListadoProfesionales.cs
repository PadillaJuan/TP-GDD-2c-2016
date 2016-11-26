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

using ClinicaFrba.Utils;


namespace ClinicaFrba.Pedir_Turno
{
    public partial class ListadoProfesionales : Form
    {
        
       String wheres;
       long afiliadoId;
       DataTable dt;
        public ListadoProfesionales(int idUsuarioPasado)
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            getID(idUsuarioPasado);

            string comando = "SELECT * FROM especialidad";
            dt = (new BDConnection()).cargarTablaSQL(comando);


         
            ChkListEspecialidades.Items.Clear();
            for (int i = 0; i <= (dt.Rows.Count - 1); i++)
            {
                int idf = Convert.ToInt32(dt.Rows[i][0]);
                ChkListEspecialidades.Items.Insert(i, new Especialidades(idf, dt.Rows[i][1].ToString(), this));
            }

            inicializar(true);
          
        }

         private void inicializar(bool esLaPrimeraVez)
         {
             dataGridView1.RowTemplate.MinimumHeight = 33;
             txtDescrip.Text = "";

             for (int i = 0; i <= ChkListEspecialidades.Items.Count - 1; i++)
             {
                 ChkListEspecialidades.SetItemCheckState(i, CheckState.Unchecked);
             }
             if (!esLaPrimeraVez)
             {
                 filtrarPag();
             }
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

        private void filtrarPag()
        {
           
            if (ChkListEspecialidades.CheckedIndices.Count == 0)
            {
                MessageBox.Show("Se debe elegir al menos una especialidad", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            };

            wheres = "";
            armarWhere();

            string query2 = "SELECT DISTINCT(p.prof_id), prof_nombre, prof_apellido FROM especialidad e JOIN especialidad_por_profesional r ON (e.esp_id = r.esp_id) JOIN profesional p ON ( r.prof_id = p.prof_id) WHERE prof_apellido != '' AND esp_descripcion IN " + wheres;
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            inicializar(false);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            filtrarPag();
        }

        private void buttonElegirPub_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count != 0)
            {
                DataGridViewRow row = this.dataGridView1.SelectedRows[0];
                int profesional_id = Int32.Parse(row.Cells["prof_id"].Value.ToString());
                string profesional_apellido = row.Cells["prof_apellido"].Value.ToString();

                int espId = Int32.Parse((dt.Rows[ChkListEspecialidades.SelectedIndex][0]).ToString());

                Pedir_Turno.ElegirTurno turno = new Pedir_Turno.ElegirTurno(profesional_id, profesional_apellido, af_id(), af_rel_id(), espId, this);
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

            filtrarPag();
        }


        private void ChkListEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            // Get the items that are selected
            CheckedListBox.CheckedIndexCollection selectedItems = this.ChkListEspecialidades.CheckedIndices;

            // Check that we have at least 1 item selected
            if (selectedItems.Count > 0)
            {
                // Uncheck the other item
                this.ChkListEspecialidades.SetItemChecked(selectedItems[0], false);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonReestablecer_Click_1(object sender, EventArgs e)
        {
            for (int i = 0; i <= ChkListEspecialidades.Items.Count - 1; i++)
            {
                ChkListEspecialidades.SetItemCheckState(i, CheckState.Unchecked);
            }
        }

        private void getID(int us_id)
        {
            string query = String.Format("SELECT af_id*100+af_rel_id FROM afiliado WHERE us_id = {0}", us_id);
            SqlConnection cn = (new BDConnection()).getInstance();
            SqlCommand cm = new SqlCommand(query, cn);
            afiliadoId = long.Parse(cm.ExecuteScalar().ToString());
        }

        private short af_rel_id()
        {
            return short.Parse((afiliadoId % 100).ToString());
        }

        private long af_id()
        {
            return (long)afiliadoId / 100;
        }
    }
}
