<%@ include file="head.jsp" %>
    <%    
    String name2 = request.getParameter("name");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
            ps = conn.prepareStatement("SELECT name,content, image,region,emotion,title,date,profile FROM admin_dashboard where name=? ORDER BY Id DESC");
            ps.setString(1, name2);
            rs = ps.executeQuery();    
    %>
  <%@ include file="boddy.jsp"%>
