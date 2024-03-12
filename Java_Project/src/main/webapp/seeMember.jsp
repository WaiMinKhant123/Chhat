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
 <header><a href="HomeAd.jsp">Back</a><h3>Users</h3><a href="as"></a></header>
<div class="Formmen">
   
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
        </tr>
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
                    String email = rs.getString("email");
                    String password = rs.getString("password");
        %>  
        <tr>
           <td> <a href="profileinfoAD.jsp?name=<%= name1 %>"><%=name1 %></a></td>
            <td><%= email %></td>
            <td><%= password %></td>
        </tr>
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
    </table>
</div>

</body>
</html>
