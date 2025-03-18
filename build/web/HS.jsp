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

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #000;
                color: gold;
                overflow: hidden;
            }
            .profile-container {
                max-width: 500px;
                margin: 50px auto;
                background: #111;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 4px 20px rgba(255, 215, 0, 0.6);
                text-align: center;
                border: 2px solid gold;
                animation: fadeIn 1.5s ease-in-out;
                position: relative;
                z-index: 2;
            }
            .profile-container h2 {
                color: gold;
                text-transform: uppercase;
                letter-spacing: 2px;
            }
            .profile-item {
                font-size: 18px;
                margin: 10px 0;
                color: gold;
                transition: transform 0.3s;
            }
            .profile-item:hover {
                transform: scale(1.05);
                text-shadow: 0 0 10px gold;
            }
            .logout-btn {
                background: gold;
                color: black;
                border: none;
                padding: 12px 20px;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s;
                font-weight: bold;
            }
            .logout-btn:hover {
                background: #ffcc00;
                box-shadow: 0 0 15px gold;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .golden-glow {
                position: absolute;
                width: 100px;
                height: 100px;
                background: radial-gradient(circle, gold, rgba(255, 215, 0, 0));
                border-radius: 50%;
                opacity: 0.5;
                animation: moveGlow 6s infinite alternate ease-in-out;
            }
            @keyframes moveGlow {
                0% {
                    transform: translate(-50px, -50px);
                }
                100% {
                    transform: translate(50px, 50px);
                }
            }
        </style>
    </head>
    <body>
        <%
            
            Users u = (Users) session.getAttribute("users");
            RoleDAO rd = new RoleDAO();
            if (u != null) {
            String nameRole = rd.getRoleById(u.getIdRole()).getNameRole();
            
        %>
        <div class="golden-glow" style="top: 10%; left: 15%;"></div>
        <div class="golden-glow" style="top: 80%; left: 80%;"></div>
        <div class="golden-glow" style="top: 50%; left: 40%;"></div>

        <div class="profile-container" data-aos="fade-up">
            <h2>Hồ Sơ Người Dùng</h2>
            <p class="profile-item"><strong>ID User:</strong> <%= u.getIdUser()%></p>
            <p class="profile-item"><strong>Name:</strong> <%= u.getName()%></p>
            <p class="profile-item"><strong>Email:</strong> <%= u.getEmail()%></p>
            <p class="profile-item"><strong>Phone:</strong> <%= u.getPhone()%></p>
            <p class="profile-item"><strong>Role:</strong> <%= nameRole%></p>
            <a href="LogOutServlet" class="btn btn-warning" target="_blank">Log out</a>
            <%} else { %>
            <div style="background-color: black; color: gold; text-align: center; font-family: Arial, sans-serif; padding: 50px;">
                <div style="border: 3px solid gold; padding: 40px; border-radius: 15px; display: inline-block; box-shadow: 0 0 15px gold;">
                    <h1 style="font-size: 28px; text-transform: uppercase;">Truy Cập Bị Hạn Chế</h1>
                    <p style="font-size: 18px;">Bạn cần đăng nhập để tiếp tục.</p>
                    <p style="font-size: 16px;">Chuyển hướng sau <span id="countdown" style="font-weight: bold;">5</span> giây...</p>
                    <a href="DN.jsp" style="display: inline-block; background-color: gold; color: black; padding: 10px 20px; text-decoration: none; font-weight: bold; border-radius: 5px;">Đăng Nhập Ngay</a>
                </div>
            </div>

            <%}%>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
            <script>
                    AOS.init();
                    let timeLeft = 5;
                    let countdownElement = document.getElementById("countdown");
                    let countdownTimer = setInterval(function () {
                    timeLeft--;
                    countdownElement.textContent = timeLeft;
                    if (timeLeft <= 0) {
                    clearInterval(countdownTimer);
                    window.location.href = "DN.jsp";
                    }
                    }, 1000);
            </script>
    </body>
</html>