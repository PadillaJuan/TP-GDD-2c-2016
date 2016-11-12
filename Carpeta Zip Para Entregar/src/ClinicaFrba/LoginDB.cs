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
        public String pw;
        public String us_username;
        public Int16 us_login_fail;
        public String us_status;
    }

    class LoginDB
    {
        public static long login(String username, String text)
        {
            long retorno = -1;
            String encriptedPW = GenerateSHA256String(text);
            String query = String.Format("SELECT * FROM usuarios WHERE us_username like {0}", username);
            SqlConnection Conn = (new BDConnection()).getConnection();
            SqlCommand consulta = new SqlCommand(query, Conn);
            dataLogin lg = new dataLogin();
            try
            {
                SqlDataReader execute = consulta.ExecuteReader();

                lg.us_id = execute.GetInt64(0);
                lg.us_username = execute.GetString(1);
                lg.pw = execute.GetString(2);
                lg.us_login_fail = execute.GetInt16(3);
                lg.us_status = execute.GetString(4);

                retorno = foundUser(lg, encriptedPW);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            Conn.Close();
            return retorno;
        }

        private static void wrongPw(long us_id)
        {
            String query = String.Format("UPDATE usuarios SET us_login_fail = us_login_fail+1 WHERE us_id like {0}", us_id);
            SqlConnection Conn = (new BDConnection()).getConnection();
            SqlCommand consulta = new SqlCommand(query, Conn);
            consulta.ExecuteNonQuery();
            Conn.Close();
        }

        private static long foundUser(dataLogin lg, String pw)
        {
            long us_id = -1;
			if (lg.us_login_fail >= 3)
            {
                MessageBox.Show("Se ha superado el numero de intentos de login", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
			else if (pw == lg.pw)
            {
				if (lg.us_status.Equals("D") || lg.us_status.Equals("d")){
					MessageBox.Show("El usuario esta desactivado", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
				} else {
					MessageBox.Show("Bienvenido al sistema", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
					us_id = lg.us_id;					
				}
            }
            else
            {                
                MessageBox.Show("La contraseña es incorrecta", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                wrongPw(lg.us_id);
            }
            return us_id;
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
