using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public class Model
    {
        static string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

        public  DataView query(String sqlcommd)
        {
            SqlDataSource sql = new SqlDataSource(connectionString, sqlcommd);
            DataView dt = (DataView)sql.Select(new DataSourceSelectArguments());
            return dt;
        }
        public Boolean insert(String tableName, String attr, String insertEle)
        {
            string insertCommd = "insert into "+tableName+" ( "+attr+" ) values( "+insertEle+" );";
            string[] attrs = attr.Split(',');
            string[] elemts = attr.Split(',');
            string selectCommd = "select * from "+tableName+" where "+attrs[0]+" = '"+elemts[0]+"' ;";
            SqlDataSource sqlSelect = new SqlDataSource(connectionString, selectCommd);
            DataView dt = (DataView)sqlSelect.Select(new DataSourceSelectArguments());

            if (dt.Count > 0)
            {
                return false;
            }
            
             SqlDataSource sqlInsert = new SqlDataSource(connectionString, insertCommd);
            
            return true;

            


           
            
        }
    }
}