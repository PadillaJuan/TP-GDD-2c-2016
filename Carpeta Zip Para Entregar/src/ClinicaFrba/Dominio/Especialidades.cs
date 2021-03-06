﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba
{
    // CLASE PARA LAS ESPECIALIDADES UTILIZADA EN PEDIR_TURNO
    class Especialidades
    {
        int id;
        Form FormAsociado;

        public Especialidades(int identifyer, string descripcion, Form elFormCaracteristico)
        {
            this.id = identifyer;
            this.Descripcion = descripcion;
            FormAsociado = elFormCaracteristico;
        }

        public string Descripcion { get; set; }

        public Form getFormAsociado()
        {
            return FormAsociado;
        }

        public override string ToString()
        {
            return Descripcion;
        }
    }
}
