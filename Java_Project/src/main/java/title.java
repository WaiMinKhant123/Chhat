import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/title")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class title extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 HttpSession session = request.getSession();
        String name1 = (String) session.getAttribute("loggedInUser");
        
       Part filePart = request.getPart("image");
       InputStream inputStream = null;
       if (filePart != null) {
           inputStream = filePart.getInputStream();
       }
      String name=request.getParameter("name");
       try {
    	  
           Class.forName("com.mysql.cj.jdbc.Driver");
          
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
          
           PreparedStatement ps = conn.prepareStatement("update login set name=?,image=? where name=?");
           ps.setString(1, name);
           ps.setBlob(2, inputStream);
           ps.setString(3, name1);
           ps.executeUpdate();
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note","root","");
           PreparedStatement ps1 = con.prepareStatement("update admin_dashboard set name=? where name=?");
           ps1.setString(1, name);
         
           ps1.setString(2, name1);
           ps1.executeUpdate();
           PreparedStatement ps2 = con.prepareStatement("update chat set sender=? where sender=?");
           ps2.setString(1, name);       
           ps2.setString(2, name1);
           ps2.executeUpdate();
           PreparedStatement ps3 = con.prepareStatement("update chat set resend=? where resend=?");
           ps3.setString(1, name);       
           ps3.setString(2, name1);
           ps3.executeUpdate();
          
          
            response.sendRedirect("Login_form.html");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            
                   
              
        }
    }
}
