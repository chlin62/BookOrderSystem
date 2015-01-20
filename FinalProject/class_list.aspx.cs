using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;


namespace FinalProject
{
    public partial class class_list : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
            if (Request["class"] == null)
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                DataView dt = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());

                //LiteralClassList.Text = dt.Count.ToString();
                string tr_str = "";
                for (int i = 0; i < dt.Count; i++)
                {
                    tr_str += "<tr><td><a href='/class_list.aspx?class=" + dt[i][0].ToString() + "'>" + dt[i][1].ToString() + "</a></td><td>" + dt[i][2].ToString() + "</td></tr>";

                }
                LiteralClassList.Text = tr_str;
                
            }
            else {
                Panel2.Visible = true;
                Panel1.Visible = false;
                string sqlcomn = "select * from ClassContent where cls_num = " + Request["class"];
                string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlDataSource sql = new SqlDataSource(connectionString,sqlcomn);
                DataView dt = (DataView)sql.Select(new DataSourceSelectArguments());
                //GridView1.DataSource = sql;
                if (dt.Count == 0)
                {
                    string sqlcomn2 = "select * from Class where cls_num = " + Request["class"];
                    string connectionString2 = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                    SqlDataSource sql2 = new SqlDataSource(connectionString, sqlcomn2);
                    dt = (DataView)sql2.Select(new DataSourceSelectArguments());

                    LiteralClassName.Text = dt[0]["CLS_NAME"].ToString();
                    LiteralClassTeacher.Text = dt[0]["CLS_TEACHER"].ToString();
                    LiteralBookContent.Text = "本課程尚未設定教科書";
                    ButtonBuy.Visible = false;
                }
                else
                {
                    LiteralClassName.Text = dt[0]["CLS_NAME"].ToString();
                    LiteralClassTeacher.Text = dt[0]["CLS_TEACHER"].ToString();
                    string bookcontent = "<br/>";
                    Image1.ImageUrl = "/images/" + dt[0]["B_IMG"] + ".jpg";
                    bookcontent += "書籍名稱: " + dt[0]["B_NAME"] + "</br>";
                    bookcontent += "書籍作者: " + dt[0]["B_AUTHOR"] + "</br>";
                    bookcontent += "書籍價格: " + dt[0]["B_PRICE"] + "</br>";
                    bookcontent += "書籍ISBN: " + dt[0]["B_ISBN"] + "</br>";
                    bookcontent += "書籍簡介: " + dt[0]["B_CONTENT"] + "</br>";
                    Session["BuyBook"] = dt[0]["B_ID"];
                    string sqlcomnSelect = "select count(*) from line where STU_NUM = '" + Session["user"] + "' and B_ID ='" + dt[0]["B_ID"] + "';";
                    string connectionStringSel = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                    SqlDataSource sql2 = new SqlDataSource(connectionString, sqlcomnSelect);
                    DataView dt2 = (DataView)sql2.Select(new DataSourceSelectArguments());
                    if (Convert.ToBoolean(dt[0]["B_STATE"]) == true)
                    {
                        PanelButton.Visible = false;
                        PanelBuyed.Visible = false;
                        PanelTimeOut.Visible = true;

                    }
                    else if (Convert.ToInt16(dt2[0][0]) > 0)
                    {
                        PanelButton.Visible = false;
                        PanelBuyed.Visible = true;
                        PanelTimeOut.Visible = false;

                    }
                    else
                    {
                        PanelButton.Visible = true;
                        PanelBuyed.Visible = false;
                        PanelTimeOut.Visible = false;
                    }

                    LiteralBookContent.Text = bookcontent;

                }

            }

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlcomn = "insert into line(STU_NUM,B_ID) values('" + Session["user"]+"','"+ Session["BuyBook"]+"');";
            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlDataSource sql = new SqlDataSource(connectionString, sqlcomn);
            //DataView dt = (DataView)sql.Select(new DataSourceSelectArguments());
            sql.InsertCommand = sqlcomn;
            
            sql.Insert();

            Response.Redirect("class_list.aspx?class="+Request["class"]);
        }
    }
}