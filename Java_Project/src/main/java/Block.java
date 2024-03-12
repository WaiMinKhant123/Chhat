import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Block")
public class Block extends HttpServlet {

    private static final long serialVersionUID = 1L;

    	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	        String action = request.getParameter("action");

    	        if (action != null) {
    	            switch (action) {
    	                case "block":
    	                    Blocks(request, response);
    	                    break;
    	                case "view":
    	                	viewNews(request, response);
    	                default:
    	                 
    	            }
    	        }
    	    }
    	  
    	  
    	  private void Blocks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String name = request.getParameter("name"); 
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");

            PreparedStatement ps = con.prepareStatement("DELETE FROM admin_dashboard WHERE name = ?");
            ps.setString(1, name);
            ps.executeUpdate();

            PreparedStatement ps1 = con.prepareStatement("DELETE FROM login WHERE name = ?");
            ps1.setString(1, name);
            ps1.executeUpdate();
            
            PreparedStatement ps2= con.prepareStatement("DELETE FROM chat WHERE sender=? or resend=?");
            ps2.setString(1, name);
            ps2.setString(2, name);
            
            ps2.executeUpdate();
            response.sendRedirect("seeMember.jsp"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

private void viewNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
}}
