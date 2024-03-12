<%@ page import="java.io.*, java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*, java.sql.Blob" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link rel="stylesheet" href="style1.css">
         <link rel="stylesheet" href="deleted.css">
                  <link rel="stylesheet" href="style_home.css">
         
        
</head>
<body>

  <%@ include file="head.jsp" %>
    <main>
      
      
        <form action="title" method="post" enctype="multipart/form-data">
        <section class="settings-section">
            <h2>System Settings</h2>
            <div class="setting-item">               
                <label for="site-logo">Change Name</label>
                <input type="text" id="site-logo" name="name" required>
            </div>
            <div class="setting-item">
                <label for="site-logo">Change Profile</label>
                <input type="file" id="site-logo" name="image" required>
            </div>
            <button class="save-button">Save Settings</button>
        </section></form></main>
</body></html>