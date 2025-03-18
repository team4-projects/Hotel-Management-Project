/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.User_FoodDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User_Food;
import model.Users;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "OrderFoodServlet", urlPatterns = {"/OrderFoodServlet"})
public class OrderFoodServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderFoodServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderFoodServlet at " + request.getContextPath() + "</h1>");
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
            request.setAttribute("error", "* Vui lòng đăng nhập trước khi đặt món");
            RequestDispatcher rdd = getServletContext().getRequestDispatcher("/DN.jsp");
            rdd.forward(request, response);
            return;
        }
        
        Users u =(Users) session.getAttribute("users");
        
        String foodId = request.getParameter("foodId");
        String totalPrice = request.getParameter("totalPrice");
        String quantity = request.getParameter("quantity");
        
        User_FoodDAO ufd = new User_FoodDAO();
        User_Food uf = new User_Food();
        
        uf.setIdFood(Integer.parseInt(foodId));
        uf.setIdUser(u.getIdUser());
        uf.setSumPrice(Double.parseDouble(totalPrice));
        uf.setQuantity(Integer.parseInt(quantity));
        
        String url = "";
        
        if(ufd.insert(uf) > 0){
            url = "/index.jsp";
        }else{
            url = "/order.jsp";
        }
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);    
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
