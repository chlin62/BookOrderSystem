using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FinalProject
{
    public partial class myAct_manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
            DataView dt = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            Label2.Text = dt[0]["STU_NAME"].ToString();
            Label1.Text = dt[0]["STU_ACT"].ToString();
            PanelError.Visible =true;
            if (Page.IsPostBack) {

                LabelError.Text = "";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LabelError.Text = "";
            if (Page.IsValid)
            {
                SqlDataSource sql = new SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString(), "SELECT count(*) from student where STU_NUM = '"+Session["user"]+"' and STU_PWD = '"+TextBoxOldPwd.Text+"';");
                 DataView dt = (DataView)sql.Select(new DataSourceSelectArguments());
                 if (Convert.ToInt32(dt[0][0]) == 0)
                 {
                     LabelError.Text = "您輸入的帳號密碼有錯!";
                 }
                 else {
                     sql.UpdateCommand = "UPDATE [STUDENT] SET  [STU_PWD] = '"+TextBoxNewPwd.Text+"' WHERE [STU_NUM] = "+Session["user"];
                     sql.Update();
                     LabelError.Text = "更改成功!";
                 }



            }
            
        }
    }
}