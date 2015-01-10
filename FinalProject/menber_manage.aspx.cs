using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int index = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
           // Response.Write(ViewState["index"]);
            //Page.EnableEventValidation = false;
            if (Page.IsPostBack) {
                MultiView1.ActiveViewIndex = Convert.ToInt32( Session["index"]  );
            }
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect(Request.RawUrl);
            
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Session["index"] = 1;
            //Response.Redirect("menber_manage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Session["index"] = 0;
            Response.Redirect("menber_manage.aspx");
        }

        protected void DetailsView1_PageIndexChanging1(object sender, DetailsViewPageEventArgs e)
        {
           
        }
    }
}