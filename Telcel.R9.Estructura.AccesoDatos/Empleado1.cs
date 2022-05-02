using System;
using System.Collections.Generic;

namespace Telcel.R9.Estructura.AccesoDatos
{
    public partial class Empleado1
    {
        public int IdEmpleado { get; set; }
        public string? Nombre { get; set; }
        public string? ApellidoPaterno { get; set; }
        public string? ApellidoMaterno { get; set; }
        public int IdPuesto { get; set; }
        public string? Puesto { get; set; }
        public int IdDepartamento { get; set; }
        public string? Departamento { get; set; }
    }
}
