import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/Acc_Create")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class Acc_Create extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Part filePart = request.getPart("image");
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("acte1.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement checkStmt = con.prepareStatement("SELECT COUNT(*) FROM login WHERE email = ?");
            checkStmt.setString(1, email);           
            ResultSet rs = checkStmt.executeQuery();
            PreparedStatement checkStmt2 = con.prepareStatement("SELECT COUNT(*) FROM login WHERE name= ?");
            checkStmt2.setString(1, name);           
            ResultSet rs1 = checkStmt2.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                response.sendRedirect("acte2.jsp");
            }
            else  if (rs1.next() && rs1.getInt(1) > 0) {
                response.sendRedirect("error3.jsp");
            }
            else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO login(name,email,password,image) VALUES (?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                if (inputStream != null) {
                    ps.setBlob(4, inputStream);
                } else {
                    ps.setBlob(4, (Blob) null);
                }
                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("Login_form.html");
                } else {
                    response.sendRedirect("Login_form.html");
                }
            }
            rs.close();
            checkStmt.close();           
            rs1.close();
            checkStmt2.close();
            con.close();   
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.html");
        }
    }
}
