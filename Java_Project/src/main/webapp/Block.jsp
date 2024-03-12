<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>

<link rel="stylesheet" href="profile.css">
</head>
<body>

<%
   
    String name11 = request.getParameter("name"); 

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT name, image FROM login WHERE name = ?");
        ps.setString(1, name11);
       ResultSet rs = ps.executeQuery();
        if (rs.next()) { 
            String name2 = rs.getString("name");
            byte[] imageData = rs.getBytes("image");
            String base64Image = (imageData != null) ? java.util.Base64.getEncoder().encodeToString(imageData) : null;
%>
    <div class="profileview">
        <div class="profile">
            <img src="data:image/jpeg;base64, <%= base64Image %>" alt="Profile Image" class="profile2image"/>
            <h3><b><%= name2 %></b></h3>
            <div class="atab"><a href="Block?action=edit&id=<%= name2 %>">Show posts</a></div></div>
        </div>
   
    
<%
        } else {
            out.println("<h3>No user found with the name: " + name + "</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } 
%>

</body>
</html>
