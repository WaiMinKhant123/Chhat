import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@jakarta.servlet.annotation.WebServlet("/View")
public class View extends jakarta.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String newsId = request.getParameter("id");

        if ("view".equals(action) && newsId != null) {
            try {
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
                
                
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin_dashboard WHERE id=?");
                ps.setString(1, newsId);
                
               
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    
                    request.setAttribute("news", rs);
                    
                    request.getRequestDispatcher("view_news.jsp").forward(request, response);
                } else {
                   
                    response.getWriter().println("News not found");
                }
                
                
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e) {
                // Handle SQL exception
                e.printStackTrace();
                response.getWriter().println("Error retrieving news details");
            }
        } else {
            // Invalid request
            response.getWriter().println("Invalid request");
        }
    }
}
