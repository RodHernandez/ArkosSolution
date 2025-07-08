using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ArkosWebApplication
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // INSERTAR TODAS LAS RUTAS DESPUÉS DE ESTA LÍNEA

            routes.MapPageRoute(
                "Inicio",
                "Inicio",
                "~/WebForms/Website/Home.aspx",
                true, null,
                new RouteValueDictionary { { "outgoing", new ContainersRouteConstraint() } }
            );

            routes.MapPageRoute(
                "Contacto",
                "Contacto",
                "~/WebForms/Website/Contact.aspx",
                true, null,
                new RouteValueDictionary { { "outgoing", new ContainersRouteConstraint() } }
            );

            routes.MapPageRoute(
                "Empleado",
                "Empleado",
                "~/WebForms/Empleado/Principal.aspx",
                true, null,
                new RouteValueDictionary { { "outgoing", new ContainersRouteConstraint() } }
            );

            routes.MapPageRoute(
                "Cliente",
                "Cliente",
                "~/WebForms/Cliente/Principal.aspx",
                true, null,
                new RouteValueDictionary { { "outgoing", new ContainersRouteConstraint() } }
            );

            routes.MapPageRoute(
               "Proveedor",
               "Proveedor",
               "~/WebForms/Proveedor/Principal.aspx",
               true, null,
               new RouteValueDictionary { { "outgoing", new ContainersRouteConstraint() } }
           );

            // INSERTAR RUTAS DESE BASE DE DATOS

            routes.MapPageRoute(
               "AdministrarItem",
               "AdministrarItem",
               "~/WebForms/Empleado/Items/AdministrarItem.aspx",
               true, null,
               new RouteValueDictionary { { "outgoing", new ContainersRouteConstraint() } }
           );


            // INSERTAR TODAS LAS RUTAS ANTES DE ESTA LÍNEA

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }

    public class ContainersRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            return routeDirection == RouteDirection.IncomingRequest;
        }
    }

}
