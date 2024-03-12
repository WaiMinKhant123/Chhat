<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="styleheader.css">
<script type="text/javascript">

function toggleForm() {
    var form = document.getElementById("profile-form");
    if (form.style.display === "block") {
        form.style.display = "none";
    } else {
        form.style.display = "block";
    }
}
    
</script>
</head>
<body>
<div class="h12">
<%
Connection conn = null;
PreparedStatement ps = null;
PreparedStatement ps1 = null;
ResultSet rs1=null;
ResultSet rs = null;
HttpSession session1 = request.getSession();
String name = (String) session.getAttribute("loggedInUser");
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
    ps = conn.prepareStatement("Select name,image from login where name=?");
    ps.setString(1, name);
    rs = ps.executeQuery();    
    while (rs.next()) {   
        String name1=rs.getString("name");
        byte[] imageData1 = rs.getBytes("image");
        String base64Image1 = (imageData1 != null) ? java.util.Base64.getEncoder().encodeToString(imageData1) : null;
%>
<header>
    <nav>
        <ul>
            <li class="dropdown">
                <a href="#" class="dropbtn">Categories</a>
                <div class="dropdown-content">
                    <a href="Home.jsp">Lastest</a>
                    <a href="local.jsp">Local</a>
                    <a href="inter.jsp">International</a>
                    <a href="sport.jsp">Sport</a>
                    <a href="eco.jsp">Economics</a>
                    <a href="BandH.jsp">Beauty/Health</a>
                    <a href="artists.jsp">Artists</a>
                    <a href="enter.jsp">Entertainment</a>
                </div>
            </li>
            
            <li><a href="chatMen.jsp">Users</a></li>
            <li><a href="cxat.jsp">Chat</a></li>
            <li><a href="Saved.jsp">Saved Posts</a></li>           
            <li><a href="about.jsp">Contact us</a></li>
            
        </ul>
    </nav>
    <h3><b><i><%= name1 %></i></b></h3> 
    <% if (base64Image1 != null) { %>
        <div class="profile-container">
            <img class="circular-image" src="data:image/jpeg;base64, <%= base64Image1 %>" alt="Image" style="width: 70px; height: 70px; margin-right:40px; border-radius:50%;" onclick="toggleForm()">
            <form id="profile-form" class="form-container">
                <a href="add.jsp">Add Posts</a><br><br>
                <a href="managenews.jsp">Manage Posts</a> <br><br>
                <a href="editinfo.jsp">Edit Info</a> <br><br>              
                <a href="Login_form.html">Log Out</a> 
            </form>
        </div>
    <% } else { %>
        <p>No image available</p>
    <% } %>
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
</header>
</div>
</body>
</html>
