import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/Login_form")
public class Login_form extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = null;
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement ps = con.prepareStatement("select name,email,password from login where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                String dbPassword = rs.getString("password");
               
                if (password.equals(dbPassword)) {
                    
                	 HttpSession session = request.getSession(); 
                	    session.setAttribute("loggedInUser", rs.getString("name"));
                	    HttpSession session1 = request.getSession(); 
                	    session.setAttribute("loggedInUser", rs.getString("name"));
                	    HttpSession session3 = request.getSession(); 
                	    session.setAttribute("loggedInUser", rs.getString("name"));
                	   
                    response.sendRedirect("Home.jsp");
                } else {
                	 response.sendRedirect("Loginerror.jsp");                 
                }
            }  else {
               	 response.sendRedirect("Loginerror.jsp"); 
                   
               }
            
            ps.close();
            con.close();}
         catch (Exception e) {
            System.out.println(e);
        }
    }
}
