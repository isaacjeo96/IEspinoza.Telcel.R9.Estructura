using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Telcel.R9.Estructura.Negocio
{
    public class Empleado
    {
        public int IdEmpleado { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string  ApellidoMaterno { get; set; }
        public Puesto Puesto { get; set; }
        public Departamento Departamento { get; set; }
        public List<object> Empleados { get; set; }
    }
}
