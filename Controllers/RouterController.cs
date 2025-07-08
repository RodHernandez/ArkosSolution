using ArkosWebApplication.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ArkosWebApplication.Controllers
{
    public class RouterController : Controller
    {
        // GET: Router
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RouteProfile(string returnUrl)
        {
            using (ApplicationDbContext context = new ApplicationDbContext())
            {
                ApplicationUser user = context.Users.FirstOrDefault<ApplicationUser>(u => u.UserName.Equals(User.Identity.Name));
                if (user != null)
                {
                    // CARGAR USUARIO EN SESIÓN

                    string idUsuario = User.Identity.GetUserId();

                    // REDIRECCIONAR A PÁGINA PRINCIPAL SEGÚN EL ROL

                    if (User.IsInRole("Superusuario"))
                    {
                        return Redirect("~/Superusuario");
                    }
                    else if (User.IsInRole("Administrador"))
                    {
                        return Redirect("~/Administrador");
                    }
                    else if (User.IsInRole("Empleado"))
                    {
                        // CONSULTAR DETALLES DE TABLA EMPLEADO

                        user.Empresas = new List<string>()
                        {
                            "DÉDALO",
                            "DECKEL"
                        };

                        return Redirect("~/Empleado");
                    }
                    else if (User.IsInRole("Cliente"))
                    {
                        // CONSULTAR DETALLES DE TABLA CLIENTE

                        return Redirect("~/Cliente");
                    }
                    else if (User.IsInRole("Proveedor"))
                    {
                        // CONSULTAR DETALLES DE TABLA PROVEEDOR

                        return Redirect("~/Proveedor");
                    }

                    return RedirectToAction("Login", "Account"); // SESSION ABANDON

                }
                else
                {
                    Session.Clear();
                    Session.Abandon();
                    Response.Cookies.Clear();
                    Response.Redirect("~/Account/Login");
                }

            }

            return View();
        }
    }
}