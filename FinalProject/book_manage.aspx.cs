using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FinalProject
{
    public partial class book_manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
            if (Request.QueryString["book"] == null)
            {
                Panel1.Visible = true;
               // Panel2.Visible = false;
                //DetailsViewMode a = new DetailsViewMode();
               
            }
            else {
                SqlDataSource2.Dispose();
                DetailsView1.Dispose();
                Panel1.Visible = false;
                //Panel2.Visible = true;
            }
            //Response.Write(Session["a"]);
        }

        protected void DetailsView2_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            //Session["a"]=(SqlDataSource4.UpdateCommand);
        }
    }
}