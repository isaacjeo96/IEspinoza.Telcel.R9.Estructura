using Microsoft.AspNetCore.Mvc;

namespace Telcel.R9.Estructura.Presentacion.Controllers
{
    public class EmpleadoController : Controller
    {
        [HttpGet]
        public ActionResult GetAll()
        {
            Negocio.Empleado empleado = new Negocio.Empleado();
            Negocio.Result result = Negocio.Empleado.GetAll();
    

            if (result.Correct)
            {
                empleado.Empleados = result.Objects.ToList();
                return View(empleado);
            }
            else
            {
                ViewBag.Message = "Ocurrió un error al obtener la información" + result.ErrorMessage;
                return PartialView("ValidationModal");
            }

        }

        [HttpGet]
        public ActionResult GetAll(Negocio.Empleado empleado)
        {
            //empleado.ApellidoPaterno 
            Negocio.Result result = Negocio.Empleado.GetAll(empleado);

            //Negocio.Empleado empleado = new Negocio.Empleado();
            if (result.Correct)
            {
                empleado.Empleados = result.Objects.ToList();
                return View(empleado);
            }
            else
            {
                ViewBag.Message = "Ocurrió un error al obtener la información" + result.ErrorMessage;
                return PartialView("ValidationModal");
            }

        }

        //[HttpGet]
        //public ActionResult Form(int? EmpleadoID)
        //{
        //    Negocio.Empleado empleado = new Negocio.Empleado();

        //    Negocio.Result resultPuesto = AccesoDatos.Puesto.GetAll();
        //    Negocio.Result resultDepto = AccesoDatos.Departamento.GetAll();


        //    if (EmpleadoID == null)
        //    {
        //        return View(empleado);
        //    }

        //    else
        //    {
        //        Negocio.Result = AccesoDatos.Empleado.GetById(EmpleadoID.Value);
        //    }




        //}

        //[HttpPost]

        //public ActionResult Form(Negocio.Empleado empleado)
        //{
        //    Negocio.Result result = new Negocio.Result();

        //    if (empleado.EmpleadoID == 0)
        //    {
        //        result = AccesoDatos.Empleado.Add(empleado);

        //        if (result.Correct)
        //        {
        //            ViewBag.Message = "Empleado agregado correctamente";
        //        }
        //    }
        //    else
        //    {
        //        result = AccesoDatos.Empleado.Update(empleado);
        //        if (result.Correct)
        //        {
        //            ViewBag.Message = "Empleado actualizado correctamente";
        //        }
        //    }

        //    if (!result.Correct)
        //    {
        //        ViewBag.Message = "No se pudo agregar correctamente el empleado " + result.ErrorMessage;
        //    }

        //    return PartialView("ValidationModal");
        //}
    }
}
