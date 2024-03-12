import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = null;
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement ps = con.prepareStatement("select name,email,password from adminlogin where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
             
                String dbPassword = rs.getString("password");
               
                if (password.equals(dbPassword)) {
                	HttpSession session = request.getSession(); 
            	    session.setAttribute("loggedInAdminUser", rs.getString("name"));
                    response.sendRedirect("HomeAd.jsp");
                } else {
                    
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<html><body>");
                    out.println("<h3 style=\"color:red;\">Login failed. Invalid email or password.</h3>");
                    out.println("</body></html>");
                }
            } else {
               
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h3 style=\"color:red;\">Login failed. Invalid email or password.</h3>");
                out.println("</body></html>");
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
