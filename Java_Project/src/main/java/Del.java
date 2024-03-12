import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Del")
public class Del extends HttpServlet {

    private static final long serialVersionUID = 1L;

    	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	       
    	
    	String head = request.getParameter("head"); 
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");

            PreparedStatement ps = con.prepareStatement("DELETE FROM saved WHERE Header = ?");
            ps.setString(1, head);
            ps.executeUpdate();

            response.sendRedirect("Saved.jsp"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}