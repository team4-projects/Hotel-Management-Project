<%-- 
    Document   : QuanLyUser
    Created on : Mar 6, 2025, 1:51:54 PM
    Author     : ASUS
--%>

<%@page import="dao.UserDAO"%>
<%@page import="dao.RoleDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản Lý Người Dùng</title>
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
                margin: 0 auto;
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
            }
            
            .table-container {
                overflow-x: auto;
                margin-top: 20px;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }
            
            .user-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                overflow: hidden;
            }
            
            .user-table thead tr {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            
            .user-table thead th {
                padding: 15px 12px;
                text-align: center;
                font-size: 0.9rem;
            }
            
            .user-table tbody tr {
                border-bottom: 1px solid rgba(255, 215, 0, 0.1);
                transition: all 0.3s ease;
            }
            
            .user-table tbody tr:hover {
                background-color: rgba(255, 215, 0, 0.05);
                transform: scale(1.005);
            }
            
            .user-table td {
                padding: 15px 12px;
                vertical-align: middle;
                text-align: center;
                font-size: 0.9rem;
            }
            
            .user-table td:nth-child(2) {
                font-weight: 500;
            }
            
            .user-table .user-role {
                display: inline-block;
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 500;
            }
            
            .user-role.admin {
                background-color: rgba(255, 65, 54, 0.2);
                color: #FF4136;
            }
            
            .user-role.user {
                background-color: rgba(46, 204, 113, 0.2);
                color: #2ECC71;
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
            
            .edit-btn {
                background-color: rgba(255, 215, 0, 0.2);
                color: var(--gold-primary);
            }
            
            .edit-btn:hover {
                background-color: var(--gold-primary);
                color: black;
                transform: scale(1.05);
                box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
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
            
            .footer {
                margin-top: 40px;
                text-align: center;
                padding: 20px;
                font-size: 0.8rem;
                border-top: 1px solid var(--gold-border);
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
            
            .add-user-btn {
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
            
            .add-user-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
            }
            
            .add-user-btn i {
                margin-right: 8px;
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
            
            /* Responsive tweaks */
            @media (max-width: 992px) {
                .stats-row {
                    flex-wrap: wrap;
                }
                .stat-card {
                    flex: 0 0 calc(50% - 20px);
                    margin-bottom: 20px;
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
                .user-table thead th {
                    font-size: 0.8rem;
                }
                .add-user-btn, .filter-dropdown {
                    font-size: 0.8rem;
                }
            }
            
            @media (max-width: 576px) {
                .search-filter {
                    flex-direction: column;
                    align-items: stretch;
                }
                .search-box, .filter-dropdown {
                    width: 100%;
                }
                .action-btns {
                    display: flex;
                    flex-direction: column;
                }
                .action-btn {
                    margin: 5px 0;
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
            Users u = (Users) session.getAttribute("users");
            RoleDAO rd = new RoleDAO();
            UserDAO ud = new UserDAO();
            
            if (u != null && u.getIdRole() == 2) {
                int totalUsers = ud.selectAll().size();
                int adminUsers = 0;
                int regularUsers = 0;
                
                for (Users user : ud.selectAll()) {
                    if (user.getIdRole() == 2) {
                        adminUsers++;
                    } else {
                        regularUsers++;
                    }
                }
        %>
        <div class="page-container">
            <div class="admin-header animate__animated animate__fadeIn">
                <h2 class="admin-title">Quản Lý Người Dùng</h2>
                <div class="user-info">
                    <span><i class="fas fa-user-shield me-2"></i><%= u.getName() %></span>
                </div>
            </div>
            
            <div class="stats-row" data-aos="fade-up">
                <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                    <div class="stat-title"><i class="fas fa-users"></i>Tổng Người Dùng</div>
                    <h3 class="stat-value"><%= totalUsers %></h3>
                </div>
                <div class="stat-card" data-aos="fade-up" data-aos-delay="200">
                    <div class="stat-title"><i class="fas fa-user-shield"></i>Admin</div>
                    <h3 class="stat-value"><%= adminUsers %></h3>
                </div>
                <div class="stat-card" data-aos="fade-up" data-aos-delay="300">
                    <div class="stat-title"><i class="fas fa-user"></i>Người Dùng Thường</div>
                    <h3 class="stat-value"><%= regularUsers %></h3>
                </div>
            </div>
            
            <div class="content-card" data-aos="fade-up" data-aos-delay="400">
                <div class="search-filter">
                    <div class="search-box">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" class="search-input" id="searchInput" placeholder="Tìm kiếm người dùng...">
                    </div>
                    
                </div>
                
                <div class="table-container">
                    <table class="user-table" id="userTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ Tên</th>
                                <th>Email</th>
                                <th>Điện Thoại</th>
                                <th>Vai Trò</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int delay = 100;
                                for (Users u1 : ud.selectAll()) {
                                    delay += 50;
                            %>
                            <tr class="animate-row" style="animation-delay: <%= delay %>ms">                        
                                <td><%= u1.getIdUser() %></td>
                                <td><%= u1.getName() %></td>
                                <td><%= u1.getEmail() %></td>
                                <td><%= u1.getPhone() %></td>
                                <td>
                                    <% if (u1.getIdRole() == 2) { %>
                                        <span class="user-role admin">Admin</span>
                                    <% } else { %>
                                        <span class="user-role user">User</span>
                                    <% } %>
                                </td>
                                <td class="action-btns">
                                    <form action="DeleteUserServlet" method="GET" class="d-inline">
                                        <input hidden="" type="text" name="idUser" value="<%= u1.getIdUser() %>">
                                        <button class="action-btn delete-btn" type="submit">
                                            <i class="fas fa-trash-alt btn-icon"></i> Xóa
                                        </button>
                                    </form>
                    
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                
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
            </div>
            
            <div class="text-center mt-5 mb-4" data-aos="fade-up">
                <a href="ADMIN.jsp" class="back-btn"style="text-decoration: none">
                    <i class="fas fa-arrow-left"></i> Quay lại trang ADMIN
                </a>
            </div>
            
            <div class="footer">
                <p>© 2025 Admin Dashboard. Thiết kế và phát triển</p>
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
                <a href="index.jsp" class="return-home">
                    <i class="fas fa-home me-2"></i> Quay trở lại trang chủ
                </a>
            </div>
        </div>
        <% } %>
        
        <script>
            AOS.init({
                duration: 800,
                easing: 'ease-in-out',
                once: true
            });
            
            // Countdown timer
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
            
            // Search functionality
            const searchInput = document.getElementById('searchInput');
            if (searchInput) {
                searchInput.addEventListener('keyup', function() {
                    const searchValue = this.value.toLowerCase();
                    const table = document.getElementById('userTable');
                    const rows = table.getElementsByTagName('tr');
                    
                    for (let i = 1; i < rows.length; i++) {
                        let found = false;
                        const cells = rows[i].getElementsByTagName('td');
                        
                        for (let j = 0; j < cells.length; j++) {
                            const cellText = cells[j].textContent || cells[j].innerText;
                            
                            if (cellText.toLowerCase().indexOf(searchValue) > -1) {
                                found = true;
                                break;
                            }
                        }
                        
                        if (found) {
                            rows[i].style.display = '';
                        } else {
                            rows[i].style.display = 'none';
                        }
                    }
                });
            }
        </script>
    </body>
</html>