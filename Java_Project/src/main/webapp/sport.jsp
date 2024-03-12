<%@ include file="head.jsp" %>
    <%    
      
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
            ps = conn.prepareStatement("SELECT name,content, image,region,emotion,title,date,profile FROM admin_dashboard where region='Sport' ORDER BY Id DESC");
            rs = ps.executeQuery();    
    %>
  <%@ include file="boddy.jsp"%>
