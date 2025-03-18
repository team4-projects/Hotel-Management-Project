/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import dao.RoomDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Booking;
import model.Room;
import model.Users;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "BookRoomServlet", urlPatterns = {"/BookRoomServlet"})
public class BookRoomServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Không tạo session mới nếu chưa có
        if (session == null || session.getAttribute("users") == null) {
            request.setAttribute("error", "* Vui lòng đăng nhập trước khi đặt phòng");
            RequestDispatcher rdd = getServletContext().getRequestDispatcher("/DN.jsp");
            rdd.forward(request, response);
            return;
        }

        Users u = (Users) session.getAttribute("users");

        String roomId = request.getParameter("roomId");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        Booking b = new Booking();
        b.setIdUser(u.getIdUser());
        b.setIdRoom(Integer.parseInt(roomId));
        b.setCheckInDate(Date.valueOf(checkIn));
        b.setCheckOutDate(Date.valueOf(checkOut));

        String url = "";
        BookingDAO bkd = new BookingDAO();
        
        // Kiểm tra phòng có trống trong khoảng ngày này không
        boolean isAvailable = bkd.isRoomAvailable(Integer.parseInt(roomId), Date.valueOf(checkIn), Date.valueOf(checkOut));

        if (!isAvailable) {
            request.setAttribute("error", "Phòng này đã được đặt trong khoảng thời gian này. Vui lòng chọn ngày khác!");
            RequestDispatcher rdd = getServletContext().getRequestDispatcher("/DDP.jsp");
            rdd.forward(request, response);
            return;
        }

        int result = bkd.insert(b);

        if (result > 0) {
            request.setAttribute("message", "Đặt phòng thành công!");
            url = "/index.jsp";
        } else {
            request.setAttribute("error", "Đặt phòng thất bại. Vui lòng thử lại.");
            url = "/DDP.jsp";
        }

        RequestDispatcher rdd = getServletContext().getRequestDispatcher(url);
        rdd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
