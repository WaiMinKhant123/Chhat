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

   
    <main>
        <form action="title" method="post" enctype="multipart/form-data">
        <section class="settings-section">
            <h2>System Settings</h2>
            <div class="setting-item">
               
            </div>
            <div class="setting-item">
                <label for="site-logo">Set Logo:</label>
                <input type="file" id="site-logo" name="image" required>
            </div>
            <button class="save-button">Save Settings</button>
        </section></form></main>
        <form action="Admin_Dashboard?action=add" method="post" enctype="multipart/form-data">
      <section> <div class="Add_file"> <h1>Add News</h1>
        <label for="title"><b>Title:</b></label><br>
        <input type="text" id="title" name="title" required><br><br>
         <label for="ImaGe"><b>Image:</b></label><br>
        <input type="file" id="imge" name="image" required><br><br>
        <label for="title"><b>Category:</b></label><br>
        
    <input type="radio" id="local" name="region" value="Local">
    <label for="Local">local</label><br>
    
    <input type="radio" id="inter" name="region" value="Inter">
    <label for="Inter">inter</label><br>
    
    <input type="radio" id="sport" name="region" value="Sport">
    <label for="Sport">sport</label><br>
    
    <input type="radio" id="economy" name="region" value="Economy">
    <label for="Economy">economy</label><br>
    
    <input type="radio" id="bandh" name="region" value="Beauty/Health">
    <label for="BandH">beauty/health</label><br>
    
    <input type="radio" id="artists" name="region" value="Artists">
    <label for="artists">artists</label><br>
    
    <input type="radio" id="entertain" name="region" value="Entertainment">
    <label for="entertain">entertainment</label><br><br>
    
    
   <label for="date"><b>Date (yyyy/mm/dd):</b></label>
<input type="text" id="date" name="date" pattern="\d{4}/\d{1,2}/\d{1,2}" placeholder="yyyy/mm/dd" required><br><br>



        <label for="content"><b>Content:</b></label><br><br>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea><br><br>
        <input type="reset" name="reset" value="Reset" class="delete-link">
         <input type="submit" name="submit" value="Submit" class="delete-link">
       </div>
   </form>



<div class="container">
    <h1>Manage News</h1>
    <div class="news-container">
    <%
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
           PreparedStatement  ps = conn.prepareStatement("SELECT id, title FROM admin_dashboard ORDER BY id DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) { 
                int newsId = rs.getInt("id");
                String title = rs.getString("title");
    %>
        <div class="news-item">
            <span class="news-title"><%= title %></span>
            <a class="delete-link" href="Admin_Dashboard?action=delete&id=<%= newsId %>">Delete</a>
           <a class="edit-link" href="Admin_Dashboard?action=edit&id=<%= newsId %>">Edit</a>


        </div>
    <%
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    %>
    </div>
</div>
</body>
</html>
