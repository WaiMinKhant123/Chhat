<%@ page import="java.io.*, java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*, java.sql.Blob" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
<link rel="stylesheet" href="style2.css">
</head>
<body>
 <header><div class="#"><a href="Home.jsp">Back</a></div><div class="$"><h3>Chat with another users</h3></div><div class="S"></div></header>
<div class="Formmen">
  
        <%  
        HttpSession session1 = request.getSession();
        String sender1 = (String) session1.getAttribute("loggedInUser");
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
                ps = conn.prepareStatement("SELECT * FROM chat where sender=? or resend=? order by Id desc");
                ps.setString(1,sender1);
                ps.setString(2,sender1);
                rs = ps.executeQuery();	
                
                while (rs.next()) {   
                    String name1 = rs.getString("sender");
                    String name2=rs.getString("resend");               
                    String date=rs.getString("date");
                    
              
                    
        %>  
        <div class="PProfile"><div class="user-name">"<%=date %>"<a href="Chat.jsp?name5=<%= name1 %>"><%=name1 %></a>send a message to  <a href="Chat.jsp?name5=<%= name2 %>"><%=name2 %></a></div></div>        
      
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
   
</div>

</body>
</html>
