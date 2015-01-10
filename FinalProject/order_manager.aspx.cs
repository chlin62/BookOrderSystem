using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FinalProject
{
    public partial class order_manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionClasscs.SessionStart();
            SessionClasscs.IsManager((PlaceHolder)Master.FindControl("PlaceHolder1"));
            if (Request["B_ID"] == null)
            {
                PanelOrderList.Visible = false;
                PanelBookList.Visible = true;
                DataView dt = (DataView)SqlDataSourceBookList.Select(new DataSourceSelectArguments());
                for (int i = 0; i < dt.Count; i++) {
                    TableCell tcName = new TableCell();
                    tcName.Text = "<a href='order_manager.aspx?B_ID="+dt[i]["B_ID"]+"'>"+dt[i]["B_NAME"].ToString()+"</a>";
                    TableCell tcClass = new TableCell();
                    tcClass.Text = dt[i]["CLS_NAME"].ToString();

                    TableRow tr = new TableRow();
                    tr.Cells.Add(tcName);
                    tr.Cells.Add(tcClass);
                    TableBookList.Rows.Add(tr);

                }
            }
            else
            {//DELETE FROM LINE WHERE (B_ID = @B_ID) AND (STU_NUM = @STU_NUM)
                PanelOrderList.Visible = true;
                PanelBookList.Visible = false;
                if (Request["ID"] != null) {
                    SqlDataSource sql = new SqlDataSource(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString(), "");
                    sql.DeleteCommand = "DELETE FROM LINE WHERE (B_ID = '" + Request["B_ID"] + "') AND (STU_NUM = " + Request["ID"] + ")";
                    sql.Delete();
                    Response.Redirect("order_manager.aspx?B_ID=" + Request["B_ID"]);
                }
                DataView dt = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
                if (dt.Count == 0)
                {
                    LabelSumPrice.Text = "目前沒有人訂喔";
                    TableOrderList.Visible = false;
                }
                else
                {
                    TableOrderList.Visible = true;
                    LiteralClassName.Text = dt[0]["B_NAME"].ToString();
                    int sumPrice = 0;
                    for (int i = 0; i < dt.Count; i++)
                    {

                        TableCell tcPrice = new TableCell();
                        tcPrice.Text = dt[i]["B_PRICE"].ToString();
                        TableCell tcUser = new TableCell();
                        tcUser.Text = dt[i]["STU_NAME"].ToString();
                        TableCell tcDel = new TableCell();
                        tcDel.Text = "<a href='order_manager.aspx?B_ID=" + Request["B_ID"] + "&ID=" + dt[i]["STU_NUM"] + "'> 刪除</a>";


                        TableRow tr = new TableRow();

                        tr.Cells.Add(tcPrice);
                        tr.Cells.Add(tcUser);
                        tr.Cells.Add(tcDel);

                        TableOrderList.Rows.Add(tr);
                        sumPrice += Convert.ToInt32(dt[i]["B_PRICE"]);


                    }
                    LabelSumPrice.Text = "總金額為:" + sumPrice;
                }
            }
        }
    }
}