using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BirthCertificateRegistration
{
	public partial class Registration1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                // You can add any initialization code here if needed
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        // RegistrationDate is auto-set to GETDATE() in DB (DEFAULT)
                        string query = @"INSERT INTO BirthCertificatedb 
                                (ChildName, DateOfBirth, Gender, PlaceOfBirth, FatherName, MotherName, Address) 
                                VALUES 
                                (@ChildName, @DateOfBirth, @Gender, @PlaceOfBirth, @FatherName, @MotherName, @Address)";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            // Explicitly define parameter types and sizes (best practice)
                            cmd.Parameters.Add("@ChildName", SqlDbType.NVarChar, 100).Value = txtChildName.Text.Trim();
                            cmd.Parameters.Add("@DateOfBirth", SqlDbType.Date).Value = Convert.ToDateTime(txtDateOfBirth.Text);
                            cmd.Parameters.Add("@Gender", SqlDbType.NVarChar, 10).Value = ddlGender.SelectedValue;

                            // Your confirmed column sizes:
                            cmd.Parameters.Add("@PlaceOfBirth", SqlDbType.NVarChar, 100).Value = txtPlaceOfBirth.Text.Trim();
                            cmd.Parameters.Add("@FatherName", SqlDbType.NVarChar, 100).Value = txtFatherName.Text.Trim();
                            cmd.Parameters.Add("@MotherName", SqlDbType.NVarChar, 100).Value = txtMotherName.Text.Trim();
                            cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 200).Value = txtAddress.Text.Trim();

                            con.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblMessage.Text = "Birth certificate registered successfully!";
                                lblErrorMessage.Text = "";
                                ClearForm();
                            }
                            else
                            {
                                lblErrorMessage.Text = "Error: No rows were inserted.";
                                lblMessage.Text = "";
                            }
                        } // Command disposed here
                    } // Connection closed/disposed here
                }
                catch (SqlException sqlEx)
                {
                    lblErrorMessage.Text = "Database Error: " + sqlEx.Message;
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtChildName.Text = "";
            txtDateOfBirth.Text = "";
            ddlGender.SelectedIndex = 0;
            txtPlaceOfBirth.Text = "";
            txtFatherName.Text = "";
            txtMotherName.Text = "";
            txtAddress.Text = "";
        }
    }
}
   