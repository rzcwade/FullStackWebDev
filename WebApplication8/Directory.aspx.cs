using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using DevExpress.Web;

using DevExpress.Export;
using DevExpress.XtraPrinting;

namespace WebApplication8
{
    public partial class Directory : System.Web.UI.Page
    {
        DataSet ds = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void Refreshdata()
        {
            /*
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IOSWeb_TestConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("TestGrid_GetUsers", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
            */

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IOSWeb_TestConnectionString"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmdInsertUser = new SqlCommand("TestGrid_InsertUser", conn)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    cmdInsertUser.Parameters.Clear();

                    SqlParameter User_Name = new SqlParameter("@UserName", e.NewValues["UserName"]);
                    SqlParameter User_Desc = new SqlParameter("@UserDesc", e.NewValues["UserDesc"]);
                    SqlParameter Password = new SqlParameter("@Password", e.NewValues["Password"]);
                    SqlParameter ModifiedBy = new SqlParameter("@ModifiedBy", e.NewValues["ModifiedBy"]);

                    cmdInsertUser.Parameters.Add(User_Name);
                    cmdInsertUser.Parameters.Add(User_Desc);
                    cmdInsertUser.Parameters.Add(Password);
                    cmdInsertUser.Parameters.Add(ModifiedBy);

                    cmdInsertUser.ExecuteNonQuery();
                    cmdInsertUser.Parameters.Clear();
                    cmdInsertUser.Dispose();

                    e.Cancel = true;
                    ASPxGridView1.CancelEdit();
                    ASPxGridView1.DataBind();

                }
            }
            catch (Exception ex)
            {
            }

        }

        protected void ASPxGridView1_RowUpdating1(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string userid = Convert.ToString(e.Keys["UserID"]).Trim();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IOSWeb_TestConnectionString"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmdInsertUser = new SqlCommand("TestGrid_UpdateUser", conn)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    cmdInsertUser.Parameters.Clear();
                    SqlParameter paramUserID = new SqlParameter("@UserID", userid);

                    SqlParameter User_Name = new SqlParameter("@UserName", e.NewValues["UserName"]);
                    SqlParameter User_Desc = new SqlParameter("@UserDesc", e.NewValues["UserDesc"]);
                    SqlParameter Password = new SqlParameter("@Password", e.NewValues["Password"]);
                    SqlParameter ModifiedBy = new SqlParameter("@ModifiedBy", e.NewValues["ModifiedBy"]);

                    cmdInsertUser.Parameters.Add(paramUserID);
                    cmdInsertUser.Parameters.Add(User_Name);
                    cmdInsertUser.Parameters.Add(User_Desc);
                    cmdInsertUser.Parameters.Add(Password);
                    cmdInsertUser.Parameters.Add(ModifiedBy);

                    cmdInsertUser.ExecuteNonQuery();
                    cmdInsertUser.Parameters.Clear();
                    cmdInsertUser.Dispose();

                    e.Cancel = true;
                    ASPxGridView1.CancelEdit();
                    ASPxGridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
            }
            e.Cancel = true;
            grid.CancelEdit();
            grid.DataBind();
        }

        protected void ASPxGridView1_RowDeleting1(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string userid = Convert.ToString(e.Values["UserID"]).Trim();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IOSWeb_TestConnectionString"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("TestGrid_DeleteUser", conn))
                    {
                        //cmd.CommandTimeout = 1000000;
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter paramUserID = new SqlParameter("@UserID", userid);
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add(paramUserID);
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }
                }
            }
            catch (Exception ex)
            {
            }
            e.Cancel = true;
            grid.CancelEdit();
            grid.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse(new XlsxExportOptionsEx { ExportType = ExportType.WYSIWYG });
        }
    }
}