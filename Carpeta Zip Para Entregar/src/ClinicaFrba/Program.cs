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
            Application.Run(new BuscarAfiliado.BuscarAfi());
            // Application.Run(new Pedir_Turno.ElegirTurno("3", "Conchudo"));
        }

        public static void testConexionBD()
        {
            string query = "SELECT TOP 1 us_username FROM usuarios";
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

        /* public void ConnectToSql()
         {
             System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
             // TODO: Modify the connection string and include any
             // additional required properties for your database.
             conn.ConnectionString = "integrated security=SSPI;data source=SQL Server Name;" + "persist security info=False;initial catalog=northwind";
             try
             {
                 conn.Open();
                 // Insert code to process data.
             }
             catch (Exception ex)
             {
                 MessageBox.Show("Failed to connect to data source");
             }
             finally
             {
                 conn.Close();
             }
         }*/
    }

}
