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
    public partial class myOrder_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
            if (Request["STU_NUM"] != null && Request["B_ID"] != null) {
                SqlDataSource SqlDataSourceSelectBook = new SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString(), "SELECT [B_STATE] FROM [BOOK] WHERE [B_ID] = -1" );
                SqlDataSourceSelectBook.DeleteCommand="delete from line where STU_NUM = "+Request["STU_NUM"]+" AND B_ID = "+Request["B_ID"]+";";
                SqlDataSourceSelectBook.Delete();
            }
            DataView dt = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            int sumPrice = 0;
            for (int i = 0; i < dt.Count; i++) {
                TableRow tr = new TableRow();
                TableCell tcName = new TableCell();
                TableCell tcPrice = new TableCell();
                TableCell tcDel = new TableCell();
                tcName.Text = dt[i]["B_NAME"].ToString();
                tcPrice.Text = dt[i]["B_PRICE"].ToString();
                SqlDataSource SqlDataSourceSelectBook = new SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString(), "SELECT [B_STATE] FROM [BOOK] WHERE [B_ID] = " + dt[i]["B_ID"]);
                DataView dtBook = (DataView)SqlDataSourceSelectBook.Select(new DataSourceSelectArguments());
                if (dtBook.Count >=0 )
                {
                    if (Convert.ToBoolean(dtBook[0]["B_STATE"]) == false)
                        tcDel.Text = "<a href='myOrder_list.aspx?STU_NUM=" + Session["user"] + "&B_ID=" + dt[i]["B_ID"] + "'>刪除</a>";
                    else
                        tcDel.Text = "結單";
                }
                    tr.Cells.Add(tcName);
                    tr.Cells.Add(tcPrice);
                    tr.Cells.Add(tcDel);
                    Table1.Rows.Add(tr);
                    sumPrice += Convert.ToInt32(tcPrice.Text);
            }

            LabelPrice.Text = "您本學期書錢共為:"+sumPrice;

        }
    }
}