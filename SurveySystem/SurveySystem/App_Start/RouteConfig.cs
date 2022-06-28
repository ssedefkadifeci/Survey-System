using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SurveySystem
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Login",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Login", id = UrlParameter.Optional }
           );


            routes.MapRoute(
            name: "StudentRegister",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "StudentRegister", id = UrlParameter.Optional }
            );

            routes.MapRoute(
            name: "Survey",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "Survey", id = UrlParameter.Optional }
            );

            routes.MapRoute(
            name: "SurveyStart",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "SurveyStart", id = UrlParameter.Optional }
             );

            routes.MapRoute(
             name: "EndSurvey",
             url: "{controller}/{action}/{id}",
             defaults: new { controller = "Home", action = "EndSurvey", id = UrlParameter.Optional }
             );

            routes.MapRoute(
            name: "DashBoard",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "DashBoard", id = UrlParameter.Optional }
           );

            routes.MapRoute(
           name: "AddQuestion",
           url: "{controller}/{action}/{id}",
           defaults: new { controller = "Home", action = "AddQuestion", id = UrlParameter.Optional }
          );

            routes.MapRoute(
          name: "AddCategory",
          url: "{controller}/{action}/{id}",
          defaults: new { controller = "Home", action = "AddCategory", id = UrlParameter.Optional }
         );

        }
    }
 }

