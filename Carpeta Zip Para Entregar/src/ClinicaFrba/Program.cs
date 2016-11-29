using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Configuration;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClinicaFrba;

namespace ClinicaFrba
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            
            //testConexionBD();
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new VentanaInicial());
            Application.Run(new Registrar_Agenta_Medico.Registrar_agenda(5551));
        }

        public static void testConexionBD()
        {
            string query = "SELECT TOP 1 us_username FROM DREAM_TEAM.usuarios";
            SqlConnection conn = (new BDConnection()).getConnection();
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                string fieldValue = rdr.GetString(0);
                Console.WriteLine(fieldValue);
            }
            conn.Close();
        }

        public static String server()
        {
            return ConfigurationManager.AppSettings["server"];
        }

        public static String puerto()
        {
            return ConfigurationManager.AppSettings["puerto"];
        }


        public static String nuevaFechaSistema()
        {
            return ConfigurationManager.AppSettings["FechaGlobal"];
        }

        public static String password()
        {
            return ConfigurationManager.AppSettings["password"];
        }

        public static String database()
        {
            return ConfigurationManager.AppSettings["database"];
        }

        public static String user()
        {
            return ConfigurationManager.AppSettings["user"];
        }

    }

}