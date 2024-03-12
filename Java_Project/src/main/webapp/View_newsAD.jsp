<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View News</title>
</head>
 <link rel="stylesheet" href="style_home.css">
    <link rel="stylesheet" href="styleheader.css">
<body>
    <h1>View News Details</h1>
   
       <div class="item" style="background-color:black;">

      <span class="textpop"> <b><i><%=  request.getAttribute("name") %></i> </b> is posted a news in <%=request.getAttribute("region") %> </span>
       
        <h5 class="heading"><%=request.getAttribute("title") %></h5>
        <p><%= request.getAttribute("content") %></p>
        <div class="date"><%= request.getAttribute("date") %></div>
    </div>
    
    <a href="mananageAD.jsp">Back</a>
</body>
</html>
