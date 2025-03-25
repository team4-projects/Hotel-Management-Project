package controller;

import dao.BookingDAO;
import model.Room;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchAvailableRoomsServlet", urlPatterns = {"/SearchAvailableRooms"})
public class SearchAvailableRoomsServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            // Lấy ngày check-in và check-out từ form
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");

            // Chuyển đổi String sang Date
            Date checkIn = Date.valueOf(checkInStr);
            Date checkOut = Date.valueOf(checkOutStr);

            // Tìm các phòng trống
            ArrayList<Room> availableRooms = bookingDAO.getAvailableRooms(checkIn, checkOut);

            // Lưu kết quả vào request
            request.setAttribute("availableRooms", availableRooms);
            request.setAttribute("checkIn", checkInStr);
            request.setAttribute("checkOut", checkOutStr);

            // Chuyển hướng đến trang hiển thị kết quả
            request.getRequestDispatcher("SearchResults.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("DP.jsp?error=invalid_date");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
} 