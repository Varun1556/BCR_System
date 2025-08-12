<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration1.aspx.cs" Inherits="BirthCertificateRegistration.Registration1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
    body {
        font-family: 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', sans-serif;
        margin: 20px;
        line-height: 1.6;
        background-color: #f5f7fa;
        color: #333;
    }
    .form-container {
        width: 600px;
        margin: 30px auto;
        padding: 30px;
        border: 1px solid #e1e5eb;
        border-radius: 8px;
        background-color: white;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .form-container:hover {
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        transform: translateY(-2px);
    }
    .form-group {
        margin-bottom: 20px;
        display: flex;
        align-items: center;
    }
    .form-group label {
        display: inline-block;
        width: 150px;
        font-weight: 600;
        color: #2c3e50;
        transition: color 0.2s ease;
    }
    .form-group:hover label {
        color: #3498db;
    }
    .form-group input[type="text"],
    .form-group input[type="date"],
    .form-group textarea,
    .form-group select {
        width: 300px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-family: inherit;
        transition: all 0.3s ease;
    }
    .form-group input[type="text"]:focus,
    .form-group input[type="date"]:focus,
    .form-group textarea:focus,
    .form-group select:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
    }
    .form-group textarea {
        height: 80px;
        resize: vertical;
    }
    .button-group {
        margin-top: 30px;
        text-align: center;
    }
    .button-group input[type="submit"],
    .button-group input[type="reset"] {
        padding: 10px 25px;
        margin: 0 10px;
        cursor: pointer;
        border: none;
        border-radius: 4px;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    .button-group input[type="submit"] {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
    }
    .button-group input[type="submit"]:hover {
        background: linear-gradient(135deg, #2980b9, #3498db);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(41, 128, 185, 0.3);
    }
    .button-group input[type="reset"] {
        background: linear-gradient(135deg, #f1f1f1, #e1e1e1);
        color: #555;
    }
    .button-group input[type="reset"]:hover {
        background: linear-gradient(135deg, #e1e1e1, #f1f1f1);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .validation-error {
        color: #e74c3c;
        font-size: 12px;
        margin-left: 150px;
        opacity: 0;
        transform: translateY(-5px);
        transition: all 0.3s ease;
    }
    .validation-error.show {
        opacity: 1;
        transform: translateY(0);
    }
    .header {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        position: relative;
    }
    .header:after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background: linear-gradient(90deg, #3498db, #2c3e50);
    }
    @media (max-width: 640px) {
        .form-container {
            width: 95%;
            padding: 20px;
        }
        .form-group {
            flex-direction: column;
            align-items: flex-start;
        }
        .form-group label {
            width: 100%;
            margin-bottom: 8px;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group textarea,
        .form-group select {
            width: 100%;
        }
        .validation-error {
            margin-left: 0;
        }
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        
         <div class="form-container">
            <h1 class="header">Birth Certificate Registration</h1>
            
            <div class="form-group">
                <asp:Label ID="lblChildName" runat="server" Text="Child's Full Name:"></asp:Label>
                <asp:TextBox ID="txtChildName" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvChildName" runat="server" 
                    ControlToValidate="txtChildName" ErrorMessage="Child's name is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblDateOfBirth" runat="server" Text="Date of Birth:"></asp:Label>
                <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" 
                    ControlToValidate="txtDateOfBirth" ErrorMessage="Date of birth is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="">-- Select Gender --</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvGender" runat="server" 
                    ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Gender is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblPlaceOfBirth" runat="server" Text="Place of Birth:"></asp:Label>
                <asp:TextBox ID="txtPlaceOfBirth" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPlaceOfBirth" runat="server" 
                    ControlToValidate="txtPlaceOfBirth" ErrorMessage="Place of birth is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblFatherName" runat="server" Text="Father's Full Name:"></asp:Label>
                <asp:TextBox ID="txtFatherName" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFatherName" runat="server" 
                    ControlToValidate="txtFatherName" ErrorMessage="Father's name is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblMotherName" runat="server" Text="Mother's Full Name:"></asp:Label>
                <asp:TextBox ID="txtMotherName" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMotherName" runat="server" 
                    ControlToValidate="txtMotherName" ErrorMessage="Mother's name is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Address is required" 
                    CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="button-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" BackColor="#003366" BorderColor="Black" BorderStyle="Double" ForeColor="White" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="false" OnClick="btnReset_Click" BackColor="#003366" BorderColor="Black" BorderStyle="Double" ForeColor="White" />
            </div>
            
            <div class="form-group" style="text-align: center; margin-top: 20px;">
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>

    </form>
</body>
</html>
