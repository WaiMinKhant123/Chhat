import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.mysql.jdbc.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Chat")
public class Chat extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	String name5 = request.getParameter("name5"); 
    	HttpSession session1 = request.getSession();
		String sender = (String) session1.getAttribute("loggedInUser");
		String text=request.getParameter("content");
		
		  LocalDateTime myDateObj = LocalDateTime.now();
   	   
  	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E,dd-MM-yyyy HH:mm:ss");

  	    String formattedDate = myDateObj.format(myFormatObj);
  	 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");

            PreparedStatement ps = con.prepareStatement("insert into chat(sender,resend,content,date) values (?,?,?,?)");
            ps.setString(1, sender);
            ps.setString(2, name5);
            ps.setString(3, text);
            ps.setString(4, formattedDate);
            ps.executeUpdate();                   
            response.sendRedirect("profileinfo.jsp"); 
       }
            catch (Exception e) {
            e.printStackTrace();
        }
    }

}
