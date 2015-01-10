using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FinalProject
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Panel1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            if (Page.IsValid) {


                string sqlcomn = "SELECT STU_NUM,STU_NAME, STU_ACT, STU_PWD,STU_LEVEL FROM STUDENT WHERE  STU_ACT= '" + TextBoxAct.Text + "' AND STU_PWD = '" + TextBoxPwd.Text + "';";
                string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlDataSource sql = new SqlDataSource(connectionString, sqlcomn);
                DataView dt = (DataView)sql.Select(new DataSourceSelectArguments());
                LiteralError.Text = dt.Table.Rows.Count.ToString();
                if (dt.Table.Rows.Count > 0)
                {
                    Session["user"] = dt[0]["STU_NUM"];
                    Session["username"] = dt[0]["STU_NAME"];
                    Session["userlevel"] = dt[0]["STU_LEVEL"];
                    
                    Response.Redirect("default.aspx");
                }
                else {
                    LiteralError.Text = "帳號密碼錯誤";
                }
            
            }
        }
    }
}