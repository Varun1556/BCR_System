using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BirthCertificateRegistration
{
	public partial class EditCertificate : System.Web.UI.Page
	{
        int certificateId;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!int.TryParse(Request.QueryString["id"], out certificateId))
            {
                lblMessage.Text = "Invalid certificate ID.";
                return;
            }

            if (!IsPostBack)
            {
                LoadCertificateData(certificateId);
            }
        }

        private void LoadCertificateData(int id)
        {
            string connStr = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT ChildName, DateOfBirth, Gender, PlaceOfBirth, FatherName, MotherName, Address
                                 FROM BirthCertificatedb WHERE CertificateID = @CertificateID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CertificateID", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtChildName.Text = reader["ChildName"].ToString();
                    txtDOB.Text = Convert.ToDateTime(reader["DateOfBirth"]).ToString("yyyy-MM-dd");
                    ddlGender.SelectedValue = reader["Gender"].ToString();
                    txtPlaceOfBirth.Text = reader["PlaceOfBirth"].ToString();
                    txtFatherName.Text = reader["FatherName"].ToString();
                    txtMotherName.Text = reader["MotherName"].ToString();
                    txtAddress.Text = reader["Address"].ToString();
                }
                else
                {
                    lblMessage.Text = "Record not found !";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"UPDATE BirthCertificatedb SET 
                                ChildName = @ChildName,
                                DateOfBirth = @DateOfBirth,
                                Gender = @Gender,
                                PlaceOfBirth = @PlaceOfBirth,
                                FatherName = @FatherName,
                                MotherName = @MotherName,
                                Address = @Address
                                WHERE CertificateID = @CertificateID";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@ChildName", txtChildName.Text);
                cmd.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@PlaceOfBirth", txtPlaceOfBirth.Text);
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@CertificateID", certificateId);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    Response.Redirect("View1.aspx");
                }
                else
                {
                    lblMessage.Text = "Update failed. Try again !";
                }
            }
        }
    }
}

	
        