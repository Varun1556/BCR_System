using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BirthCertificateRegistration
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            Session.Clear(); 
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ShowError("Please enter both username and password.");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["BirthCertificateConn"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "SELECT UserID FROM Users WHERE Username = @Username AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            Session["UserID"] = result.ToString();
                            Session["Username"] = username;

                            // Redirect to main dashboard page
                            Response.Redirect("View1.aspx");
                        }
                        else
                        {
                            ShowError("Invalid username or password.");
                        }
                    }
                }
            }
            catch (Exception)
            {
                ShowError("An error occurred while connecting. Try again later.");
            }
        }
        private void ShowError(string message)
        {
            lblMessage.Text = message;
            lblMessage.Visible = true;
        }

    }
}