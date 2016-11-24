using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ClinicaFrba.Elegir_Accion
{
    public partial class Elegir_Accion : Form
    {
        int rol, us_idG;
        public Elegir_Accion(int rol_id, int us_id)
        {
            InitializeComponent();
            rol = rol_id;
            us_idG = us_id;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            llenarComboBox(rol_id);
        }

        public void llenarComboBox(int rol_id)
        {
            SqlConnection conn = (new BDConnection()).getConnection();
            string query = "getFuncionalidadDelRol";
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@id_rol",rol_id));
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    comboBox1.Items.Add(dr.GetString(1));
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
                String texto = comboBox1.Text;
                switch (texto)
                {
                    case "ABM de Rol":
                        // ABM ROL
                        AbmRol.ABMRol f1 = new AbmRol.ABMRol();
                        f1.Show();
                        break;
                    case "ABM de Afiliado":
                        // ABM AFILIADO
                        BuscarAfiliado.BuscarAfi f2 = new BuscarAfiliado.BuscarAfi(rol);
                        f2.Show();
                        break;
                    case "Registrar Agenda Profesional":
                        // REGISTRAR AGENDA PROFESIONAL
						Registrar_Agenta_Medico.Registrar_agenda f3 = new Registrar_Agenta_Medico.Registrar_agenda(us_idG);
                        f3.Show();
                        break;
                    case "Compra de Bonos":
                        // COMPRA DE BONOS
                        switch (rol)
                        {
                            case 1:
                                BuscarAfiliado.BuscarAfi f4 = new BuscarAfiliado.BuscarAfi(rol);
                                f4.Show();
                                break;
                            case 2:
                                Compra_Bono.Compra_Bono f5 = new Compra_Bono.Compra_Bono(rol);
                                f5.Show();
                                break;
                        }
                        break;
                        
                    case "Pedido de Turno":
                        // PEDIDO DE TURNO
                        string query5 = "SELECT af_nombre FROM afiliado WHERE us_id = us_idG";
                        DataTable dt5 = (new BDConnection()).cargarTablaSQL(query5);
                        string elAfiliadoQuePideElTurno = dt5.Rows[0][0].ToString();
                        
                        Pedir_Turno.ListadoProfesionales f6 = new Pedir_Turno.ListadoProfesionales(elAfiliadoQuePideElTurno);
                        f6.Show();
                        break;
                    case "Registro de Llegada":
                        // REGISTRO DE LLEGADA
                        Registro_Llegada.Registro_Llegada f7 = new Registro_Llegada.Registro_Llegada();
                        break;
                    case "Registro de Resultado":
                        // REGISTRO DE RESULTADO
                        Registro_Resultado.Reg_Res f8 = new Registro_Resultado.Reg_Res();
                        break;
                    case "Cancelar Atencion Medica":
                        // CANCELAR ATENCION MEDICA
                        break;
                    case "Listado Estadistico":
                        // LISTADO ESTADISTICO
                        Listados.Presentacion_Listados f10 = new Listados.Presentacion_Listados();
                        f10.Show();
                        break;
                    default:
                        MessageBox.Show("No se ha seleccionado ninguna accion", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                        break;
            }
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
