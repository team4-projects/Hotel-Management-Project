<%-- 
    Document   : QuanLyPhong
    Created on : Mar 6, 2025, 4:30:39 PM
    Author     : ASUS
--%>

<%@page import="model.Booking"%>
<%@page import="dao.BookingDAO"%>
<%@page import="dao.RoleDAO"%>
<%@page import="model.Users"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.RoomDAO"%>
<%@page import="model.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản Lý Phòng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            
            :root {
                --gold-primary: #FFD700;
                --gold-secondary: #DAA520;
                --gold-light: rgba(255, 215, 0, 0.15);
                --gold-bright: #FFC107;
                --gold-border: rgba(255, 215, 0, 0.5);
                --success-green: #28a745;
                --pending-orange: #fd7e14;
                --bg-dark: #0A0A0A;
            }
            
            body {
                background-color: var(--bg-dark);
                color: var(--gold-primary);
                font-family: 'Poppins', sans-serif;
                background-image: 
                    radial-gradient(circle at 10% 20%, rgba(255, 215, 0, 0.03) 2%, transparent 5%),
                    radial-gradient(circle at 90% 80%, rgba(255, 215, 0, 0.03) 2%, transparent 5%);
                background-size: 120px 120px;
            }
            
            .page-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 15px;
            }
            
            .admin-header {
                padding: 30px 0 20px;
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
                display: inline-block;
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
            
            .user-info {
                font-size: 0.9rem;
                display: flex;
                align-items: center;
                background: var(--gold-light);
                padding: 8px 15px;
                border-radius: 20px;
                border: 1px solid var(--gold-border);
            }
            
            .user-info i {
                margin-right: 8px;
                color: var(--gold-secondary);
            }
            
            .stats-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 30px;
                flex-wrap: wrap;
            }
            
            .stat-card {
                background: var(--gold-light);
                border-radius: 15px;
                border-left: 4px solid var(--gold-primary);
                padding: 20px;
                flex: 1;
                margin: 0 10px;
                min-width: 200px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
            }
            
            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 25px rgba(255, 215, 0, 0.2);
            }
            
            .stat-title {
                font-size: 0.9rem;
                color: var(--gold-secondary);
                margin-bottom: 5px;
                display: flex;
                align-items: center;
            }
            
            .stat-title i {
                margin-right: 8px;
            }
            
            .stat-value {
                font-size: 1.8rem;
                font-weight: 600;
                margin: 0;
            }
            
            .content-card {
                background: var(--gold-light);
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 0 25px rgba(255, 215, 0, 0.15);
                margin-bottom: 30px;
            }
            
            .search-filter {
                margin-bottom: 25px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 15px;
            }
            
            .search-box {
                flex: 1;
                min-width: 250px;
                position: relative;
            }
            
            .search-input {
                width: 100%;
                padding: 12px 20px;
                padding-left: 45px;
                border-radius: 30px;
                border: 1px solid var(--gold-border);
                background: rgba(0, 0, 0, 0.3);
                color: var(--gold-primary);
                font-size: 0.9rem;
            }
            
            .search-input::placeholder {
                color: rgba(255, 215, 0, 0.5);
            }
            
            .search-icon {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--gold-secondary);
            }
            
            .filter-dropdown {
                padding: 10px 20px;
                border-radius: 20px;
                border: 1px solid var(--gold-border);
                background: rgba(0, 0, 0, 0.3);
                color: var(--gold-primary);
                min-width: 150px;
                cursor: pointer;
            }
            
            .add-room-btn {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-bright));
                color: black;
                padding: 10px 20px;
                border-radius: 30px;
                font-weight: 600;
                border: none;
                display: inline-flex;
                align-items: center;
                transition: all 0.3s ease;
            }
            
            .add-room-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
            }
            
            .add-room-btn i {
                margin-right: 8px;
            }
            
            .table-container {
                overflow-x: auto;
                margin-top: 20px;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }
            
            .booking-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                overflow: hidden;
            }
            
            .booking-table thead tr {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            
            .booking-table thead th {
                padding: 15px 12px;
                text-align: center;
                font-size: 0.85rem;
                white-space: nowrap;
            }
            
            .booking-table tbody tr {
                border-bottom: 1px solid rgba(255, 215, 0, 0.1);
                transition: all 0.3s ease;
            }
            
            .booking-table tbody tr:hover {
                background-color: rgba(255, 215, 0, 0.05);
                transform: scale(1.003);
            }
            
            .booking-table td {
                padding: 15px 10px;
                vertical-align: middle;
                text-align: center;
                font-size: 0.9rem;
            }
            
            .payment-btn {
                background: linear-gradient(45deg, var(--gold-primary), var(--gold-secondary));
                color: black;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
                font-weight: 600;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }
            
            .payment-btn:hover {
                transform: scale(1.05);
                box-shadow: 0 0 15px rgba(255, 215, 0, 0.4);
            }
            
            .payment-btn i {
                margin-right: 6px;
            }
            
            .booking-id {
                font-family: 'Courier New', monospace;
                font-weight: bold;
                padding: 4px 8px;
                background: rgba(255, 215, 0, 0.1);
                border-radius: 4px;
                letter-spacing: 1px;
            }
            
            .total-price {
                font-weight: 700;
                font-size: 1.05rem;
                color: var(--gold-bright);
            }
            
            .price-perday {
                color: rgba(255, 215, 0, 0.8);
                font-size: 0.9rem;
            }
            
            .days-count {
                display: inline-block;
                min-width: 30px;
                height: 30px;
                line-height: 30px;
                background: var(--gold-light);
                border-radius: 50%;
                text-align: center;
                font-weight: 600;
            }
            
            .user-name {
                font-weight: 500;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 150px;
            }
            
            .date-field {
                font-size: 0.85rem;
                font-weight: 500;
                white-space: nowrap;
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
                text-decoration: none;
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
            
            .footer {
                margin-top: 40px;
                text-align: center;
                padding: 20px;
                font-size: 0.8rem;
                border-top: 1px solid var(--gold-border);
            }
            
            .pagination-container {
                margin-top: 30px;
                display: flex;
                justify-content: center;
            }
            
            .pagination {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 0;
            }
            
            .page-item {
                margin: 0 5px;
            }
            
            .page-link {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background: var(--gold-light);
                color: var(--gold-primary);
                font-weight: 500;
                transition: all 0.3s ease;
                border: 1px solid var(--gold-border);
            }
            
            .page-link:hover, .page-item.active .page-link {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
                box-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
                border-color: transparent;
            }
            
            .room-name {
                font-weight: 600;
                color: var(--gold-primary);
            }
            
            .empty-state {
                text-align: center;
                padding: 40px 20px;
            }
            
            .empty-icon {
                font-size: 50px;
                margin-bottom: 20px;
                color: var(--gold-secondary);
                opacity: 0.5;
            }
            
            .empty-text {
                font-size: 1.2rem;
                font-weight: 500;
                color: var(--gold-secondary);
                margin-bottom: 20px;
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
                color: #FF4136;
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
            
            .tab-container {
                margin-bottom: 20px;
            }
            
            .tab-buttons {
                display: flex;
                border-bottom: 1px solid var(--gold-border);
                padding-bottom: 2px;
            }
            
            .tab-btn {
                padding: 10px 20px;
                background: transparent;
                border: none;
                color: var(--gold-primary);
                font-weight: 500;
                font-size: 1rem;
                border-bottom: 3px solid transparent;
                transition: all 0.3s ease;
                cursor: pointer;
            }
            
            .tab-btn.active {
                border-bottom: 3px solid var(--gold-primary);
                font-weight: 600;
            }
            
            .tab-btn:not(.active):hover {
                border-bottom: 3px solid rgba(255, 215, 0, 0.3);
            }
            
            .tab-btn i {
                margin-right: 8px;
            }
            
            /* Responsive tweaks */
            @media (max-width: 992px) {
                .stats-row {
                    flex-wrap: wrap;
                }
                .stat-card {
                    flex: 0 0 calc(50% - 20px);
                    margin-bottom: 20px;
                }
                .date-field {
                    font-size: 0.75rem;
                }
            }
            
            @media (max-width: 768px) {
                .stat-card {
                    flex: 0 0 100%;
                    margin: 0 0 15px 0;
                }
                .admin-title {
                    font-size: 1.8rem;
                }
                .tab-btn {
                    padding: 8px 12px;
                    font-size: 0.85rem;
                }
                .payment-btn {
                    padding: 6px 12px;
                    font-size: 0.8rem;
                }
                .booking-table thead th {
                    font-size: 0.75rem;
                    padding: 12px 8px;
                }
                .booking-table td {
                    padding: 12px 8px;
                    font-size: 0.8rem;
                }
                .user-name {
                    max-width: 120px;
                }
            }
            
            @media (max-width: 576px) {
                .search-filter {
                    flex-direction: column;
                    align-items: stretch;
                }
                .search-box, 
                .filter-dropdown {
                    width: 100%;
                    margin-bottom: 10px;
                }
                .tab-buttons {
                    flex-wrap: wrap;
                }
                .tab-btn {
                    flex: 1 0 auto;
                    text-align: center;
                }
                .admin-header {
                    flex-direction: column;
                    text-align: center;
                }
                .admin-title:after {
                    left: 20%;
                    width: 60%;
                }
                .user-info {
                    margin-top: 15px;
                }
            }
            
            /* Animation for row entrance */
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
    <body>
        <%
            Users u2 = (Users) session.getAttribute("users");
            if (u2 != null && u2.getIdRole() == 2) {
                // Lấy số liệu thống kê
                BookingDAO bkd = new BookingDAO();
                RoomDAO rd = new RoomDAO();
                UserDAO ud = new UserDAO();
                
                int totalBookings = bkd.selectAll().size();
                double totalRevenue = 0;
                int activeBookings = 0;
                
                for (Booking b : bkd.selectAll()) {
                    Room room = rd.selectByIdRoom(b.getIdRoom());
                    double pricePerDay = room.getPrice();
                    
                    long millisCheckIn = b.getCheckInDate().getTime();
                    long millisCheckOut = b.getCheckOutDate().getTime();
                    long daysDiff = (millisCheckOut - millisCheckIn) / (1000 * 60 * 60 * 24);
                    if (daysDiff <= 0) {
                        daysDiff = 1;
                    }
                    
                    double bookingPrice = pricePerDay * daysDiff;
                    totalRevenue += bookingPrice;
                    
                    // Giả định: nếu ngày checkout > ngày hiện tại, booking vẫn active
                    java.util.Date today = new java.util.Date();
                    if (b.getCheckOutDate().after(today)) {
                        activeBookings++;
                    }
                }
        %>
        <div class="page-container">
            <div class="admin-header animate__animated animate__fadeIn">
                <h1 class="admin-title">Quản Lý Phòng</h1>
                <div class="user-info">
                    <i class="fas fa-user-shield"></i> <%= u2.getName() %>
                </div>
            </div>
            
            <div class="stats-row">
                <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                    <div class="stat-title"><i class="fas fa-calendar-check"></i>Tổng đặt phòng</div>
                    <h3 class="stat-value"><%= totalBookings %></h3>
                </div>
                
                <div class="stat-card" data-aos="fade-up" data-aos-delay="300">
                    <div class="stat-title"><i class="fas fa-coins"></i>Tổng doanh thu</div>
                    <h3 class="stat-value"><%= String.format("%.1f", totalRevenue) %> VNĐ</h3>
                </div>
            </div>
            
            <div class="content-card" data-aos="fade-up" data-aos-delay="400">
                <div class="tab-container">
                    <div class="tab-buttons">
                        <button class="tab-btn active"><i class="fas fa-list"></i>Tất cả đặt phòng</button>
                        
                    </div>
                </div>
                
                <div class="search-filter">
                    <div class="search-box">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" class="search-input" id="searchInput" placeholder="Tìm kiếm theo tên phòng, khách hàng...">
                    </div>
                    
                </div>
                
                <div class="table-container">
                    <table class="booking-table" id="bookingTable">
                        <thead>
                            <tr>
                                <th>ID Booking</th>
                                <th>Tên phòng</th>
                                <th>Khách hàng</th>
                                <th>Check-in</th>
                                <th>Check-out</th>
                                <th>Giá/ngày</th>
                                <th>Số ngày</th>
                                <th>Tổng tiền</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int delay = 100;
                                if (bkd.selectAll().isEmpty()) {
                            %>
                                <tr>
                                    <td colspan="9">
                                        <div class="empty-state">
                                            <i class="fas fa-calendar-xmark empty-icon"></i>
                                            <p class="empty-text">Không có thông tin đặt phòng nào</p>
                                        </div>
                                    </td>
                                </tr>
                            <% } else {
                                for (Booking b : bkd.selectAll()) {
                                    delay += 50;
                                    UserDAO userDao = new UserDAO();
                                    Users u = new Users();

                                    String name = "Khách hàng";
                                    String nameRoom = "";
                                    RoomDAO roomDao = new RoomDAO();
                                    Room room = roomDao.selectByIdRoom(b.getIdRoom());
                                    nameRoom = room.getNameRoom();

                                    if (b.getIdUser() != 0) {
                                        u.setIdUser(b.getIdUser());
                                        name = userDao.selectById(u).getName();
                                    }

                                    // Tính toán
                                    double pricePerDay = room.getPrice();
                                    long millisCheckIn = b.getCheckInDate().getTime();
                                    long millisCheckOut = b.getCheckOutDate().getTime();
                                    long daysDiff = (millisCheckOut - millisCheckIn) / (1000 * 60 * 60 * 24);
                                    if (daysDiff <= 0) {
                                        daysDiff = 1;
                                    }
                                    double totalPrice = pricePerDay * daysDiff;
                                    
                                    // Format ngày tháng đẹp hơn
                                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                                    String checkInFormatted = sdf.format(b.getCheckInDate());
                                    String checkOutFormatted = sdf.format(b.getCheckOutDate());
                            %>
                            <tr class="animate-row" style="animation-delay: <%= delay %>ms">
                                <form action="TraPhongServlet" method="GET">
                                    <td><span class="booking-id"><%= b.getIdBooking() %></span></td>
                                    <td><span class="room-name"><%= nameRoom %></span></td>
                                    <td><span class="user-name"><%= name %></span></td>
                                    <td><span class="date-field"><i class="fas fa-calendar-plus me-1"></i><%= checkInFormatted %></span></td>
                                    <td><span class="date-field"><i class="fas fa-calendar-minus me-1"></i><%= checkOutFormatted %></span></td>
                                    <td><span class="price-perday"><%= String.format("%,.0f", pricePerDay) %> VNĐ</span></td>
                                    <td><span class="days-count"><%= daysDiff %></span></td>
                                    <td><span class="total-price"><%= String.format("%,.0f", totalPrice) %> VNĐ</span></td>
                                    <input type="hidden" name="idBooking" value="<%= b.getIdBooking() %>">
                                    <td>
                                        <button class="payment-btn">
                                            <i class="fas fa-credit-card"></i> Thanh toán
                                        </button>
                                    </td>
                                </form>
                            </tr>
                            <% } 
                            } %>
                        </tbody>
                    </table>
                </div>
                
                <% if (bkd.selectAll().size() > 10) { %>
                <nav class="pagination-container" data-aos="fade-up">
                    <ul class="pagination">
                        <li class="page-item">
                            <button class="page-link"><i class="fas fa-angle-left"></i></button>
                        </li>
                        <li class="page-item active"><button class="page-link">1</button></li>
                        <li class="page-item"><button class="page-link">2</button></li>
                        <li class="page-item"><button class="page-link">3</button></li>
                        <li class="page-item">
                            <button class="page-link"><i class="fas fa-angle-right"></i></button>
                        </li>
                    </ul>
                </nav>
                <% } %>
            </div>
            
            <div class="text-center mt-5 mb-4" data-aos="fade-up">
                <a href="ADMIN.jsp" class="back-btn">
                    <i class="fas fa-arrow-left"></i> Trở về trang Admin
                </a>
            </div>
            
            <footer class="footer">
                <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> Hotel Management System. All rights reserved.</p>
            </footer>
        </div>
        
        <script>
            // Initialize AOS library for animations
            AOS.init({
                duration: 800,
                easing: 'ease-in-out',
                once: true
            });
            
            // Search functionality
            document.getElementById('searchInput').addEventListener('keyup', function() {
                const searchValue = this.value.toLowerCase();
                const table = document.getElementById('bookingTable');
                const rows = table.getElementsByTagName('tr');
                
                for (let i = 1; i < rows.length; i++) {
                    if (rows[i].textContent.toLowerCase().includes(searchValue)) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            });
            
            // Tab switching functionality
            const tabButtons = document.querySelectorAll('.tab-btn');
            tabButtons.forEach(button => {
                button.addEventListener('click', function() {
                    tabButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Filter table based on selected tab
                    const tabText = this.textContent.trim();
                    const table = document.getElementById('bookingTable');
                    const rows = table.getElementsByTagName('tr');
                    
                    // Implementation would depend on specific filtering logic
                    // This is just a placeholder for demonstration
                    if (tabText.includes('Tất cả')) {
                        for (let i = 1; i < rows.length; i++) {
                            rows[i].style.display = '';
                        }
                    } else if (tabText.includes('Đang hoạt động')) {
                        // Show only active bookings
                        // Logic would need actual date comparison
                    } else if (tabText.includes('Lịch sử')) {
                        // Show only past bookings
                        // Logic would need actual date comparison
                    }
                });
            });
        </script>
        <% } else { %>
        <div class="restricted-container">
            <div class="restricted-content animate__animated animate__fadeIn">
                <i class="fas fa-exclamation-triangle restricted-icon"></i>
                <h2 class="restricted-title">Truy cập bị từ chối</h2>
                <p>Bạn không có quyền truy cập vào trang này.</p>
                <p class="countdown-text">
                    Chuyển hướng sau <span class="countdown-number">5</span> giây
                </p>
                <a href="home.jsp" class="return-home">
                    <i class="fas fa-home"></i> Về trang chủ
                </a>
            </div>
        </div>
        
        <script>
            // Countdown redirect
            let seconds = 5;
            const countdownElement = document.querySelector('.countdown-number');
            
            const countdown = setInterval(() => {
                seconds--;
                countdownElement.textContent = seconds;
                
                if (seconds <= 0) {
                    clearInterval(countdown);
                    window.location.href = 'home.jsp';
                }
            }, 1000);
        </script>
        <% } %>
    </body>
</html>