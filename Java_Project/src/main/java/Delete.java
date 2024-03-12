import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class Delete extends HttpServlet {

    private static final long serialVersionUID = 1L;

    	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	       
    	
    	String newId = request.getParameter("newsId"); 
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");

            PreparedStatement ps = con.prepareStatement("DELETE FROM chat WHERE Id = ?");
            ps.setString(1, newId);
            ps.executeUpdate();

            response.sendRedirect("Chat.jsp"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}