import jakarta.servlet.http.HttpServlet;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/Saved")
public class Saved extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String head = request.getParameter("head");
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("loggedInUser");
        LocalDateTime myDateObj = LocalDateTime.now();

        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E,dd-MM-yyyy HH:mm:ss");
        String date = myDateObj.format(myFormatObj);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement ps = con.prepareStatement("INSERT INTO saved (name, Header, date) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, head);
            ps.setString(3, date);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("Saved.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
