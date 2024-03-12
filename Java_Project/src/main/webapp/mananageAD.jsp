<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link rel="stylesheet" href="style1.css">
         <link rel="stylesheet" href="deleted.css">
                  <link rel="stylesheet" href="style_home.css">
<body>
 <h1>Manage Posts</h1><a href="HomeAd.jsp">Back</a>
<div class="container">
   
    <div class="news-container">
    <%
    Connection conn1 = null;
    PreparedStatement ps3 = null;
   ResultSet rs3=null;  
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
             ps3 = conn1.prepareStatement("SELECT id, title FROM admin_dashboard ORDER BY id DESC");
             rs3 = ps3.executeQuery();
            while (rs3.next()) { 
                int newsId = rs3.getInt("id");
                String title = rs3.getString("title");
    %>   
        <div class="news-item">
            <span class="news-title"><%= title %></span>
            <a class="delete-link" href="AAdmin_Dashboard?action=view&id=<%= newsId %>">View</a>
            <a class="delete-link" href="AAdmin_Dashboard?action=delete&id=<%= newsId %>">Delete</a>
           


        </div>
    <%
            }
            rs3.close();
            ps3.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn1 != null) {
                    conn1.close();
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