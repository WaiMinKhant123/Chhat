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
 <header><div class="#"><a href="Home.jsp">Back</a></div><div class="$"><h3>Users</h3></div><div class="S"></div></header>
<div class="Formmen">
  
        <%  
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
                ps = conn.prepareStatement("SELECT * FROM login ORDER BY name DESC");
                rs = ps.executeQuery();	
                
                while (rs.next()) {   
                    String name1 = rs.getString("name");
              
                    
        %>  
        <div class="PProfile"><div class="user-name"><a href="profileinfo.jsp?name=<%= name1 %>"><b style="text-align:center;"><%=name1 %></b></a></div></div>        
      
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
