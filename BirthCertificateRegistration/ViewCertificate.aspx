<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="BirthCertificateRegistration.ViewCertificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Certificate & Print</title>
      <style>
    body {
        font-family: 'Times New Roman', serif;
        margin: 0;
        padding: 20px;
        background-color: #f5f3e9;
        background-image: linear-gradient(to bottom, #f5f3e9 0%, #e8e6dd 100%);
    }
    .certificate {
        width: 21cm;
        min-height: 29.7cm;
        margin: 0 auto;
        padding: 1.5cm;
        background: white;
        border: 3px double #8b0000;
        box-shadow: 0 5px 25px rgba(0, 0, 0, 0.15);
        position: relative;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .certificate:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    }
    .watermark {
        position: absolute;
        opacity: 0.08;
        font-size: 120pt;
        font-family: 'Brush Script MT', cursive;
        color: #8b0000;
        transform: rotate(-30deg);
        z-index: -1;
        top: 35%;
        left: 15%;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        user-select: none;
    }
    .header {
        text-align: center;
        border-bottom: 2px solid #8b0000;
        padding-bottom: 15px;
        margin-bottom: 25px;
        position: relative;
    }
    .header:after {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 50%;
        transform: translateX(-50%);
        width: 150px;
        height: 3px;
        background: #003366;
    }
    .header h1 {
        color: #003366;
        font-size: 26pt;
        margin: 10px 0;
        letter-spacing: 1px;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05);
    }
    .header h2 {
        font-size: 16pt;
        margin: 8px 0;
        color: #003366;
        font-weight: 600;
    }
    .header h3 {
        font-size: 13pt;
        font-weight: normal;
        font-style: italic;
        margin: 8px 0 20px;
        color: #003366;
    }
    .certificate-body {
        margin: 30px 0;
        color: #003366;
    }
    .detail-row {
        display: flex;
        margin-bottom: 15px;
        padding: 10px 0;
        border-bottom: 1px dashed #d4d4d4;
        transition: background-color 0.2s ease;
    }
    .detail-row:hover {
        background-color: rgba(139, 0, 0, 0.03);
    }
    .detail-label {
        font-weight: bold;
        width: 220px;
        color: #8b0000;
        font-size: 1.05em;
    }
    .detail-value {
        flex: 1;
        color: #003366;
        font-size: 1.05em;
    }
    .actions {
        text-align: center;
        margin-top: 40px;
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    .btn {
        padding: 10px 25px;
        background: linear-gradient(to bottom, #003366, #002244);
        color: white;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        font-weight: bold;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        border: 1px solid #002244;
        min-width: 180px;
    }
    .btn:hover {
        background: linear-gradient(to bottom, #002244, #001122);
        transform: translateY(-2px);
        box-shadow: 0 5px 12px rgba(0, 0, 0, 0.15);
    }
    .btn:active {
        transform: translateY(0);
    }
    .btn-print {
        background: linear-gradient(to bottom, #27ae60, #219653);
        border: 1px solid #219653;
    }
    .btn-print:hover {
        background: linear-gradient(to bottom, #219653, #1d834b);
    }
    @media print {
        body {
            background: none;
            padding: 0;
        }
        .certificate {
            border: none;
            box-shadow: none;
            width: auto;
            min-height: auto;
        }
        .actions {
            display: none;
        }
        .watermark {
            opacity: 0.15;
        }
    }
    @media (max-width: 768px) {
        .certificate {
            width: 95%;
            padding: 1cm;
        }
        .detail-row {
            flex-direction: column;
        }
        .detail-label {
            width: 100%;
            margin-bottom: 5px;
        }
        .actions {
            flex-direction: column;
            gap: 10px;
            align-items: center;
        }
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="certificate">
            
            <div class="header">
                <h1>GOVERNMENT OF WEST BENGAL</h1>
                <h2>DEPARTMENT OF HEALTH AND FAMILY WELFARE</h2>
                <h2>KOLKATA MUNICIPAL CORPORATION</h2> <br />
                <h3><b>BIRTH CERTIFICATE</b></h3>
                <p style="font-size:10pt;">
                    ISSUED UNDER SECTION 17 OF THE REGISTRATION OF BIRTHS & DEATHS ACT, 1969<br />
                    AND RULE 8/13 OF THE WEST BENGAL REGISTRATION OF BIRTHS & DEATHS RULES 2000
                </p>
            </div>

            <div class="certificate-body">
                <p>
                    THIS IS TO CERTIFY THAT THE FOLLOWING INFORMATION HAS BEEN TAKEN FROM THE ORIGINAL RECORD OF BIRTH 
                    WHICH IS THE REGISTER FOR KOLKATA MUNICIPAL CORPORATION OF BLOCK/MUNICIPALITY BOROUGH 05 
                    OF DISTRICT KOLKATA OF STATE WEST BENGAL, INDIA.
                </p>

                <div style="text-align:center;color:#7f8c8d;margin-bottom:20px;">
                    Certificate ID: <asp:Label ID="lblCertId" runat="server" />
                </div>

                <div class="detail-row">
                    <span class="detail-label">Child's Full Name:</span>
                    <span class="detail-value"><asp:Label ID="lblChildName" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Date of Birth:</span>
                    <span class="detail-value"><asp:Label ID="lblDOB" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Gender:</span>
                    <span class="detail-value"><asp:Label ID="lblGender" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Place of Birth:</span>
                    <span class="detail-value"><asp:Label ID="lblPlaceOfBirth" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Father's Name:</span>
                    <span class="detail-value"><asp:Label ID="lblFatherName" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Mother's Name:</span>
                    <span class="detail-value"><asp:Label ID="lblMotherName" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Address:</span>
                    <span class="detail-value"><asp:Label ID="lblAddress" runat="server" /></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Registration Date:</span>
                    <span class="detail-value"><asp:Label ID="lblRegDate" runat="server" /></span>
                </div>

                <div class="actions">
                    <a href="ViewRecords.aspx" class="btn">Back to Records</a>
                    <button onclick="window.print()" class="btn btn-print">Print Certificate</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
