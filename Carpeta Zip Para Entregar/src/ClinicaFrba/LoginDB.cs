using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace ClinicaFrba
{

    public class LoginDB
    {
        public static int login(String username, String text)
        {
            int us_id = -1;
            SqlConnection conn = (new BDConnection()).getInstance();
            SqlCommand consulta = new SqlCommand("login", conn);
            consulta.CommandType = CommandType.StoredProcedure;
            consulta.Parameters.Add(new SqlParameter("@us_name",username));
            consulta.Parameters.Add(new SqlParameter("@us_pw", text));
            SqlParameter retval = new SqlParameter("@us_idR", SqlDbType.Int);
            retval.Value = 0;
            retval.Direction = ParameterDirection.Output;
            consulta.Parameters.Add(retval);
            try
            {
                consulta.ExecuteNonQuery();
                us_id = (int)retval.Value;
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message, "Clinica FRBA", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            conn.Close();
            return us_id;
        }
    }
}
