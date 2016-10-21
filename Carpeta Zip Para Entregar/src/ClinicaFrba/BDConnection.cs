using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ClinicaFrba
{
    public class BDConnection
    {
        public static SqlConnection getConnection()
        {
            SqlConnection conection = new SqlConnection("Data source= gd; Initial catalog= GD2C2016; User=gd; Password= gd2016");
            try
            {
                conection.Open();
            }
            catch (SqlException e)
            {
                MessageBox.Show("No se pudo conectar a la base de datos", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return conection;
        }
    }
}
