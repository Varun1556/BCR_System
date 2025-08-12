using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BirthCertificateRegistration
{
	public partial class View1 : System.Web.UI.Page
	{

        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (Session["UserID"] == null) 
                {
                    Response.Redirect("Login.aspx");
                }
                LoadBirthCertificates();
            }
        }

        private void LoadBirthCertificates()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"SELECT CertificateID, ChildName, DateOfBirth, Gender, 
                                   PlaceOfBirth, FatherName, MotherName, RegistrationDate
                                   FROM BirthCertificatedb 
                                   ORDER BY CertificateID DESC";

                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // DEBUG: Show query and row count
                    lblMessage.Text = $"Query: {query}<br/>Loaded {dt.Rows.Count} records.";

                    if (dt.Rows.Count > 0)
                    {
                        gvBirthCertificates.DataSource = dt;
                        gvBirthCertificates.DataBind();
                        gvBirthCertificates.Visible = true;
                    }
                    else
                    {
                        gvBirthCertificates.Visible = false;
                        lblMessage.Text += "<br/>No records found in database.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = $"Error loading data: {ex.Message}";
            }
        }

        protected void gvBirthCertificates_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBirthCertificates.PageIndex = e.NewPageIndex;
            LoadBirthCertificates();
        }

        protected void gvBirthCertificates_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("ViewCertificate.aspx?ID=" + id);
            }
        }

        protected void gvBirthCertificates_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvBirthCertificates.DataKeys[e.RowIndex].Value);

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM BirthCertificatedb WHERE CertificateID = @ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rowsAffected > 0)
                        {
                            // Show success message
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert",
                                "alert('Record deleted successfully!');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error deleting record: {ex.Message}');</script>");
            }

            // Refresh the grid
            LoadBirthCertificates();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration1.aspx");
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"SELECT CertificateID, ChildName, DateOfBirth, Gender, 
                                   PlaceOfBirth, FatherName, MotherName, Address, RegistrationDate
                                   FROM BirthCertificatedb
                                   ORDER BY CertificateID DESC";

                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Export to Excel
                    Response.Clear();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment;filename=BirthCertificates.xls");
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.ms-excel";

                    using (StringWriter sw = new StringWriter())
                    {
                        HtmlTextWriter hw = new HtmlTextWriter(sw);

                        // Create a table to contain the grid
                        Table tb = new Table();
                        TableRow tr = new TableRow();

                        // Add header row
                        foreach (DataColumn column in dt.Columns)
                        {
                            TableCell cell = new TableCell();
                            cell.Text = column.ColumnName;
                            cell.Font.Bold = true;
                            tr.Cells.Add(cell);
                        }
                        tb.Rows.Add(tr);

                        // Add data rows
                        foreach (DataRow row in dt.Rows)
                        {
                            tr = new TableRow();
                            foreach (DataColumn column in dt.Columns)
                            {
                                TableCell cell = new TableCell();
                                cell.Text = row[column].ToString();
                                tr.Cells.Add(cell);
                            }
                            tb.Rows.Add(tr);
                        }

                        tb.RenderControl(hw);
                        Response.Output.Write(sw.ToString());
                        Response.Flush();
                        Response.End();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error exporting data: {ex.Message}');</script>");
            }
        }
        protected void gvBirthCertificates_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Check if data is actually bound to the row
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                System.Diagnostics.Debug.WriteLine(rowView["ChildName"].ToString());
            }
        }
    }
}