<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View1.aspx.cs" Inherits="BirthCertificateRegistration.View1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 20px;
        background-color: #f8f9fa;
        color: #333;
        line-height: 1.6;
    }
    .grid-view {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    .grid-view th {
        background-color: #2c3e50;
        color: white;
        padding: 12px 15px;
        text-align: left;
        font-weight: 600;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        font-size: 0.9em;
    }
    .grid-view td {
        padding: 12px 15px;
        border-bottom: 1px solid #e0e0e0;
        transition: all 0.2s ease;
    }
    .grid-view tr:nth-child(even) {
        background-color: #f8f9fa;
    }
    .grid-view tr:last-child td {
        border-bottom: none;
    }
    .grid-view tr:hover {
        background-color: #e9e9e9;
        transform: translateX(2px);
    }
    .grid-view tr {
        transition: all 0.3s ease;
    }
    .pager {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    .container {
        width: 95%;
        margin: 0 auto;
        max-width: 1200px;
    }
    .header {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #eaeaea;
        position: relative;
    }
    .header:after {
        content: '';
        position: absolute;
        bottom: -2px;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 2px;
        background: #2c3e50;
    }
    .action-buttons {
        margin-bottom: 25px;
        display: flex;
        gap: 15px;
    }
    .action-link {
        color: #003366;
        text-decoration: none;
        font-weight: 500;
        padding: 8px 15px;
        border-radius: 4px;
        transition: all 0.3s ease;
        background-color: rgba(0, 51, 102, 0.1);
    }
    .action-link:hover {
        background-color: rgba(0, 51, 102, 0.2);
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    .delete-link {
        color: #d9534f;
        text-decoration: none;
        font-weight: 500;
        padding: 8px 15px;
        border-radius: 4px;
        transition: all 0.3s ease;
        background-color: rgba(217, 83, 79, 0.1);
    }
    .delete-link:hover {
        background-color: rgba(217, 83, 79, 0.2);
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    @media (max-width: 768px) {
        .grid-view {
            display: block;
            overflow-x: auto;
        }
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

            <h1 class="header">Birth Certificate Records</h1>
            
            <div class="action-buttons">
                <asp:Button ID="btnAddNew" runat="server" Text="Register New Certificate" 
                    OnClick="btnAddNew_Click" CssClass="btn" BackColor="#003366" BorderColor="Black" BorderStyle="Double" ForeColor="White" />
                <asp:Button ID="btnExport" runat="server" Text="Export to Excel" 
                    OnClick="btnExport_Click" CssClass="btn" BackColor="#003366" BorderColor="Black" BorderStyle="Double" ForeColor="White" />
            </div>
            
            <asp:GridView ID="gvBirthCertificates" runat="server" Visible="true" AutoGenerateColumns="False" 
                DataKeyNames="CertificateID" AllowPaging="True" PageSize="5"
                OnPageIndexChanging="gvBirthCertificates_PageIndexChanging"
                CssClass="grid-view" PagerStyle-CssClass="pager" 
                OnRowCommand="gvBirthCertificates_RowCommand"
                OnRowDeleting="gvBirthCertificates_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="CertificateID" HeaderText="ID" ReadOnly="True" ItemStyle-Width="50px" />
                    <asp:BoundField DataField="ChildName" HeaderText="Child Name" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="PlaceOfBirth" HeaderText="Place of Birth" />
                    <asp:BoundField DataField="FatherName" HeaderText="Father's Name" />
                    <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" />
                    <asp:BoundField DataField="RegistrationDate" HeaderText="Registered On" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandName="View" 
                                CommandArgument='<%# Eval("CertificateID") %>' Text="View" CssClass="action-link" />
                            | 
                            <asp:HyperLink ID="lnkEdit" runat="server" 
                                NavigateUrl='<%# "EditCertificate.aspx?id=" + Eval("CertificateID") %>' 
                                Text="Edit" CssClass="action-link" />
                            | 
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" 
                                CommandArgument='<%# Eval("CertificateID") %>' Text="Delete" 
                                OnClientClick="return confirm('Are you sure you want to delete this record?');"
                                CssClass="action-link delete-link" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    No birth certificate records found.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>