<%-- 
    Document   : QuanLyDonThucAn
    Created on : Mar 6, 2025, 8:07:35 PM
    Author     : ASUS
--%>

<%@page import="dao.FoodDAO"%>
<%@page import="model.Food"%>
<%@page import="model.Users"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.User_Food"%>
<%@page import="dao.User_FoodDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản Lý Đơn Thức Ăn</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- AOS Animation -->
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">

        <!-- Custom Styles -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            
            :root {
                --gold-primary: #FFD700;
                --gold-secondary: #DAA520;
                --gold-light: rgba(255, 215, 0, 0.15);
                --gold-bright: #FFC107;
                --gold-border: rgba(255, 215, 0, 0.5);
                --red-danger: #FF4136;
                --bg-dark: #0A0A0A;
            }

            body {
                background-color: var(--bg-dark);
                color: var(--gold-primary);
                font-family: 'Poppins', sans-serif;
                background-image: 
                    radial-gradient(circle at 25% 25%, rgba(255, 215, 0, 0.05) 2%, transparent 5%),
                    radial-gradient(circle at 75% 75%, rgba(255, 215, 0, 0.05) 2%, transparent 5%);
                background-size: 100px 100px;
            }

            .page-container {
                max-width: 1100px;
                margin: 50px auto;
                padding: 0 15px;
            }

            .admin-header {
                padding: 30px 0 10px;
                border-bottom: 1px solid var(--gold-border);
                margin-bottom: 30px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .admin-title {
                font-size: 2.2rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 2px;
                position: relative;
            }

            .admin-title:after {
                content: '';
                position: absolute;
                width: 60%;
                height: 3px;
                background: linear-gradient(90deg, var(--gold-primary), transparent);
                bottom: -10px;
                left: 0;
            }

            .content-card {
                background: var(--gold-light);
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 0 25px rgba(255, 215, 0, 0.15);
            }

            .table-container {
                overflow-x: auto;
                margin-top: 20px;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }

            .food-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
            }

            .food-table thead tr {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .food-table thead th {
                padding: 15px 12px;
                text-align: center;
                font-size: 0.9rem;
            }

            .food-table tbody tr {
                border-bottom: 1px solid rgba(255, 215, 0, 0.1);
                transition: all 0.3s ease;
            }

            .food-table tbody tr:hover {
                background-color: rgba(255, 215, 0, 0.05);
                transform: scale(1.005);
            }

            .food-table td {
                padding: 15px 12px;
                vertical-align: middle;
                text-align: center;
                font-size: 0.9rem;
            }

            .action-btn {
                padding: 8px 15px;
                border-radius: 8px;
                border: none;
                cursor: pointer;
                font-weight: 500;
                font-size: 0.8rem;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                margin: 0 3px;
            }

            .delete-btn {
                background-color: rgba(255, 65, 54, 0.2);
                color: var(--red-danger);
            }

            .delete-btn:hover {
                background-color: var(--red-danger);
                color: white;
                transform: scale(1.05);
                box-shadow: 0 0 10px rgba(255, 65, 54, 0.5);
            }

            .pay-btn {
                background-color: rgba(46, 204, 113, 0.2);
                color: #2ECC71;
            }

            .pay-btn:hover {
                background-color: #2ECC71;
                color: white;
                transform: scale(1.05);
                box-shadow: 0 0 10px rgba(46, 204, 113, 0.5);
            }

            .btn-icon {
                margin-right: 5px;
            }

            .back-btn {
                background: linear-gradient(45deg, var(--gold-primary), var(--gold-secondary));
                color: black;
                border: none;
                padding: 12px 25px;
                border-radius: 30px;
                font-weight: 600;
                font-size: 1rem;
                text-transform: uppercase;
                letter-spacing: 1px;
                display: inline-flex;
                align-items: center;
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(218, 165, 32, 0.3);
            }

            .back-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 25px rgba(255, 215, 0, 0.4);
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
            }

            .back-btn i {
                margin-right: 10px;
            }

            .modal-content {
                background: var(--gold-light);
                border: 1px solid var(--gold-border);
                color: var(--gold-primary);
            }

            .modal-header {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
                border-bottom: none;
            }

            .modal-footer {
                border-top: none;
            }

            .restricted-container {
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: radial-gradient(circle at center, rgba(255, 215, 0, 0.05) 0%, transparent 70%);
            }

            .restricted-content {
                border: 2px solid var(--gold-primary);
                padding: 50px;
                border-radius: 20px;
                text-align: center;
                background: rgba(0, 0, 0, 0.7);
                box-shadow: 0 0 30px rgba(255, 215, 0, 0.3);
                max-width: 90%;
                width: 500px;
            }

            .restricted-icon {
                font-size: 50px;
                color: var(--red-danger);
                margin-bottom: 20px;
            }

            .restricted-title {
                font-size: 28px;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 15px;
            }

            .countdown-text {
                margin: 20px 0;
                font-size: 18px;
            }

            .countdown-number {
                display: inline-block;
                width: 40px;
                height: 40px;
                line-height: 40px;
                background: var(--gold-primary);
                color: black;
                border-radius: 50%;
                font-weight: 700;
                margin: 0 5px;
            }

            .return-home {
                display: inline-block;
                background: linear-gradient(45deg, var(--gold-primary), var(--gold-secondary));
                color: black;
                padding: 12px 25px;
                border-radius: 30px;
                text-decoration: none;
                font-weight: 600;
                letter-spacing: 1px;
                margin-top: 20px;
                transition: all 0.3s ease;
            }

            .return-home:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(255, 215, 0, 0.3);
                color: black;
            }

            @media (max-width: 768px) {
                .admin-title {
                    font-size: 1.8rem;
                }
                .food-table thead th {
                    font-size: 0.8rem;
                }
                .action-btn {
                    margin: 5px 0;
                }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-row {
                animation: fadeInUp 0.5s ease forwards;
            }
        </style>
    </head>
    <body onload="AOS.init();">
        <%
            Users u2 = (Users) session.getAttribute("users");
            if (u2 != null && u2.getIdRole() == 2) {
        %>
        <div class="page-container">
            <div class="admin-header animate__animated animate__fadeIn">
                <h2 class="admin-title">Quản Lý Đơn Thức Ăn</h2>
                <div class="user-info">
                    <span><i class="fas fa-user-shield me-2"></i><%= u2.getName() %></span>
                </div>
            </div>

            <div class="content-card" data-aos="fade-up">
                <div class="table-container">
                    <table class="food-table" id="foodTable">
                        <thead>
                            <tr>
                                <th>ID Đơn</th>
                                <th>Khách Hàng</th>
                                <th>Món Ăn</th>
                                <th>Số Lượng</th>
                                <th>Tổng Tiền</th>
                                <th>Xóa</th>
                                <th>Thanh Toán</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                User_FoodDAO ufd = new User_FoodDAO();
                                UserDAO ud = new UserDAO();
                                int delay = 100;
                                for (User_Food uf : ufd.selectAll()) {
                                    delay += 50;
                                    Users u = new Users();
                                    u.setIdUser(uf.getIdUser());
                                    FoodDAO fd = new FoodDAO();
                                    Food f = new Food();
                                    f.setIdFood(uf.getIdFood());
                            %>
                            <tr class="animate-row" style="animation-delay: <%= delay %>ms">
                                <td><%= uf.getIdUser_Food() %></td>
                                <td><%= ud.selectById(u).getName() %></td>
                                <td><%= fd.selectById(f).getNameFood() %></td>
                                <td><%= uf.getQuantity() %></td>
                                <td><%= uf.getSumPrice() %></td>
                                <td>
                                    <form action="XoaDonThucAn" method="GET" class="d-inline">
                                        <input type="hidden" name="id" value="<%= uf.getIdUser_Food() %>">
                                        <button class="action-btn delete-btn" type="submit">
                                            <i class="fas fa-trash-alt btn-icon"></i> Xóa
                                        </button>
                                    </form>
                                </td>
                                <td>
                                    <button class="action-btn pay-btn" onclick="showTotal(this)" data-bs-toggle="modal" data-bs-target="#paymentModal" data-id="<%= uf.getIdUser_Food() %>">
                                        <i class="fas fa-money-check-alt btn-icon"></i> Thanh Toán
                                    </button>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="text-center mt-5 mb-4" data-aos="fade-up">
                <a href="ADMIN.jsp" class="back-btn" style="text-decoration: none">
                    <i class="fas fa-arrow-left"></i> Quay lại trang ADMIN
                </a>
            </div>
        </div>

        <% } else { %>
        <div class="restricted-container">
            <div class="restricted-content animate__animated animate__fadeIn">
                <i class="fas fa-exclamation-triangle restricted-icon"></i>
                <h1 class="restricted-title">Truy Cập Bị Hạn Chế</h1>
                <p>Bạn không có quyền truy cập vào trang này</p>
                <p class="countdown-text">
                    Chuyển hướng sau <span class="countdown-number" id="countdown">5</span> giây...
                </p>
                <a href="index.jsp" class="return-home" style="text-decoration: none">
                    <i class="fas fa-home me-2" style="text-decoration: none"></i> Quay trở lại trang chủ
                </a>
            </div>
        </div>
        <% } %>

        <!-- Modal thanh toán -->
        <div class="modal fade" id="paymentModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thanh Toán</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <h4>Tổng tiền của đơn hàng:</h4>
                        <h2 id="totalPrice" style="font-weight: bold;"></h2>
                    </div>
                    <div class="modal-footer">
                        <form id="paymentForm" action="XoaDonThucAn" method="GET">
                            <input type="hidden" name="id" id="orderId">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-success">Xác nhận</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            AOS.init({
                duration: 800,
                easing: 'ease-in-out',
                once: true
            });

            function showTotal(button) {
                let row = button.closest("tr");
                let totalPrice = row.cells[4].innerText;
                document.getElementById("totalPrice").innerText = totalPrice + " VNĐ";
                document.getElementById("orderId").value = button.getAttribute("data-id");
            }

            let timeLeft = 5;
            let countdownElement = document.getElementById("countdown");
            if (countdownElement) {
                let countdownTimer = setInterval(function () {
                    timeLeft--;
                    countdownElement.textContent = timeLeft;
                    if (timeLeft <= 0) {
                        clearInterval(countdownTimer);
                        window.location.href = "index.jsp";
                    }
                }, 1000);
            }
        </script>
    </body>
</html>