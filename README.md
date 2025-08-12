# 📝 BCR_System – Birth Certificate Registration System

**BCR_System** is a web-based application built with **ASP.NET Web Forms (C#)** and **SQL Server** for managing birth certificate records.  
It allows authorized users to register new birth certificates, view and edit existing records, and ensure secure access through role-based login.

---

## ✨ Features

- 🖋 **Register Birth Certificates** – Capture and store essential details like name, date of birth, parents’ information, and more.
- 📋 **View Records** – Display all registered birth certificates in a user-friendly grid with pagination.
- 📂 **View Certificate Details** – See complete details of any record.
- ✏ **Edit / Update Records** – Modify information with admin permissions.
- 🗑 **Delete Records** – Restricted to admins for secure data handling.
- 📤 **Export to Excel** – Download records for offline use or reporting.
- 🔐 **Login System** – Basic authentication using a `Users` table with role checks.
- 🎨 **Modern UI** – Clean, professional design for easy navigation.

---

## 🛠 Tech Stack

- **Frontend:** ASP.NET Web Forms (HTML, CSS)
- **Backend:** C# (Code-behind)
- **Database:** SQL Server
- **IDE:** Visual Studio 2022

---

## 📂 Project Structure

BCR_System/
│
├── App_Data/ # Database-related files
├── Pages/ # .aspx pages (View, Edit, Insert, etc.)
├── Scripts/ # JavaScript files
├── Styles/ # CSS stylesheets
└── Web.config # Application configuration

yaml
Copy
Edit

---

## 🚀 How to Run the Project

1. **Clone the repository**  
   ```bash
   git clone https://github.com/YourUsername/BCR_System.git
Open in Visual Studio 2022

Go to File > Open > Project/Solution and select the .sln file.

Set up the database

Restore or create the database in SQL Server.

Update connection strings in Web.config.

📝 Author
Developed by Varun Kumar Singh
📧 [vs2715450@gmail.com]
🔗 [My LinkedIn Profile : https://www.linkedin.com/in/varun-kumar-singh-934b0824a/]

📜 License
This project is licensed under the MIT License – you are free to use and modify it.

Run the project

Press F5 to start the local server and open the app in your browser.
