<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCertificate.aspx.cs" Inherits="BirthCertificateRegistration.EditCertificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #eef2f3;
        padding: 20px;
        line-height: 1.6;
        color: #333;
    }
    .form-container {
        background: white;
        padding: 30px;
        width: 600px;
        margin: 40px auto;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .form-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
    }
    h2 {
        text-align: center;
        color: #003366;
        margin-bottom: 25px;
        font-weight: 600;
        position: relative;
        padding-bottom: 10px;
    }
    h2::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background: linear-gradient(90deg, #003366, #4a90e2);
        border-radius: 3px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        font-weight: 600;
        margin-bottom: 8px;
        color: #003366;
        font-size: 0.95em;
    }
    input[type="text"], 
    input[type="date"], 
    textarea, 
    select {
        width: 100%;
        padding: 12px;
        margin-top: 5px;
        box-sizing: border-box;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-family: inherit;
        transition: all 0.3s ease;
    }
    input[type="text"]:focus, 
    input[type="date"]:focus, 
    textarea:focus, 
    select:focus {
        border-color: #4a90e2;
        box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.2);
        outline: none;
    }
    textarea {
        min-height: 100px;
        resize: vertical;
    }
    .btn {
        padding: 12px 24px;
        background: linear-gradient(135deg, #003366, #004080);
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
        box-shadow: 0 4px 6px rgba(0, 51, 102, 0.1);
    }
    .btn:hover {
        background: linear-gradient(135deg, #002244, #003366);
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0, 51, 102, 0.15);
    }
    .btn:active {
        transform: translateY(0);
        box-shadow: 0 2px 4px rgba(0, 51, 102, 0.1);
    }
    @media (max-width: 640px) {
        .form-container {
            width: 95%;
            padding: 20px;
        }
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Edit Birth Certificate</h2>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <div class="form-group">
                <label>Child's Full Name</label>
                <asp:TextBox ID="txtChildName" runat="server" />
            </div>

            <div class="form-group">
                <label>Date of Birth</label>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" />
            </div>

            <div class="form-group">
                <label>Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Place of Birth</label>
                <asp:TextBox ID="txtPlaceOfBirth" runat="server" />
            </div>

            <div class="form-group">
                <label>Father's Name</label>
                <asp:TextBox ID="txtFatherName" runat="server" />
            </div>

            <div class="form-group">
                <label>Mother's Name</label>
                <asp:TextBox ID="txtMotherName" runat="server" />
            </div>

            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" />
            </div>

            <asp:Button ID="btnUpdate" runat="server" Text="Update Certificate" CssClass="btn" OnClick="btnUpdate_Click" />
        </div>
    </form>
</body>
</html>
