using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

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
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Elegir_Rol.Elegir_Rol());
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
