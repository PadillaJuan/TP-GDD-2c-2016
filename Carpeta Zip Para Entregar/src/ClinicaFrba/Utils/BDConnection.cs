using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace ClinicaFrba
{
    public class BDConnection
    {
        private SqlConnection conection;
        private String conectionString;

        public SqlConnection getMiConnectionSQL()
        {
            return conection;
        }

         public String getMiConnectionString()
        {
            return conectionString;
        }

        public BDConnection()
        {
            conection = new SqlConnection();

            /*se usa para las conexiones tcp/ip*/
            //string gd20 = "Data source=" + Program.ip() + "," + Program.puerto() + "; Network Library=DBMSSOCN; Initial Catalog=GD1C2016;User Id=gd; Password=gd2016";

            /*se usa para las conexiones locales*/
            string gd20 = "Data source=.\\SQLSERVER2012; Initial Catalog=GD2C2016;User Id=gd; Password=gd2016";

            
            conectionString = gd20;
            conection.ConnectionString = conectionString;
        }

        public BDConnection(String _connectionString)
        {
            conection = new SqlConnection();
            conectionString = _connectionString;
            conection.ConnectionString = conectionString;
        }

        public SqlConnection getConnection()
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

        public Boolean getDisconnection()
        {

            Boolean conexionOK = true;

            // INTENTO DESCONECTARME
            try
            {
                conection.Close();
                conection.Dispose();

                // SI NO PUEDO, RETORNO FALSE
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                conexionOK = false;
            }

            return conexionOK;
        }

        public DataTable cargarTabla(SqlCommand miCommand)
        {
            DataTable ds = new DataTable();
            // REM CONFIGURO EL OBJETO COMMAND
            this.getConnection();
            // REM INDICO LA CONEXION ACTIVA
            miCommand.Connection = conection;
            // REM INDICO EL TIPO QUE SE PASARA EN COMMANDTEXT
            miCommand.CommandType = CommandType.Text;

            // REM CREO UN DATAREADER
            SqlDataAdapter dataAdapter = new SqlDataAdapter(miCommand);
            // REM CARGO EL DATATABLE PRODUCTOS A TRAVEZ DEL DATAREADER
            dataAdapter.Fill(ds);
            this.getDisconnection();
            return ds;
        }

        public DataTable cargarCombo(SqlCommand cmd)
        {
            this.getConnection();
            DataTable dt = new DataTable();
            cmd.Connection = conection;
            // REM INDICO EL TIPO QUE SE PASARA EN COMMANDTEXT
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter adap = new SqlDataAdapter(cmd);
            adap.Fill(dt);
            this.getDisconnection();
            return dt;

        }
        public void ejecutarProcedur(ref SqlCommand miCommand)
        {
            DataTable dataTable = new DataTable();

            // REM CONFIGURO EL OBJETO COMMAND
            this.getConnection();
            // REM INDICO LA CONEXION ACTIVA
            miCommand.Connection = conection;
            // REM INDICO EL TIPO QUE SE PASARA EN COMMANDTEXT
            miCommand.CommandType = CommandType.StoredProcedure;

            // REM CREO UN DATAREADER
            miCommand.ExecuteNonQuery();
            this.getDisconnection();
        }

        public void ejecutarComando(SqlCommand miCommand)
        {
            DataTable ds = new DataTable();
            // REM CONFIGURO EL OBJETO COMMAND
            this.getConnection();
            // REM INDICO LA CONEXION ACTIVA
            miCommand.Connection = conection;
            // REM INDICO EL TIPO QUE SE PASARA EN COMMANDTEXT
            miCommand.CommandType = CommandType.Text;

            miCommand.ExecuteNonQuery();
            this.getDisconnection();
        }

        public void ejecutarComandoSQL(string miCommand)
        {
            SqlCommand coman2 = new SqlCommand(string.Format(miCommand), conection);
            this.ejecutarComando(coman2);
        }

        public DataTable cargarTablaSQL(string miCommand)
        {
            SqlCommand coman2 = new SqlCommand(string.Format(miCommand), conection);

            DataTable ds = this.cargarTabla(coman2);
            return ds;
        }

        public void ejecutarComandoSQLConParametro(string query, string parametro)
        {
            SqlCommand coman2 = new SqlCommand(string.Format(query), conection);
            coman2.Parameters.AddWithValue("@Parametro", Convert.ToDouble(parametro));
            this.ejecutarComando(coman2);
        }



        
    }
}
