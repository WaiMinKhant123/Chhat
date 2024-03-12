<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="style_home.css">
<link rel="stylesheet" href="styleheader.css">
<body style="background-color:white;">
<main class="main">
        <%
            while (rs.next()) { 
            	String name1=rs.getString("name");
                byte[] imageData = rs.getBytes("image");
                String email = rs.getString("content");
                String head=rs.getString("title");
                String time=rs.getString("date");               
                String region=rs.getString("region");
                String emotion=rs.getString("emotion");
                byte[] imageData3= rs.getBytes("profile");
                String base64Image = (imageData != null) ? java.util.Base64.getEncoder().encodeToString(imageData) : null;
                String base64Image3 = (imageData3 != null) ? java.util.Base64.getEncoder().encodeToString(imageData3) : null;
        %>
       <div class="item" style="background-color:black;">
             <div class="profile">
        <img src="data:image/jpeg;base64, <%= base64Image3 %>" alt="Image3" class="profile-image"/>
    </div>
      <span class="textpop"> <b><i><a href="profileinfo.jsp?name=<%= name1 %>"><%=name1 %></a></i> </b> is posted a post in <%=region %>  <%=emotion %></span><a href="Saved?head=<%= head %>">(Save)</a>
        <% if (base64Image != null) { %>
            <img src="data:image/jpeg;base64, <%= base64Image %>" alt="Image" width="100%" height="600px;"/>
        <% } else { %>
            <p>No image available</p>
        <% } %>
        <h5 class="heading"><%= head %></h5>
        <p><%= email %></p>
        <div class="date"><i style="color:white;"><%= time %></i></div>
    </div>
        <%
            }
        %>
    
</main>


<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
