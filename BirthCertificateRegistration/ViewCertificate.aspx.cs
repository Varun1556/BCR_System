using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BirthCertificateRegistration
{
    public partial class ViewCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (Session["UserID"] == null) // Simple authentication check
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (Request.QueryString["id"] == null)
                {
                    ShowErrorAndRedirect("No certificate ID provided");
                    return;
                }

                if (!int.TryParse(Request.QueryString["id"], out int certificateId))
                {
                    ShowErrorAndRedirect("Invalid certificate ID format");
                    return;
                }

                LoadCertificateData(certificateId);
            }
        }
        private void LoadCertificateData(int certificateId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"SELECT 
                                    CertificateID, ChildName, DateOfBirth, Gender, 
                                    PlaceOfBirth, FatherName, MotherName, Address, 
                                    RegistrationDate
                                    FROM BirthCertificatedb
                                    WHERE CertificateID = @CertificateID";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@CertificateID", certificateId);
                        connection.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Display certificate data
                                lblCertId.Text = reader["CertificateID"].ToString();
                                lblChildName.Text = reader["ChildName"].ToString();
                                lblDOB.Text = FormatDate(reader["DateOfBirth"]);
                                lblGender.Text = reader["Gender"].ToString();
                                lblPlaceOfBirth.Text = reader["PlaceOfBirth"].ToString();
                                lblFatherName.Text = reader["FatherName"].ToString();
                                lblMotherName.Text = reader["MotherName"].ToString();
                                lblAddress.Text = reader["Address"].ToString();
                                lblRegDate.Text = FormatDateTime(reader["RegistrationDate"]);
                            }
                            else
                            {
                                ShowErrorAndRedirect("Certificate not found");
                            }
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                ShowErrorAndRedirect("Database error: " + sqlEx.Message);
            }
            catch (Exception ex)
            {
                ShowErrorAndRedirect("Error: " + ex.Message);
            }
        }

        private string FormatDate(object dateValue)
        {
            if (dateValue == DBNull.Value || dateValue == null)
                return "N/A";

            return Convert.ToDateTime(dateValue).ToString("dd-MMM-yyyy");
        }

        private string FormatDateTime(object dateValue)
        {
            if (dateValue == DBNull.Value || dateValue == null)
                return "N/A";

            return Convert.ToDateTime(dateValue).ToString("dd-MMM-yyyy hh:mm tt");
        }

        private void ShowErrorAndRedirect(string message)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alert",
                $"alert('{message.Replace("'", "\\'")}'); window.location='View1.aspx';",
                true);
        }
    }
}

       