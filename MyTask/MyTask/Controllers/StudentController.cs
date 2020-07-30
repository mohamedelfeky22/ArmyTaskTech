using MyTask.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MyTask.Controllers
{
    public class StudentController : Controller
    {
        // define DB Context object
        ArmyTechTaskEntities db = new ArmyTechTaskEntities();

        // GET: All Students
        public ActionResult Index()
        {
            var students = db.Student.Include(i => i.Governorate).Include(i => i.Neighborhood).Include(i => i.Field).ToList();
            return View(students);
        }

        // GET : Neighborhoods based on selected item from DropDownList of governorate
        public JsonResult GetNeighborhoodList(int GovernorateId)
        {
            db.Configuration.ProxyCreationEnabled = false;
           List<Neighborhood> neighborhoods = db.Neighborhood.Where(a => a.GovernorateId == GovernorateId).ToList();
            return Json(neighborhoods, JsonRequestBehavior.AllowGet);
        }

        // GET :  Create page
        public ActionResult Create()
        {
            ViewBag.GovernorateId = new SelectList(db.Governorate, "ID", "Name");
            ViewBag.NeighborhoodId = new SelectList(db.Neighborhood, "ID", "Name");
            ViewBag.FieldId = new SelectList(db.Field, "ID", "Name");
            return View();
        }

        // Post: Student which was been created
        [HttpPost]
        public ActionResult Create(Student student)
        {
            var date = Request["Birthdate"];
            student.BirthDate = DateTime.Parse(date);
            ViewBag.GovernorateId = new SelectList(db.Governorate, "ID", "Name", student.GovernorateId);
            ViewBag.NeighborhoodId = new SelectList(db.Neighborhood.ToList(), "ID", "Name");
            ViewBag.FieldId = new SelectList(db.Field, "ID", "Name", student.FieldId);
            if (ModelState.IsValid)
            {
                 db.Student.Add(student);
                 db.SaveChanges();
               return RedirectToAction("Index");
            }
            
            return View(student);
        }

        // GET : Student for edit
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Student.SingleOrDefault(a => a.ID == id);
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.GovernorateId = new SelectList(db.Governorate, "ID", "Name", student.GovernorateId);
            ViewBag.NeighborhoodId = new SelectList(db.Neighborhood.ToList(), "ID", "Name");
            ViewBag.FieldId = new SelectList(db.Field, "ID", "Name", student.FieldId);
            return View(student);
        }

        // POST : the Updated data of student
        [HttpPost]
        public ActionResult Edit(Student student)
        {
            ViewBag.GovernorateId = new SelectList(db.Governorate, "ID", "Name", student.GovernorateId);
            ViewBag.NeighborhoodId = new SelectList(db.Neighborhood, "ID", "Name", student.NeighborhoodId);
            ViewBag.FieldId = new SelectList(db.Field, "ID", "Name", student.FieldId);
            var date = Request["Birthdate"];
            student.BirthDate = DateTime.Parse(date);
            if (ModelState.IsValid)
            {
                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(student);
        }

        public ActionResult Delete(int id)
        {
            Student student = db.Student.SingleOrDefault(a => a.ID == id);

            if (student == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Student.Remove(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
           
        }
    }
}