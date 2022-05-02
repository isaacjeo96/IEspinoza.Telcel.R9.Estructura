using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Telcel.R9.Estructura.Negocio
{
    public class Departamento
    {
        public int IdDepartamento { get; set; }
        public string Descripcion { get; set; }
        public List<object> Departamentos { get; set; }
    }
}
