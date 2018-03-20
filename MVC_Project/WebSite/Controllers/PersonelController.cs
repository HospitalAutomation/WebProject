using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSite.Controllers
{
    public class PersonelController : Controller
    {
        // GET: Personel
        public ActionResult Login()
        {
            return View();
        }
    }
}