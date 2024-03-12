 <%@ include file="head.jsp"%>
 <%
   
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
        ps = conn.prepareStatement("SELECT name,content, image,region, title, date FROM admin_dashboard WHERE region='Entertainment' ORDER BY Id DESC");
        rs = ps.executeQuery();
       
%>
<%@ include file="boddy.jsp"%>