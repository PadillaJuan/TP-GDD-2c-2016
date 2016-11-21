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
    public partial class TurnCancelProfesional : Form
    {
        String idProfesional;
        public TurnCancelProfesional(string profesionalId)
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = true;
            dataGridView1.ReadOnly = true;

            idProfesional = profesionalId;

            
            string query2 = "SELECT DATEPART(hour,turno_fecha),DATEPART(day,turno_fecha),DATEPART(month,turno_fecha),DATEPART(year,turno_fecha) FROM turnos t JOIN profesional p ON (t.turno_afi=p.prof_id) WHERE p.prof_id=idProfesional";
            CompletadorDeTablas.hacerQuery(query2, ref dataGridView1);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
