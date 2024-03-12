<%@ page import="java.io.*, java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*, java.sql.Blob" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Chat Application</title>
    <link rel="stylesheet" href="chatt.css">
    
</head>

<body>
<header><a href="profileinfo.jsp" class="back">Back</a><h2 style="text-align:center">Send Message</h2><div></div></header>

<div class="container">
    <div class="chat-area" id="chatArea">
        
        <%
            String name21 = request.getParameter("name5");
            HttpSession session1 = request.getSession();
            String sender1 = (String) session1.getAttribute("loggedInUser");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM chat WHERE (sender=? AND resend=?) OR (sender=? AND resend=?) ORDER BY Id");
                ps.setString(1, name21);
                ps.setString(2, sender1);
                ps.setString(3, sender1);
                ps.setString(4, name21);
                ResultSet rs = ps.executeQuery(); 

                while (rs.next()) {
                    String sender = rs.getString("sender");
                    String receiver = rs.getString("resend");
                    String date = rs.getString("date");
                    String content = rs.getString("content");
                        int newsId = rs.getInt("Id");
        %>
            <div class="message" style="padding: 5px;">
                <b><%= sender %></b> sent <b><%= receiver %></b> at <%= date %><div class="del"><a href="Delete?&newsId=<%= newsId %>">delete</a></div>
                <br><i>"<%= content %>"</i>
            </div>
        <%
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>

<form action="Chat" method="get" enctype="multipart/form-data" class="send-message">
    <input type="hidden" name="name5" value="<%= name21 %>">
   <textarea id="content" name="content" rows="2" cols="20" required></textarea>     
    <input type="submit" name="submit" value="Submit" class="delete-link" id="delete-link">
    
    </form>

</body>
</html>
