using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace ClinicaFrba
{
    class dataLogin
    {
        public long us_id;
        public string us_username;
        public Int16 us_login_fail;
        public String us_status;
    }
    class LoginDB
    {


        public static int login(String username, String text)
        {
            int retorno= 0;
            String encriptedPW = GenerateSHA256String(text);
            String query = String.Format("SELECT * FROM usuarios WHERE us_username like {0} AND us_password like {1}", username, encriptedPW);
            SqlConnection Conn = BDConnection.getConnection();
            SqlCommand consulta = new SqlCommand(query, Conn);
            dataLogin lg = new dataLogin();
            try
            {
                SqlDataReader execute = consulta.ExecuteReader();
                if(execute.Read()== true)
                {
                    Conn.Close();
                    retorno = foundUser(lg, execute);
                }
                else
                {
                    userNotFound(lg);
                }
            }
            catch (Exception e)
            {

            }
            Conn.Close();
            return retorno;
        }

        private static void userNotFound(dataLogin lg)
        {
            MessageBox.Show("Datos Incorrectos", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            String query = String.Format("UPDATE usuarios SET us_login_fail = us_login_fail+1 WHERE us_id like {0}", lg.us_id);
            SqlConnection Conn = BDConnection.getConnection();
            SqlCommand consulta = new SqlCommand(query, Conn);
            consulta.ExecuteNonQuery();
            Conn.Close();
        }

        private static int foundUser(dataLogin lg, SqlDataReader execute)
        {
            int retorno = 0;
            while (execute.Read())
            {

                lg.us_id = execute.GetInt64(0);
                lg.us_username = execute.GetString(1);
                lg.us_login_fail = execute.GetInt16(3);
                lg.us_status = execute.GetString(4);
            }
            if (lg.us_login_fail >= 3)
            {
                MessageBox.Show("Se ha superado el numero de intentos de login", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (lg.us_status.Equals("D"))
            {
                MessageBox.Show("El usuario esta desactivado", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                MessageBox.Show("Bienvenido al sistema", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                retorno = 1;
            }
            return retorno;
        }

        public static string GenerateSHA256String(string inputString)
        {
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(inputString);
            byte[] hash = sha256.ComputeHash(bytes);
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }

            return sb.ToString();
        }
    }
}
