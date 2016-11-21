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




namespace ClinicaFrba.Cancelar_Atencion
{
    public partial class TurnCancelAfiliado : Form
    {
        string afiliadoId;
        public TurnCancelAfiliado(string idAfiliado)
        {

            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;

            afiliadoId = idAfiliado;
            string query2 = "SELECT DATEPART(hour,turno_fecha),DATEPART(day,turno_fecha),DATEPART(month,turno_fecha),DATEPART(year,turno_fecha) FROM turnos t JOIN afiliado a ON (t.turno_afi=a.af_id) WHERE a.af_id=afiliadoId";
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);

            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
