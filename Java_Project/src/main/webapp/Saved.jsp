<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Note Taking App</title>
    
    <link rel="stylesheet" href="stylehead.css">
</head>
<body>
  <script type="text/javascript">
  
        function fetchDataAndPopulateDivs() {
            fetch('Admin_Dashboard')
            .then(response => response.json())
            .then(data => {
                const body = document.body;

                data.forEach(item => {
                    const div = document.createElement('div');
                    div.classList.add('item');

                    const profileImg = document.createElement('img');
                    profileImg.src = 'data:image/jpeg;base64,' + item.ImageData3;
                    profileImg.alt = 'Profile Image';

                    const img = document.createElement('img');
                    img.src = 'data:image/jpeg;base64,' + item.imageData;
                    img.alt = 'Image';

                    const h5 = document.createElement('h5');
                    h5.classList.add('heading');
                    h5.textContent = ''; // Add your heading text here

                    const p = document.createElement('p');
                    p.textContent = item.content; // Add your content text here

                    div.appendChild(profileImg);
                    div.appendChild(img);
                    div.appendChild(h5);
                    div.appendChild(p);

                    body.appendChild(div);
                });
            })
            .catch(error => console.error('Error fetching data:', error));
        }

        window.addEventListener('load', fetchDataAndPopulateDivs);
    </script>
    <div class="Head"><a href="Home.jsp">Back</a><h3>Here your Saved Posts</h3><a></a></div>
    <%    
    HttpSession session3 = request.getSession();
    String name23 = (String) session.getAttribute("loggedInUser");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
            PreparedStatement ps5 = conn.prepareStatement("SELECT  Header, date FROM Saved WHERE name = ?");
            ps5.setString(1, name23);

            ResultSet rs5 = ps5.executeQuery(); 
            while (rs5.next()) { 
              
                String Header3 = rs5.getString("Header");
                String Datte = rs5.getString("date");

                PreparedStatement ps35 = conn.prepareStatement("SELECT * FROM admin_dashboard WHERE  title = ?");
                
                ps35.setString(1, Header3);
                ResultSet rs21 = ps35.executeQuery();

            
                while (rs21.next()) { 
                	String name1=rs21.getString("name");
                    byte[] imageData = rs21.getBytes("image");
                    String email = rs21.getString("content");
                    String head=rs21.getString("title");
                    String time=rs21.getString("date");               
                    String region=rs21.getString("region");
                    String emotion=rs21.getString("emotion");
                    byte[] imageData3= rs21.getBytes("profile");
                    String base64Image = (imageData != null) ? java.util.Base64.getEncoder().encodeToString(imageData) : null;
                    String base64Image3 = (imageData3 != null) ? java.util.Base64.getEncoder().encodeToString(imageData3) : null;
            %>
            <div class="h"><b style="text-align:center;"> You saved this post at <%=Datte %> </b></div>
           <div class="item" style="background-color:black;">
          
                 <div class="profile">
            <img src="data:image/jpeg;base64, <%= base64Image3 %>" alt="Image3" class="profile-image"/>
        </div>
          <span class="textpop"> <b><i><a href="profileinfo.jsp?name=<%= name1 %>"><%=name1 %></a></i> </b> is posted a news in <%=region %>  <%=emotion %></span><a href="Del?head=<%= head %>">(Delete)</a>
            <% if (base64Image != null) { %>
                <img src="data:image/jpeg;base64, <%= base64Image %>" alt="Image" width="100%"/>
            <% } else { %>
                <p>No image available</p>
            <% } %>
            <h5 class="heading"><%= head %></h5>
            <p><%= email %></p>
            <div class="date"><%= time %></div>
        </div>
        
            <%
                }
            %>
   
    <%
            } } catch (Exception e) {
            e.printStackTrace();
        } finally {
           
        }
    %>

    </body>
    </html>
