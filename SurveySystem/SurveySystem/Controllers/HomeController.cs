using SurveySystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SurveySystem.Controllers
{
    public class HomeController : Controller
    {
        DBSurveySystemEntities db = new DBSurveySystemEntities();
        [HttpGet]


        public ActionResult StudentRegister()
        {
            return View();
        }
        [HttpPost]

        public ActionResult StudentRegister(TBL_STUDENT svw)
        {
            try
            {
                TBL_STUDENT s = new TBL_STUDENT();
                s.S_NAME = svw.S_NAME;
                s.S_EMAIL = svw.S_EMAIL;
                db.TBL_STUDENT.Add(s);
                db.SaveChanges();
            }
            catch (Exception)
            {
                ViewBag.msg = "Data Could not be inserted...";
            }
            return View();
        }


        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();

            return RedirectToAction("Index");
        }
        public ActionResult Index()
        {
            if (Session["AD_ID"] != null)
            {
                return RedirectToAction("DashBoard");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Login(TBL_ADMIN a)
        {
            TBL_ADMIN ad = db.TBL_ADMIN.Where(x => x.AD_NAME == a.AD_NAME && x.AD_PASSWORD == a.AD_PASSWORD).SingleOrDefault();
            if (ad != null)
            {
                Session["AD_ID"] = ad.AD_ID;
                return RedirectToAction("DashBoard");
            }
            else
            {
                ViewBag.msg = "Invalid username or password";
            }

            return View();
        }

        public ActionResult Survey()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Survey(string room)
        {
            List<tbl_category> list = db.tbl_category.ToList();
            TempData["score"] = 0;
            foreach (var item in list)
            {

                if (item.cat_encyptedstring == room)
                {

                    List<TBL_QUESTIONS> li = db.TBL_QUESTIONS.Where(x => x.q_fk_catid == item.cat_id).ToList();
                    Queue<TBL_QUESTIONS> queue = new Queue<TBL_QUESTIONS>();

                    foreach(TBL_QUESTIONS a in li)
                    {
                        queue.Enqueue(a);

                    }
                    TempData["surveyid"] = item.cat_id;
                    TempData["questions"] = queue;
                    TempData["score"] = 0;
                    TempData.Keep();

                    return RedirectToAction("SurveyStart");
                }
                else
                {
                    ViewBag.error = "No Room Found....";
                }
            }
            return View();
        }
        public ActionResult viewAllquestions(int?id)

        {
            if(Session["AD_ID"] == null)
            {
                return RedirectToAction("Login");
            }
            if(id == null)
            {
                return RedirectToAction("DashBoard");
            }
            return View(db.TBL_QUESTIONS.Where(x => x.q_fk_catid == id).ToList());
        }

            public ActionResult SurveyStart()
        {
            if(TempData["questions"] == null)
            {
                return RedirectToAction("Survey");
            }

            TempData.Keep();

            TBL_QUESTIONS q = null;

            if (TempData["questions"] != null)
            {
                Queue<TBL_QUESTIONS> qlist = (Queue<TBL_QUESTIONS>)TempData["questions"];

                if(qlist.Count>0)
                {
                    q = qlist.Peek();
                    qlist.Dequeue();
                    TempData["questions"] = qlist;
                    TempData.Keep();

                }
                else
                {
                    return RedirectToAction("EndSurvey");
                }
            }
            return View();
        }

        [HttpPost]
        public ActionResult SurveyStart(TBL_QUESTIONS q)
        {

            string correctanswer = null;


            if (q.OPA != null)
            {
                correctanswer = "A";
            }
            else if (q.OPB != null)
            {
                correctanswer = "B";
            }
            else if (q.OPC != null)
            {
                correctanswer = "C";
            }
            else if (q.OPD != null)
            {

                correctanswer = "D";
            }

            if(correctanswer.Equals(q.COP))
            {
                TempData["score"] = Convert.ToInt32(TempData["score"]) + 1;
            }

            TempData.Keep();


                return RedirectToAction("SurveyStart");
            }
               
           
        public ActionResult EndSurvey()
        {


            return View();

         }


        public ActionResult DashBoard()
        {
            //if (Session["AD_ID"] == null)
            //{
            //    return RedirectToAction("DashBoard");
            //}

            return View();
        }

        [HttpGet]
        public ActionResult AddCategory()
        {
    
            Session["AD_ID"] = 1; //we will remove it soon..
            int adid = Convert.ToInt32(Session["AD_ID"].ToString());
            List<tbl_category> li = db.tbl_category.Where(x => x.cat_fk_adid == adid).OrderByDescending(x => x.cat_id).ToList();
            ViewData["list"] = li;

            return View();
        }

        public ActionResult SurveyEnd()
        {




            return View();
        }


        [HttpPost]
        public ActionResult AddCategory(tbl_category cat)
        {

            List<tbl_category> li = db.tbl_category.OrderByDescending(x => x.cat_id).ToList();
            ViewData["list"] = li;

            Random r = new Random();
            tbl_category c = new tbl_category();
            c.cat_name = cat.cat_name;
            c.cat_encyptedstring = cyptop.Encrypt(cat.cat_name.Trim() + r.Next().ToString(), true);
            c.cat_fk_adid = Convert.ToInt32(Session["AD_ID"].ToString());
            db.tbl_category.Add(c);
            db.SaveChanges();


            return RedirectToAction("AddCategory");
        }

        [HttpGet]
        public ActionResult AddQuestion()
        {
            int session_id = Convert.ToInt32(Session["AD_ID"]);
            List<tbl_category> li = db.tbl_category.Where(X => X.cat_fk_adid == session_id).ToList();
            ViewBag.list = new SelectList(li, "cat_id", "cat_name");
            return View();
        }


        [HttpPost]

        public ActionResult AddQuestion(TBL_QUESTIONS q)
        {
            int session_id = Convert.ToInt32(Session["AD_ID"]);
            List<tbl_category> li = db.tbl_category.Where(X => X.cat_id == session_id).ToList();
            ViewBag.list = new SelectList(li, "cat_id", "cat_name");

            TBL_QUESTIONS QA = new TBL_QUESTIONS();

            QA.Q_TEXT = q.Q_TEXT;
            QA.OPA = q.OPA;
            QA.OPB = q.OPB;
            QA.OPC = q.OPC;
            QA.OPD = q.OPD;
            QA.COP = q.COP;
            QA.q_fk_catid = q.q_fk_catid;


            db.TBL_QUESTIONS.Add(QA);
            db.SaveChanges();
            TempData["msg"] = "Question added succesfully.";
            TempData.Keep();
            return RedirectToAction("AddQuestion");
        }


        public ActionResult About()
        {

            ViewBag.Message = "Your application description page. ";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact  page. ";
            return View();
        }
    }
}
