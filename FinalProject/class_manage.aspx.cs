using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class class_manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
            //Response.Write("<script language=javascript>        $('#popupLogin').dialog('open');prompt('hello');</script>");
            if (Page.IsPostBack) {

            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
           
        }

        protected void ButtonInsertClass_Click(object sender, EventArgs e)
        {
           
        }

        protected void TextBoxClassTeacher_TextChanged(object sender, EventArgs e)
        {

        }
    }
}