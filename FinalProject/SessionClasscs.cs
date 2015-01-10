using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace FinalProject
{
    public class SessionClasscs
    {
        public static void SessionStart(){
            if (System.Web.HttpContext.Current.Session["user"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("login.aspx");
            }
           
        }
        public static void IsManager(PlaceHolder mainPH)
        {  
            if (Convert.ToInt32(System.Web.HttpContext.Current.Session["userlevel"]) == 1)
            {
                mainPH.Visible = true;
            }
        }
    }
}