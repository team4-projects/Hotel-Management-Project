<%-- 
    Document   : HS
    Created on : Mar 6, 2025, 9:40:22 AM
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
        <title>Hồ Sơ Người Dùng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            @keyframes gradientBG {
                0% { background-position: 0% 50%; }
                50% { background-position: 100% 50%; }
                100% { background-position: 0% 50%; }
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

            @keyframes glowingBorder {
                0% { box-shadow: 0 0 15px rgba(255, 215, 0, 0.3); }
                50% { box-shadow: 0 0 25px rgba(255, 215, 0, 0.5); }
                100% { box-shadow: 0 0 15px rgba(255, 215, 0, 0.3); }
            }

            @keyframes floatAnimation {
                0% { transform: translateY(0); }
                50% { transform: translateY(-20px); }
                100% { transform: translateY(0); }
            }

            @keyframes rotate {
                from { transform: rotate(0deg); }
                to { transform: rotate(360deg); }
            }

            @keyframes pulse {
                0% { transform: scale(1); opacity: 0.5; }
                50% { transform: scale(1.1); opacity: 0.8; }
                100% { transform: scale(1); opacity: 0.5; }
            }

            body {
                background: linear-gradient(45deg, #1a1a1a, #2d2d2d, #1a1a1a);
                background-size: 200% 200%;
                animation: gradientBG 15s ease infinite;
                font-family: 'Poppins', sans-serif;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                position: relative;
                overflow: hidden;
            }

            .orb {
                position: absolute;
                border-radius: 50%;
                filter: blur(40px);
                opacity: 0.5;
                pointer-events: none;
                z-index: 0;
            }

            .orb-1 {
                width: 300px;
                height: 300px;
                background: radial-gradient(circle, rgba(255, 215, 0, 0.2), transparent 70%);
                top: -150px;
                left: -150px;
                animation: pulse 8s infinite, floatAnimation 10s infinite;
            }

            .orb-2 {
                width: 400px;
                height: 400px;
                background: radial-gradient(circle, rgba(255, 215, 0, 0.15), transparent 70%);
                bottom: -200px;
                right: -200px;
                animation: pulse 10s infinite, floatAnimation 12s infinite reverse;
            }

            .orb-3 {
                width: 250px;
                height: 250px;
                background: radial-gradient(circle, rgba(255, 215, 0, 0.1), transparent 70%);
                top: 50%;
                left: 60%;
                animation: pulse 7s infinite, floatAnimation 15s infinite;
            }

            .orb-4 {
                width: 200px;
                height: 200px;
                background: radial-gradient(circle, rgba(255, 215, 0, 0.12), transparent 70%);
                bottom: 30%;
                left: -100px;
                animation: pulse 9s infinite, floatAnimation 14s infinite reverse;
            }

            .particles {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                pointer-events: none;
                z-index: 0;
            }

            .particle {
                position: absolute;
                width: 3px;
                height: 3px;
                background: rgba(255, 215, 0, 0.3);
                border-radius: 50%;
                animation: moveParticle 15s infinite linear;
            }

            @keyframes moveParticle {
                0% {
                    transform: translate(0, 0);
                    opacity: 0;
                }
                10% {
                    opacity: 1;
                }
                90% {
                    opacity: 1;
                }
                100% {
                    transform: translate(var(--move-x, 100px), var(--move-y, 100px));
                    opacity: 0;
                }
            }

            .profile-container {
                background: rgba(17, 17, 17, 0.95);
                border: 2px solid transparent;
                border-image: linear-gradient(45deg, gold, #ffd700, #daa520);
                border-image-slice: 1;
                border-radius: 20px;
                padding: 40px;
                width: 100%;
                max-width: 500px;
                box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(10px);
                animation: fadeInUp 0.8s ease-out, glowingBorder 3s infinite;
                position: relative;
                overflow: hidden;
                z-index: 1;
            }

            .profile-container::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle, rgba(255, 215, 0, 0.1) 0%, transparent 60%);
                animation: rotate 10s linear infinite;
                pointer-events: none;
            }

            .profile-title {
                color: gold;
                font-size: 2.2rem;
                text-align: center;
                margin-bottom: 35px;
                text-transform: uppercase;
                letter-spacing: 3px;
                position: relative;
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            }

            .profile-title::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 100px;
                height: 3px;
                background: linear-gradient(90deg, transparent, gold, transparent);
            }

            .profile-item {
                background: linear-gradient(145deg, rgba(34, 34, 34, 0.9), rgba(24, 24, 24, 0.9));
                border: 1px solid rgba(255, 215, 0, 0.3);
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                transform-origin: left;
            }

            .profile-item:hover {
                transform: translateX(10px) scale(1.02);
                background: linear-gradient(145deg, rgba(42, 42, 42, 0.9), rgba(34, 34, 34, 0.9));
                border-color: gold;
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.2);
            }

            .profile-item i {
                color: gold;
                font-size: 1.4rem;
                margin-right: 20px;
                width: 24px;
                text-align: center;
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
                transition: transform 0.3s ease;
            }

            .profile-item:hover i {
                transform: scale(1.2);
            }

            .profile-label {
                color: gold;
                font-weight: 600;
                margin-right: 15px;
                min-width: 90px;
                letter-spacing: 0.5px;
            }

            .profile-value {
                color: #ffffff;
                margin-left: auto;
                font-size: 1.1rem;
                opacity: 0.9;
            }

            .btn-logout {
                background: linear-gradient(45deg, gold, #daa520);
                color: black;
                border: none;
                width: 100%;
                padding: 15px;
                border-radius: 25px;
                font-weight: 700;
                font-size: 1.1rem;
                margin-top: 30px;
                cursor: pointer;
                transition: all 0.4s ease;
                text-transform: uppercase;
                letter-spacing: 1px;
                position: relative;
                overflow: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            .btn-logout::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
                transition: 0.5s;
            }

            .btn-logout:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 20px rgba(255, 215, 0, 0.4);
                background: linear-gradient(45deg, #daa520, gold);
            }

            .btn-logout:hover::before {
                left: 100%;
            }

            .alert-container {
                background: rgba(17, 17, 17, 0.95);
                border: 2px solid transparent;
                border-image: linear-gradient(45deg, gold, #ffd700, #daa520);
                border-image-slice: 1;
                border-radius: 20px;
                padding: 40px;
                text-align: center;
                color: gold;
                max-width: 450px;
                margin: 0 auto;
                animation: fadeInUp 0.8s ease-out, glowingBorder 3s infinite;
                box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
            }

            .alert-container h4 {
                margin-bottom: 25px;
                font-size: 1.8rem;
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            }

            .alert-container p {
                font-size: 1.1rem;
                margin-bottom: 15px;
                color: #ffffff;
            }

            .alert-container .btn {
                background: linear-gradient(45deg, gold, #daa520);
                color: black;
                border: none;
                padding: 12px 30px;
                border-radius: 25px;
                font-weight: 600;
                margin-top: 20px;
                text-decoration: none;
                display: inline-block;
                transition: all 0.4s ease;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .alert-container .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 20px rgba(255, 215, 0, 0.4);
                background: linear-gradient(45deg, #daa520, gold);
            }

            #countdown {
                font-size: 1.5rem;
                font-weight: bold;
                color: gold;
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <div class="orb orb-1"></div>
        <div class="orb orb-2"></div>
        <div class="orb orb-3"></div>
        <div class="orb orb-4"></div>

        <div class="particles" id="particles"></div>

        <%
            Users u = (Users) session.getAttribute("users");
            RoleDAO rd = new RoleDAO();
            if (u != null) {
            String nameRole = rd.getRoleById(u.getIdRole()).getNameRole();
        %>
        <div class="profile-container">
            <h2 class="profile-title">Hồ Sơ Người Dùng</h2>
            
            <div class="profile-item" style="animation: fadeInUp 0.5s ease-out 0.1s backwards;">
                <i class="fas fa-id-card"></i>
                <span class="profile-label">ID User:</span>
                <span class="profile-value"><%= u.getIdUser()%></span>
            </div>

            <div class="profile-item" style="animation: fadeInUp 0.5s ease-out 0.2s backwards;">
                <i class="fas fa-user"></i>
                <span class="profile-label">Họ Tên:</span>
                <span class="profile-value"><%= u.getName()%></span>
            </div>

            <div class="profile-item" style="animation: fadeInUp 0.5s ease-out 0.3s backwards;">
                <i class="fas fa-envelope"></i>
                <span class="profile-label">Email:</span>
                <span class="profile-value"><%= u.getEmail()%></span>
            </div>

            <div class="profile-item" style="animation: fadeInUp 0.5s ease-out 0.4s backwards;">
                <i class="fas fa-phone"></i>
                <span class="profile-label">SĐT:</span>
                <span class="profile-value"><%= u.getPhone()%></span>
            </div>

            <div class="profile-item" style="animation: fadeInUp 0.5s ease-out 0.5s backwards;">
                <i class="fas fa-user-shield"></i>
                <span class="profile-label">Vai Trò:</span>
                <span class="profile-value"><%= nameRole%></span>
            </div>

            <a href="LogOutServlet" class="btn-logout" style="animation: fadeInUp 0.5s ease-out 0.6s backwards;">
                <i class="fas fa-sign-out-alt"></i> Đăng Xuất
            </a>
        </div>
        <%} else { %>
        <div class="alert-container">
            <h4><i class="fas fa-exclamation-triangle"></i> Truy Cập Bị Hạn Chế</h4>
            <p>Bạn cần đăng nhập để tiếp tục.</p>
            <p>Chuyển hướng sau <span id="countdown">5</span> giây...</p>
            <a href="DN.jsp" class="btn">Đăng Nhập Ngay</a>
        </div>
        <%}%>

        <script>
            if(document.getElementById('countdown')) {
                let timeLeft = 5;
                const countdownElement = document.getElementById('countdown');
                const countdownTimer = setInterval(function() {
                    timeLeft--;
                    countdownElement.textContent = timeLeft;
                    if(timeLeft <= 0) {
                        clearInterval(countdownTimer);
                        window.location.href = 'DN.jsp';
                    }
                }, 1000);
            }

            function createParticles() {
                const particlesContainer = document.getElementById('particles');
                const numberOfParticles = 50;

                for (let i = 0; i < numberOfParticles; i++) {
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    
                    const startX = Math.random() * window.innerWidth;
                    const startY = Math.random() * window.innerHeight;
                    particle.style.left = startX + 'px';
                    particle.style.top = startY + 'px';

                    const moveX = (Math.random() - 0.5) * 200;
                    const moveY = (Math.random() - 0.5) * 200;
                    particle.style.setProperty('--move-x', moveX + 'px');
                    particle.style.setProperty('--move-y', moveY + 'px');

                    particle.style.animationDelay = (Math.random() * 10) + 's';

                    particlesContainer.appendChild(particle);
                }
            }

            createParticles();
        </script>
    </body>
</html>