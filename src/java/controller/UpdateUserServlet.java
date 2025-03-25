package controller;

import dao.UserDAO;
import model.Users;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/updateUser"})
public class UpdateUserServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // Lấy thông tin từ form
            int idUser = Integer.parseInt(request.getParameter("idUser"));
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int idRole = Integer.parseInt(request.getParameter("idRole"));
            
            // Tạo đối tượng Users với thông tin mới
            Users user = new Users(idUser, name, password, email, phone, idRole);
            
            // Cập nhật thông tin
            UserDAO userDAO = new UserDAO();
            int result = userDAO.update(user);
            
            if (result > 0) {
                // Cập nhật thành công
                response.sendRedirect("QuanLyUser.jsp?success=1");
            } else {
                // Cập nhật thất bại
                response.sendRedirect("QuanLyUser.jsp?error=1");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("QuanLyUser.jsp?error=2");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
} 