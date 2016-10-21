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

    class LoginDB
    {


        public static void login(String username, String text)
        {
            String encriptedPW = GenerateSHA256String(text);
            String query = String.Format("SELECT * FROM usuarios WHERE us_username = {0} AND us_password = {1} AND us_login_fail < 3 AND status = 'A'", username, encriptedPW);
            SqlConnection Conn = BDConnection.getConnection();
            SqlCommand consulta = new SqlCommand(query, Conn);
            try
            {
                SqlDataReader execute = consulta.ExecuteReader();
                if (execute.Read() == true)
                {
                    MessageBox.Show("Bienvenido al sistema");
                }
                else
                {
                    MessageBox.Show("Datos Incorrectos", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception e)
            {

            }
            Conn.Close();
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
