import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/title1")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class title1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
         String name =null;
        Part filePart = request.getPart("image");
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
       
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement ps = con.prepareStatement("");
            if (inputStream != null) {
                ps.setBlob(1, inputStream);
            } else {
                ps.setBlob(1, (Blob) null);
            }
            ps.executeUpdate();
            response.sendRedirect("Admin_dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
