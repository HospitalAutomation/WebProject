using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSite.Models;

namespace WebSite.Controllers
{
    public class HastaController : Controller
    {
        HastaneDBEntities db = new HastaneDBEntities();
        // GET: Hasta
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "hastaID,AD,SOYAD,ŞİFRE,ADRES,TELEFON,TC,DOĞUM_TARİHİ,CİNSİYET,kayıtTarihi")] hastalar hastalar)
        {
            if (ModelState.IsValid)
            {
                hastalar.kayıtTarihi = DateTime.Now;
                db.hastalars.Add(hastalar);
                db.SaveChanges();
                return RedirectToAction("Login", "Hasta");
            }

            return View(hastalar);
        }
    }
}