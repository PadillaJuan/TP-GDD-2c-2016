﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using ClinicaFrba.Dominio;

namespace ClinicaFrba.Registrar_Agenta_Medico
{
    public partial class Registrar_agenda : Form
    {
        int us_id;
        public Registrar_agenda(int us_id_parametro)
        {
            us_id = us_id_parametro;
            InitializeComponent();
            llenarComboBox();
            setComboBox();
            string[] fechaEquipo = (ConfigurationManager.AppSettings["FechaGlobal"]).Split('-');
            fecha_desde.Value = new DateTime(int.Parse(fechaEquipo[0]), int.Parse(fechaEquipo[1]), int.Parse(fechaEquipo[2]));
            fecha_hasta.Value = new DateTime(int.Parse(fechaEquipo[0]), int.Parse(fechaEquipo[1]), int.Parse(fechaEquipo[2]));
        }

        public void setComboBox()
        {
            setEspecialidadesComboBox();
            setLunes();
            setMartes();
            setMiercoles();
            setJueves();
            setViernes();
            setSabado();
        }

        private void setEspecialidadesComboBox()
        {
            especialidad_lunes.DropDownStyle = ComboBoxStyle.DropDownList;
            especialidad_martes.DropDownStyle = ComboBoxStyle.DropDownList;
            especialidad_miercoles.DropDownStyle = ComboBoxStyle.DropDownList;
            especialidad_jueves.DropDownStyle = ComboBoxStyle.DropDownList;
            especialidad_viernes.DropDownStyle = ComboBoxStyle.DropDownList;
            especialidad_sabado.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        public void setLunes()
        {
            horainicio_hora_lunes.DropDownStyle = ComboBoxStyle.DropDownList;
            horainicio_min_lunes.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_hora_lunes.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_min_lunes.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        public void setMartes()
        {
            horainicio_hora_martes.DropDownStyle = ComboBoxStyle.DropDownList;
            horainicio_min_martes.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_hora_martes.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_min_martes.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        public void setMiercoles()
        {
            horainicio_hora_miercoles.DropDownStyle = ComboBoxStyle.DropDownList;
            horainicio_min_miercoles.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_hora_miercoles.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_min_miercoles.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        public void setJueves()
        {
            horainicio_hora_jueves.DropDownStyle = ComboBoxStyle.DropDownList;
            horainicio_min_jueves.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_hora_jueves.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_min_jueves.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        public void setViernes()
        {
            horainicio_hora_viernes.DropDownStyle = ComboBoxStyle.DropDownList;
            horainicio_min_viernes.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_hora_viernes.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_min_viernes.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        public void setSabado()
        {
            horainicio_hora_sabado.DropDownStyle = ComboBoxStyle.DropDownList;
            horainicio_min_sabado.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_hora_sabado.DropDownStyle = ComboBoxStyle.DropDownList;
            horafin_min_sabado.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        // LLENA LOS COMBOBOX DE ESPECIALIDADES DEL MEDICO
        public void llenarComboBox()
        {
            SqlConnection conn = (new BDConnection()).getConnection();
            string query = "DREAM_TEAM.getEspecialidadesPorProfesional";
            SqlCommand com = new SqlCommand(query, conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@us_id", us_id));
            string especialidad;
            int esp_id;
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    esp_id = dr.GetInt32(0);
                    especialidad = dr.GetString(1);
                    especialidad_lunes.Items.Add(new Item(especialidad, esp_id));
                    especialidad_martes.Items.Add(new Item(especialidad, esp_id));
                    especialidad_miercoles.Items.Add(new Item(especialidad, esp_id));
                    especialidad_jueves.Items.Add(new Item(especialidad, esp_id));
                    especialidad_viernes.Items.Add(new Item(especialidad, esp_id));
                    especialidad_sabado.Items.Add(new Item(especialidad, esp_id));
                }
                dr.Dispose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private int obtenerProfID()
        {
            int prof_id;
            prof_id = -1;
            //
            SqlConnection conn = (new BDConnection()).getConnection();
            string query = "SELECT prof_id FROM DREAM_TEAM.profesional WHERE us_id = "+ us_id +"";
            SqlCommand com = new SqlCommand(query, conn);
            try
            {
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    prof_id = dr.GetInt32(0);
                }
                dr.Dispose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            //
            return prof_id;
        }

        //GENERAR AGENDA MEDICA
        private void button1_Click(object sender, EventArgs e)
        {
            int inicio_hora, inicio_min, fin_hora, fin_min, esp_id, prof_id;
            float TotalHoralSemanal, inicio, fin, diferencia;
            string hora_inicio, hora_fin, desde, hasta;
            TotalHoralSemanal = 0;
            // DATOS HARDCODEADOS
            desde = fecha_desde.Value.Year.ToString() + "-" + fecha_desde.Value.Month.ToString() + "-" + fecha_desde.Value.Day.ToString() + " 00:00:00";
            hasta = fecha_hasta.Value.Year.ToString() + "-" + fecha_hasta.Value.Month.ToString() + "-" + fecha_hasta.Value.Day.ToString() + " 23:59:00";
            prof_id = obtenerProfID();
            //
            string[] fechaEquipo = (ConfigurationManager.AppSettings["FechaGlobal"]).Split('-');
            DateTime fecha_hoy;
            fecha_hoy = new DateTime(int.Parse(fechaEquipo[0]), int.Parse(fechaEquipo[1]), int.Parse(fechaEquipo[2]));
            //
            // Inicio Validacion campos
            int num_dias = (fecha_desde.Value - fecha_hoy).Days;
            if (num_dias < 0)
            {
                MessageBox.Show(String.Format("La/s fecha/s ingresada/s son anteriores al dia presente, {0}",Program.nuevaFechaSistema()));
                return;
            }
            num_dias = (fecha_hasta.Value - fecha_desde.Value).Days;
            if (num_dias < 0)
            {
                MessageBox.Show(String.Format("El intervalo de tiempo de registro de fechas es inválido"));
                return;
            }
            // Lunes
            if (lunes_activar.Checked)
            {
                if (horainicio_hora_lunes.SelectedItem == null || horainicio_min_lunes.SelectedItem == null || horafin_hora_lunes.SelectedItem == null || horafin_min_lunes.SelectedItem == null || especialidad_lunes.SelectedItem == null)
                {
                    MessageBox.Show(String.Format("No ha completado los valores para los dias lunes"));
                    return;
                }
                inicio_hora = int.Parse(horainicio_hora_lunes.SelectedItem.ToString());
                inicio_min = int.Parse(horainicio_min_lunes.SelectedItem.ToString());
                inicio = inicio_hora + ((float)inicio_min / 60);

                fin_hora = int.Parse(horafin_hora_lunes.SelectedItem.ToString());
                fin_min = int.Parse(horafin_min_lunes.SelectedItem.ToString());
                fin = fin_hora + ((float)fin_min / 60);

                diferencia = fin - inicio;
                TotalHoralSemanal += diferencia;
                if (diferencia < 0)
                {
                    MessageBox.Show(String.Format("Por favor, ingrese un intervalo válido de tiempo"));
                    return;
                }
            }
            //
            // Martes
            if (martes_activar.Checked)
            {
                if (horainicio_hora_martes.SelectedItem == null || horainicio_min_martes.SelectedItem == null || horafin_hora_martes.SelectedItem == null || horafin_min_martes.SelectedItem == null || especialidad_martes.SelectedItem == null)
                {
                    MessageBox.Show(String.Format("No ha completado los valores para los dias martes"));
                    return;
                }
                inicio_hora = int.Parse(horainicio_hora_martes.SelectedItem.ToString());
                inicio_min = int.Parse(horainicio_min_martes.SelectedItem.ToString());
                inicio = inicio_hora + ((float)inicio_min / 60);

                fin_hora = int.Parse(horafin_hora_martes.SelectedItem.ToString());
                fin_min = int.Parse(horafin_min_martes.SelectedItem.ToString());
                fin = fin_hora + ((float)fin_min / 60);

                diferencia = fin - inicio;
                TotalHoralSemanal += diferencia;
                if (diferencia < 0)
                {
                    MessageBox.Show(String.Format("Error. Por favor, ingrese un intervalo válido de tiempo"));
                    return;
                }
            }
            //
            // Miercoles
            if (miercoles_activar.Checked)
            {
                if (horainicio_hora_miercoles.SelectedItem == null || horainicio_min_miercoles.SelectedItem == null || horafin_hora_miercoles.SelectedItem == null || horafin_min_miercoles.SelectedItem == null || especialidad_miercoles.SelectedItem == null)
                {
                    MessageBox.Show(String.Format("No ha completado los valores para los dias martes"));
                    return;
                }
                inicio_hora = int.Parse(horainicio_hora_miercoles.SelectedItem.ToString());
                inicio_min = int.Parse(horainicio_min_miercoles.SelectedItem.ToString());
                inicio = inicio_hora + ((float)inicio_min / 60);

                fin_hora = int.Parse(horafin_hora_miercoles.SelectedItem.ToString());
                fin_min = int.Parse(horafin_min_miercoles.SelectedItem.ToString());
                fin = fin_hora + ((float)fin_min / 60);

                diferencia = fin - inicio;
                TotalHoralSemanal += diferencia;
                if (diferencia < 0)
                {
                    MessageBox.Show(String.Format("Error. Por favor, ingrese un intervalo válido de tiempo para los dias miercoles"));
                    return;
                }
            }
            //
            // Jueves
            if (jueves_activar.Checked)
            {
                if (horainicio_hora_jueves.SelectedItem == null || horainicio_min_jueves.SelectedItem == null || horafin_hora_jueves.SelectedItem == null || horafin_min_jueves.SelectedItem == null || especialidad_jueves.SelectedItem == null)
                {
                    MessageBox.Show(String.Format("No ha completado los valores para los dias jueves"));
                    return;
                }
                inicio_hora = int.Parse(horainicio_hora_jueves.SelectedItem.ToString());
                inicio_min = int.Parse(horainicio_min_jueves.SelectedItem.ToString());
                inicio = inicio_hora + ((float)inicio_min / 60);

                fin_hora = int.Parse(horafin_hora_jueves.SelectedItem.ToString());
                fin_min = int.Parse(horafin_min_jueves.SelectedItem.ToString());
                fin = fin_hora + ((float)fin_min / 60);

                diferencia = fin - inicio;
                TotalHoralSemanal += diferencia;
                if (diferencia < 0)
                {
                    MessageBox.Show(String.Format("Error. Por favor, ingrese un intervalo válido de tiempo para los dias jueves"));
                    return;
                }
            }
            //
            // Viernes
            if (viernes_activar.Checked)
            {
                if (horainicio_hora_viernes.SelectedItem == null || horainicio_min_viernes.SelectedItem == null || horafin_hora_viernes.SelectedItem == null || horafin_min_viernes.SelectedItem == null || especialidad_viernes.SelectedItem == null)
                {
                    MessageBox.Show(String.Format("No ha completado los valores para los dias viernes"));
                    return;
                }
                inicio_hora = int.Parse(horainicio_hora_viernes.SelectedItem.ToString());
                inicio_min = int.Parse(horainicio_min_viernes.SelectedItem.ToString());
                inicio = inicio_hora + ((float)inicio_min / 60);

                fin_hora = int.Parse(horafin_hora_viernes.SelectedItem.ToString());
                fin_min = int.Parse(horafin_min_viernes.SelectedItem.ToString());
                fin = fin_hora + ((float)fin_min / 60);

                diferencia = fin - inicio;
                TotalHoralSemanal += diferencia;
                if (diferencia < 0)
                {
                    MessageBox.Show(String.Format("Error. Por favor, ingrese un intervalo válido de tiempo para los viernes"));
                    return;
                }
            }
            //
            // Sabado
            if (sabado_activar.Checked)
            {
                if (horainicio_hora_sabado.SelectedItem == null || horainicio_min_sabado.SelectedItem == null || horafin_hora_sabado.SelectedItem == null || horafin_min_sabado.SelectedItem == null || especialidad_sabado.SelectedItem == null)
                {
                    MessageBox.Show(String.Format("No ha completado los valores para los sabados"));
                    return;
                }
                inicio_hora = int.Parse(horainicio_hora_sabado.SelectedItem.ToString());
                inicio_min = int.Parse(horainicio_min_sabado.SelectedItem.ToString());
                inicio = inicio_hora + (inicio_min / 60);

                fin_hora = int.Parse(horafin_hora_sabado.SelectedItem.ToString());
                fin_min = int.Parse(horafin_min_sabado.SelectedItem.ToString());
                fin = fin_hora + ((float)fin_min / 60);

                diferencia = fin - inicio;
                TotalHoralSemanal += diferencia;
                if (diferencia < 0)
                {
                    MessageBox.Show(String.Format("Por favor, ingrese un intervalo válido de tiempo para los sabados"));
                    return;
                }
            }
            // Fin validacion Campos

            // ¿Trabajo mas de 48 horas?
            if (TotalHoralSemanal > 48)
            {
                MessageBox.Show(String.Format("Las horas ingresadas suman mas de 48. Registro de agenda cancelado."));
                return;
            }
            int minutos_trabajos = (int)(TotalHoralSemanal * 60);

            if(comprobar48horas(prof_id, desde, hasta, minutos_trabajos) == 1){
                return;
            }

            // Inserto en base de datos
            if (lunes_activar.Checked)
            {
                hora_inicio = horainicio_hora_lunes.SelectedItem.ToString() + ":" + horainicio_min_lunes.SelectedItem.ToString();
                hora_fin = horafin_hora_lunes.SelectedItem.ToString() + ":" + horafin_min_lunes.SelectedItem.ToString();
                esp_id = ((Item)especialidad_lunes.SelectedItem).Value;
                uploadAgendaToSQL(esp_id, prof_id,2, hora_inicio, hora_fin, desde, hasta);
            }
            if (martes_activar.Checked)
            {
                hora_inicio = horainicio_hora_martes.SelectedItem.ToString() + ":" + horainicio_min_martes.SelectedItem.ToString();
                hora_fin = horafin_hora_martes.SelectedItem.ToString() + ":" + horafin_min_martes.SelectedItem.ToString();
                esp_id = ((Item)especialidad_martes.SelectedItem).Value;
                uploadAgendaToSQL(esp_id, prof_id,3, hora_inicio, hora_fin, desde, hasta);
            }
            if (miercoles_activar.Checked)
            {
                hora_inicio = horainicio_hora_miercoles.SelectedItem.ToString() + ":" + horainicio_min_miercoles.SelectedItem.ToString();
                hora_fin = horafin_hora_miercoles.SelectedItem.ToString() + ":" + horafin_min_miercoles.SelectedItem.ToString();
                esp_id = ((Item)especialidad_miercoles.SelectedItem).Value;
                uploadAgendaToSQL(esp_id, prof_id,4, hora_inicio, hora_fin, desde, hasta);
            }
            if (jueves_activar.Checked)
            {
                hora_inicio = horainicio_hora_jueves.SelectedItem.ToString() + ":" + horainicio_min_jueves.SelectedItem.ToString();
                hora_fin = horafin_hora_jueves.SelectedItem.ToString() + ":" + horafin_min_jueves.SelectedItem.ToString();
                esp_id = ((Item)especialidad_jueves.SelectedItem).Value;
                uploadAgendaToSQL(esp_id, prof_id,5, hora_inicio, hora_fin, desde, hasta);
            }
            if (viernes_activar.Checked)
            {
                hora_inicio = horainicio_hora_viernes.SelectedItem.ToString() + ":" + horainicio_min_viernes.SelectedItem.ToString();
                hora_fin = horafin_hora_viernes.SelectedItem.ToString() + ":" + horafin_min_viernes.SelectedItem.ToString();
                esp_id = ((Item)especialidad_viernes.SelectedItem).Value;
                uploadAgendaToSQL(esp_id, prof_id,6, hora_inicio, hora_fin, desde, hasta);
            }
            if (sabado_activar.Checked)
            {
                hora_inicio = horainicio_hora_sabado.SelectedItem.ToString() + ":" + horainicio_min_sabado.SelectedItem.ToString();
                hora_fin = horafin_hora_sabado.SelectedItem.ToString() + ":" + horafin_min_sabado.SelectedItem.ToString();
                esp_id = ((Item)especialidad_sabado.SelectedItem).Value;
                uploadAgendaToSQL(esp_id, prof_id,7, hora_inicio, hora_fin, desde, hasta);
            }
            return;
        }


        private static int comprobar48horas(int prof_id, string desde, string hasta, int minutos_trabajos){
            try
            {
                string query = "DREAM_TEAM.comprobar48horas";
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@id", prof_id);
                com.Parameters.AddWithValue("@desde", desde);
                com.Parameters.AddWithValue("@hasta", hasta);
                com.Parameters.AddWithValue("@minutos_trabajados", minutos_trabajos);
                com.ExecuteNonQuery();
                com.Dispose();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 1;

            }
            return 0;
        }

        // INSERTAR EL INTERVALO DE TIEMPO DE ATENCION EN EL SQL
        private static void uploadAgendaToSQL(int esp_id, int prof_id, int dia,string hora_inicio, string hora_fin, string desde, string hasta)
        {
            try
            {
                string query = "DREAM_TEAM.addHorasAgenda";
                SqlConnection conn = (new BDConnection()).getInstance();
                SqlCommand com = new SqlCommand(query, conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@id", prof_id);
                com.Parameters.AddWithValue("@desde", desde);
                com.Parameters.AddWithValue("@hasta", hasta);
                com.Parameters.AddWithValue("@dia", dia);
                com.Parameters.AddWithValue("@hora_inicio", hora_inicio);
                com.Parameters.AddWithValue("@hora_fin", hora_fin);
                com.Parameters.AddWithValue("@especialidad", esp_id);
                com.ExecuteNonQuery();
                com.Dispose();
                CultureInfo espaniol = new CultureInfo("es-AR");
                string nombreDia = espaniol.DateTimeFormat.DayNames[dia-1];
                MessageBox.Show(String.Format("Los horarios los dias {0} se han ingresado correctamente.",nombreDia),Application.ProductName,MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
            catch (Exception e)
            {
                CultureInfo espaniol = new CultureInfo("es-AR");
                string nombreDia = espaniol.DateTimeFormat.DayNames[dia-1];
                MessageBox.Show(String.Format(e.Message + nombreDia), Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Registrar_agenda_Load(object sender, EventArgs e)
        {

        }
    }
}
