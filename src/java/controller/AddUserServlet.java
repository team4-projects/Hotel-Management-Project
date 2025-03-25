package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import java.io.IOException;

@WebServlet(name = "AddUserServlet", urlPatterns = {"/addUser"})
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            
            // Validate dữ liệu
            if(name == null || name.trim().isEmpty() ||
               password == null || password.trim().isEmpty() ||
               email == null || email.trim().isEmpty() ||
               phone == null || phone.trim().isEmpty()) {
                response.sendRedirect("QuanLyUser.jsp?error=missing_data");
                return;
            }
            
            // Tạo đối tượng Users mới
            Users newUser = new Users();
            newUser.setName(name);
            newUser.setPassWord(password);
            newUser.setEmail(email);
            newUser.setPhone(phone);
            newUser.setIdRole(1); // Mặc định là USER
            
            // Thêm vào database
            UserDAO userDAO = new UserDAO();
            int result = userDAO.insert(newUser);
            
            if(result > 0) {
                response.sendRedirect("QuanLyUser.jsp?success=add");
            } else {
                response.sendRedirect("QuanLyUser.jsp?error=add_failed");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("QuanLyUser.jsp?error=system_error");
        }
    }
} 