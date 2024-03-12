<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit News</title>
    
    <link rel="stylesheet" href="style2.css">
    
</head>
<body>
<header>
    <h1>Here You Can Edit Your News</h1>
    <nav>
        <ul>
            <li><a href="mananageAD.jsp">Back</a></li>
           
        </ul>
    </nav>
</header>
    <form action="Admin_Dashboard?action=edit" method="post" enctype="multipart/form-data">
       
       <div class="Add_file"> <h1>Edit News</h1>
       <input type="hidden" name="id" value="<%= request.getAttribute("newsId") %>">
        <label for="title"><b>Title:</b></label><br>
        <input type="text" id="title" name="title" value="<%= request.getAttribute("title") %>" required><br><br>
         <label for="ImaGe"><b>Image:</b></label><br>
        <input type="file" id="imge" name="image" required><br><br>
        <label for="title"><b>Category:</b></label><br>
        
    <input type="radio" id="local" name="region" value="Local" <% if ("Local".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="Local">local</label><br>
    
    <input type="radio" id="inter" name="region" value="Inter" <% if ("Inter".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="Inter">inter</label><br>
    
    <input type="radio" id="sport" name="region" value="Sport" <% if ("Sport".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="Sport">sport</label><br>
    
    <input type="radio" id="economy" name="region" value="Economy" <% if ("Economy".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="Economy">economy</label><br>
    
    <input type="radio" id="bandh" name="region" value="Beauty/Health" <% if ("Beauty/Health".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="BandH">beauty/health</label><br>
    
    <input type="radio" id="artists" name="region" value="Artists" <% if ("Artists".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="artists">artists</label><br>
    
    <input type="radio" id="entertain" name="region" value="Entertainment" <% if ("Entertainment".equals(request.getAttribute("region"))) { %>checked<% } %>>
    <label for="entertain">entertainment</label><br><br>
    
    
   <label for="date"><b>Date (yyyy/mm/dd):</b></label>
<input type="text" id="date" name="date" pattern="\d{4}/\d{1,2}/\d{1,2}" placeholder="yyyy/mm/dd" value="<%= request.getAttribute("date") %>" required><br><br>



        <label for="content"><b>Content:</b></label><br><br>
        <textarea id="content" name="content" rows="4" cols="50" required><%= request.getAttribute("content") %></textarea><br><br>
        <input type="reset" name="reset" value="Reset" class="delete-link">
         <input type="submit" name="submit" value="Submit" class="delete-link">
       </div>
    </form>
</body>
</html>
