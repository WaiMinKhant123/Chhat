import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/Admin_Dashboard")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class Admin_Dashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addNews(request, response);
                    break;
                case "edit":
                    editNews(request, response);
                    break;
                case "view":
                	viewNews(request, response);
                default:
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "delete":
                    deleteNews(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "view":
                	viewNews(request, response);
                default:
                 
            }
        }
    }
    private void addNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String region = request.getParameter("region");
        String emotion = request.getParameter("emotion");
        String content = request.getParameter("content");
        Part filePart = request.getPart("image");
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
       
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("loggedInUser");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement ps1=con.prepareStatement("select name,image from login where name=?");
            ps1.setString(1, name);
            ResultSet rs1 = ps1.executeQuery();
            byte[] profileImage = null;

            if (rs1.next()) {
                Blob imageBlob = rs1.getBlob("image");
                if (imageBlob != null) {
                   
                    profileImage = imageBlob.getBytes(1, (int) imageBlob.length());
                }
            }
     
            	    LocalDateTime myDateObj = LocalDateTime.now();
            	   
            	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E,dd-MM-yyyy HH:mm:ss");

            	    String formattedDate = myDateObj.format(myFormatObj);
       
            	  
            	
            PreparedStatement ps = con.prepareStatement("INSERT INTO admin_dashboard (name, title, image, region,emotion,date,content,profile) VALUES (?, ?, ?, ?, ?, ?,?,?)");
            ps.setString(1, name);
            ps.setString(2, title);
            if (inputStream != null) {
                ps.setBlob(3, inputStream);
            } else {
                ps.setBlob(3, (Blob) null);
            }
            ps.setString(4, region);
            ps.setString(5, emotion);
            ps.setString(6, formattedDate);
            ps.setString(7, content); 
            ByteArrayInputStream inputStream1 = new ByteArrayInputStream(profileImage);
            ps.setBlob(8, inputStream1);

            ps.executeUpdate();
            response.sendRedirect("Home.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }

    private void editNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String region = request.getParameter("region");
        
        
        LocalDateTime myDateObj = LocalDateTime.now();
 	   
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E,dd-MM-yyyy HH:mm:ss");

	    String date = myDateObj.format(myFormatObj);

        
        
        
        
       
        String content = request.getParameter("content");
        Part filePart = request.getPart("image"); 
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
                PreparedStatement ps = con.prepareStatement("UPDATE admin_dashboard SET title = ?, image = ?, region = ?, date = ?, content = ? WHERE id = ?");
                ps.setString(1, title);
                if (inputStream != null) {
                    ps.setBlob(2, inputStream);
                } else {
                    ps.setBlob(2, (Blob) null);
                }
                ps.setString(3, region);
                ps.setString(4, date);
                ps.setString(5, content);
                ps.setString(6, id);
                
            ps.executeUpdate();
            response.sendRedirect("managenews.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }

    private void deleteNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsId = request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");

            PreparedStatement ps = con.prepareStatement("DELETE FROM admin_dashboard WHERE id = ?");
            ps.setString(1, newsId);
            ps.executeUpdate();

            
            response.sendRedirect("managenews.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void viewNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsId = request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");

            PreparedStatement ps = con.prepareStatement("select * from admin_dashboard WHERE id = ?");
            ps.setString(1, newsId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("region", rs.getString("region"));
                request.setAttribute("date", rs.getString("date"));
                request.setAttribute("content", rs.getString("content"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("content", rs.getString("content"));
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("view_news.jsp");
                dispatcher.forward(request, response);
            } else {
               
                response.getWriter().println("News not found");
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_note", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin_dashboard WHERE id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("newsId", rs.getInt("id"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("region", rs.getString("region"));
                request.setAttribute("date", rs.getString("date"));
                request.setAttribute("content", rs.getString("content"));
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            }

            else {
              
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }}