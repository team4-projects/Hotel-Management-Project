<%-- 
    Document   : ADMIN
    Created on : Mar 6, 2025, 1:34:05 PM
    Author     : ASUS
--%>

<%@page import="dao.RoleDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Trang Quản Trị Admin</title>
        
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        
        <!-- Bootstrap & Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #000;
                color: gold;
                position: relative;
                min-height: 100vh;
            }
            
            /* Particles background effect */
            .particles {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: -1;
            }
            
            .particle {
                position: absolute;
                width: 3px;
                height: 3px;
                background-color: rgba(255, 215, 0, 0.5);
                border-radius: 50%;
                animation: float 8s infinite ease-in-out;
            }
            
            @keyframes float {
                0%, 100% {
                    transform: translateY(0) translateX(0);
                    opacity: 0;
                }
                25% {
                    opacity: 1;
                }
                50% {
                    transform: translateY(-100px) translateX(20px);
                    opacity: 0.5;
                }
                75% {
                    opacity: 0.2;
                }
            }
            
            .admin-container {
                max-width: 900px;
                margin: 50px auto;
                background: linear-gradient(145deg, #111 0%, #222 100%);
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 8px 40px rgba(255, 215, 0, 0.6);
                text-align: center;
                border: 3px solid gold;
                position: relative;
                z-index: 2;
                overflow: hidden;
            }
            
            /* Decorative corner elements */
            .admin-container::before,
            .admin-container::after {
                content: '';
                position: absolute;
                width: 120px;
                height: 120px;
                border: 2px solid rgba(255, 215, 0, 0.3);
                z-index: -1;
            }
            
            .admin-container::before {
                top: -20px;
                left: -20px;
                border-right: none;
                border-bottom: none;
                border-radius: 20px 0 0 0;
            }
            
            .admin-container::after {
                bottom: -20px;
                right: -20px;
                border-left: none;
                border-top: none;
                border-radius: 0 0 20px 0;
            }
            
            .admin-container h2 {
                text-transform: uppercase;
                letter-spacing: 3px;
                margin-bottom: 30px;
                font-weight: 700;
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
                position: relative;
                display: inline-block;
                padding-bottom: 15px;
            }
            
            .admin-container h2::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 25%;
                width: 50%;
                height: 3px;
                background: linear-gradient(90deg, transparent, gold, transparent);
            }
            
            .admin-items-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin: 40px 0;
            }
            
            .admin-item {
                font-size: 18px;
                margin: 0;
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                background: rgba(0, 0, 0, 0.5);
                padding: 25px 15px;
                border-radius: 15px;
                border: 1px solid rgba(255, 215, 0, 0.3);
                position: relative;
                overflow: hidden;
            }
            
            .admin-item::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(45deg, transparent, rgba(255, 215, 0, 0.1), transparent);
                transform: translateX(-100%);
                transition: transform 0.6s;
                z-index: -1;
            }
            
            .admin-item:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 25px rgba(255, 215, 0, 0.4);
                border-color: gold;
            }
            
            .admin-item:hover::before {
                transform: translateX(100%);
            }
            
            .admin-item a {
                color: gold;
                text-decoration: none;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 15px;
            }
            
            .admin-item i {
                font-size: 2rem;
                margin-bottom: 5px;
                transition: transform 0.3s;
            }
            
            .admin-item:hover i {
                transform: scale(1.2);
            }
            
            .admin-badge {
                font-size: 22px;
                background: linear-gradient(to right, #ffd700, #ffcc00);
                color: black;
                padding: 10px 25px;
                border-radius: 50px;
                font-weight: bold;
                display: inline-block;
                margin-bottom: 25px;
                box-shadow: 0 0 20px rgba(255, 215, 0, 0.8);
                transform: translateY(-50%);
                margin-top: 20px;
            }
            
            .btn-custom {
                background: linear-gradient(to right, gold, #ffcc00);
                color: black;
                padding: 12px 30px;
                border-radius: 50px;
                font-size: 18px;
                cursor: pointer;
                transition: all 0.3s;
                font-weight: bold;
                border: none;
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.4);
                margin-top: 20px;
                position: relative;
                overflow: hidden;
            }
            
            .btn-custom::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
                transition: left 0.7s;
            }
            
            .btn-custom:hover {
                background: linear-gradient(to right, #ffcc00, gold);
                box-shadow: 0 5px 20px rgba(255, 215, 0, 0.8);
                transform: translateY(-3px);
            }
            
            .btn-custom:hover::before {
                left: 100%;
            }
            
            .access-denied {
                background: linear-gradient(145deg, #111 0%, #222 100%);
                color: gold;
                text-align: center;
                padding: 50px 20px;
                border-radius: 20px;
                border: 3px solid gold;
                box-shadow: 0 8px 40px rgba(255, 215, 0, 0.6);
                max-width: 600px;
                margin: 100px auto;
                position: relative;
                overflow: hidden;
            }
            
            .access-denied::before {
                content: '';
                position: absolute;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle, transparent 20%, #111 70%);
                top: -50%;
                left: -50%;
                animation: pulse 4s infinite;
            }
            
            @keyframes pulse {
                0%, 100% {
                    opacity: 0.1;
                }
                50% {
                    opacity: 0.3;
                }
            }
            
            .access-denied h1 {
                font-size: 28px;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 20px;
                position: relative;
            }
            
            .access-denied i.fa-exclamation-triangle {
                font-size: 50px;
                margin-bottom: 20px;
                color: gold;
                animation: pulse 1.5s infinite;
            }
            
            .stat-container {
                display: flex;
                justify-content: space-around;
                margin: 40px 0 30px;
                flex-wrap: wrap;
            }
            
            .stat-box {
                background: rgba(0, 0, 0, 0.5);
                border-radius: 15px;
                padding: 20px;
                min-width: 150px;
                border: 1px solid rgba(255, 215, 0, 0.3);
                transition: all 0.3s;
            }
            
            .stat-box:hover {
                transform: translateY(-5px);
                border-color: gold;
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.4);
            }
            
            .stat-number {
                font-size: 32px;
                font-weight: bold;
                margin: 10px 0;
                background: linear-gradient(to right, gold, #ffcc00);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }
            
            .stat-title {
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 1px;
                opacity: 0.8;
            }
            
            .quick-actions {
                margin-top: 30px;
                background: rgba(0, 0, 0, 0.3);
                padding: 20px;
                border-radius: 15px;
                border: 1px dashed rgba(255, 215, 0, 0.4);
            }
            
            .recent-activity {
                margin-top: 30px;
                text-align: left;
                background: rgba(0, 0, 0, 0.3);
                padding: 20px;
                border-radius: 15px;
                border: 1px solid rgba(255, 215, 0, 0.3);
            }
            
            .activity-item {
                padding: 10px 0;
                border-bottom: 1px solid rgba(255, 215, 0, 0.2);
                display: flex;
                align-items: center;
                gap: 10px;
            }
            
            .activity-item:last-child {
                border-bottom: none;
            }
            
            .timestamp {
                font-size: 12px;
                opacity: 0.7;
            }
            
            footer {
                text-align: center;
                padding: 20px;
                margin-top: 40px;
                border-top: 1px solid rgba(255, 215, 0, 0.3);
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <%
            Users u = (Users) session.getAttribute("users");
            RoleDAO rd = new RoleDAO();
            if (u != null && u.getIdRole() == 2) {
        %>
        <!-- Particles background -->
        <div class="particles" id="particles"></div>
        
        <div class="admin-container">
            <span class="admin-badge"><i class="fas fa-crown me-2"></i> Admin Dashboard <i class="fas fa-crown ms-2"></i></span>
            <h2>Chào mừng, Quản Trị Viên</h2>
            
            <!-- Quick stats -->
            <div class="stat-container">
                <div class="stat-box">
                    <i class="fas fa-users"></i>
                    <div class="stat-number">127</div>
                    <div class="stat-title">Người dùng</div>
                </div>
                <div class="stat-box">
                    <i class="fas fa-door-open"></i>
                    <div class="stat-number">56</div>
                    <div class="stat-title">Phòng</div>
                </div>
                <div class="stat-box">
                    <i class="fas fa-utensils"></i>
                    <div class="stat-number">43</div>
                    <div class="stat-title">Đơn hàng</div>
                </div>
            </div>
            
            <!-- Main menu items -->
            <div class="admin-items-container">
                <div class="admin-item">
                    <a href="QuanLyUser.jsp">
                        <i class="fas fa-users"></i>
                        <span>Quản lý người dùng</span>
                    </a>
                </div>
                <div class="admin-item">
                    <a href="QuanLyPhong.jsp">
                        <i class="fas fa-door-open"></i>
                        <span>Quản lý hệ thống phòng</span>
                    </a>
                </div>
                <div class="admin-item">
                    <a href="QuanLyDonThucAn.jsp">
                        <i class="fas fa-utensils"></i>
                        <span>Quản lý đơn thức ăn</span>
                    </a>
                </div>
            </div>
            
            <!-- Quick actions section -->
            <div class="quick-actions">
                <h5 class="mb-3"><i class="fas fa-bolt me-2"></i>Thao tác nhanh</h5>
                <div class="d-flex justify-content-center gap-3 flex-wrap">
                    <button class="btn btn-sm btn-custom py-2 px-3">
                        <i class="fas fa-plus-circle me-2"></i>Thêm người dùng
                    </button>
                    <button class="btn btn-sm btn-custom py-2 px-3">
                        <i class="fas fa-plus-circle me-2"></i>Thêm phòng mới
                    </button>
                    <button class="btn btn-sm btn-custom py-2 px-3">
                        <i class="fas fa-cog me-2"></i>Cài đặt hệ thống
                    </button>
                </div>
            </div>
            
            <!-- Recent activity -->
            <div class="recent-activity">
                <h5 class="mb-3"><i class="fas fa-history me-2"></i>Hoạt động gần đây</h5>
                <div class="activity-item">
                    <i class="fas fa-user-plus text-success"></i>
                    <div>
                        <div>Người dùng mới đã đăng ký</div>
                        <div class="timestamp">15 phút trước</div>
                    </div>
                </div>
                <div class="activity-item">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <div>
                        <div>Đơn đặt phòng mới #2345</div>
                        <div class="timestamp">2 giờ trước</div>
                    </div>
                </div>
                <div class="activity-item">
                    <i class="fas fa-exclamation-circle text-warning"></i>
                    <div>
                        <div>Báo cáo sự cố tại phòng 302</div>
                        <div class="timestamp">5 giờ trước</div>
                    </div>
                </div>
            </div>
            
            <a href="LogOutServlet" class="btn btn-custom mt-4">
                <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
            </a>
            
            <footer>
                <p>© 2025 Hệ thống Quản trị. Bản quyền thuộc về ASUS.</p>
            </footer>
        </div>
        <%} else {%>
        <div class="access-denied">
            <i class="fas fa-exclamation-triangle"></i>
            <h1>Truy Cập Bị Hạn Chế</h1>
            <p style="font-size: 18px; position: relative; z-index: 10;">Bạn không có quyền truy cập vào trang quản trị này</p>
            <p style="font-size: 16px; position: relative; z-index: 10;">Hệ thống sẽ chuyển hướng sau <span id="countdown" style="font-weight: bold;">5</span> giây...</p>
            <a href="index.jsp" class="btn btn-custom" style="position: relative; z-index: 10;">
                <i class="fas fa-home me-2"></i>Quay trở lại trang chủ
            </a>
        </div>
        <%} %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Countdown for redirect
            let timeLeft = 5;
            let countdownElement = document.getElementById("countdown");
            let countdownTimer = setInterval(function () {
                timeLeft--;
                countdownElement.textContent = timeLeft;
                if (timeLeft <= 0) {
                    clearInterval(countdownTimer);
                    window.location.href = "index.jsp";
                }
            }, 1000);
            
            // Create floating particles
            document.addEventListener('DOMContentLoaded', function() {
                const particlesContainer = document.getElementById('particles');
                const particleCount = 50;
                
                if (particlesContainer) {
                    for (let i = 0; i < particleCount; i++) {
                        createParticle(particlesContainer);
                    }
                }
            });
            
            function createParticle(container) {
                const particle = document.createElement('div');
                particle.classList.add('particle');
                
                // Random position
                const x = Math.floor(Math.random() * 100);
                const y = Math.floor(Math.random() * 100);
                particle.style.left = x + '%';
                particle.style.top = y + '%';
                
                // Random size
                const size = Math.floor(Math.random() * 3) + 1;
                particle.style.width = size + 'px';
                particle.style.height = size + 'px';
                
                // Random animation delay
                const delay = Math.random() * 8;
                particle.style.animationDelay = delay + 's';
                
                // Random duration
                const duration = Math.random() * 10 + 5;
                particle.style.animationDuration = duration + 's';
                
                container.appendChild(particle);
            }
        </script>
    </body>
</html>