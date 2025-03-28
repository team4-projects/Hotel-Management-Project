<%-- 
    Document   : QuanLyUser
    Created on : Mar 6, 2025, 1:51:54 PM
    Author     : ASUS
--%>

<%@page import="dao.UserDAO"%>
<%@page import="dao.RoleDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                display: flex;
                align-items: center;
                gap: 20px;
                margin-bottom: 30px;
                padding: 20px;
                background: linear-gradient(135deg, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.2));
                border-radius: 20px;
                border: 1px solid var(--gold-border);
            }
            
            .search-box {
                flex: 1;
                position: relative;
            }
            
            .search-box input {
                width: 100%;
                padding: 15px 20px 15px 50px;
                border: 2px solid var(--gold-border);
                border-radius: 30px;
                background: rgba(0, 0, 0, 0.3);
                color: var(--gold-primary);
                font-size: 1rem;
                transition: all 0.3s ease;
            }
            
            .search-box input:focus {
                outline: none;
                border-color: var(--gold-primary);
                box-shadow: 0 0 15px rgba(255, 215, 0, 0.2);
                background: rgba(0, 0, 0, 0.5);
            }
            
            .search-box input::placeholder {
                color: rgba(255, 215, 0, 0.5);
            }
            
            .search-box i {
                position: absolute;
                left: 20px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--gold-primary);
                font-size: 1.2rem;
                pointer-events: none;
                transition: all 0.3s ease;
            }
            
            .search-box input:focus + i {
                color: var(--gold-bright);
            }
            
            .btn-add-user {
                background: linear-gradient(45deg, var(--gold-primary), var(--gold-secondary));
                color: black;
                border: none;
                padding: 15px 30px;
                border-radius: 30px;
                font-weight: 600;
                font-size: 1rem;
                display: flex;
                align-items: center;
                gap: 10px;
                transition: all 0.3s ease;
                text-decoration: none;
                white-space: nowrap;
            }
            
            .btn-add-user:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
                background: linear-gradient(45deg, var(--gold-bright), var(--gold-primary));
            }
            
            .btn-add-user i {
                font-size: 1.2rem;
            }
            
            .btn-stats {
                background: transparent;
                color: var(--gold-primary);
                border: 2px solid var(--gold-primary);
                padding: 15px 30px;
                border-radius: 30px;
                font-weight: 600;
                font-size: 1rem;
                display: flex;
                align-items: center;
                gap: 10px;
                transition: all 0.3s ease;
                text-decoration: none;
                white-space: nowrap;
            }
            
            .btn-stats:hover {
                background: rgba(255, 215, 0, 0.1);
                color: var(--gold-bright);
                border-color: var(--gold-bright);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.1);
            }
            
            .btn-stats i {
                font-size: 1.2rem;
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
                font-size: 0.85rem;
                white-space: nowrap;
            }
            
            .user-table tbody tr {
                border-bottom: 1px solid rgba(255, 215, 0, 0.1);
                transition: all 0.3s ease;
            }
            
            .user-table tbody tr:hover {
                background-color: rgba(255, 215, 0, 0.05);
                transform: scale(1.003);
            }
            
            .user-table td {
                padding: 15px 10px;
                vertical-align: middle;
                text-align: center;
                font-size: 0.9rem;
            }
            
            .badge-admin {
                background: linear-gradient(45deg, #dc3545, #ff5a5f);
                color: white;
                padding: 6px 15px;
                border-radius: 20px;
                font-weight: 600;
                font-size: 0.8rem;
                letter-spacing: 0.5px;
                display: inline-block;
            }
            
            .badge-user {
                background: linear-gradient(45deg, #198754, #28a745);
                color: white;
                padding: 6px 15px;
                border-radius: 20px;
                font-weight: 600;
                font-size: 0.8rem;
                letter-spacing: 0.5px;
                display: inline-block;
            }
            
            .btn-delete {
                background: linear-gradient(45deg, #dc3545, #f55);
                color: white;
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
            
            .btn-delete:hover {
                transform: scale(1.05);
                box-shadow: 0 0 15px rgba(220, 53, 69, 0.4);
            }
            
            .btn-delete i {
                margin-right: 6px;
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
                text-decoration: none;
            }
            
            .page-link:hover, .page-item.active .page-link {
                background: linear-gradient(45deg, var(--gold-secondary), var(--gold-primary));
                color: black;
                box-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
                border-color: transparent;
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
                .btn-delete {
                    padding: 6px 12px;
                    font-size: 0.8rem;
                }
                .user-table thead th {
                    font-size: 0.75rem;
                    padding: 12px 8px;
                }
                .user-table td {
                    padding: 12px 8px;
                    font-size: 0.8rem;
                }
            }
            
            @media (max-width: 576px) {
                .search-filter {
                    flex-direction: column;
                    align-items: stretch;
                }
                .search-box {
                    width: 100%;
                    margin-bottom: 10px;
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
            
            /* CSS cho modal thêm người dùng */
            .modal-dialog {
                max-width: 500px;
            }

            .modal-content {
                background: linear-gradient(135deg, rgba(0, 0, 0, 0.95), rgba(10, 10, 10, 0.97));
                border: 2px solid var(--gold-primary);
                border-radius: 25px;
                box-shadow: 0 0 50px rgba(255, 215, 0, 0.3);
                backdrop-filter: blur(10px);
                padding: 20px;
            }

            .modal-header {
                border-bottom: 2px solid var(--gold-primary);
                padding: 25px;
                background: linear-gradient(45deg, rgba(255, 215, 0, 0.15), rgba(218, 165, 32, 0.15));
                border-radius: 20px 20px 0 0;
            }

            .modal-title {
                color: var(--gold-primary);
                font-weight: 700;
                font-size: 1.6rem;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                display: flex;
                align-items: center;
                gap: 15px;
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            }

            .modal-title i {
                font-size: 1.8rem;
                background: linear-gradient(45deg, var(--gold-primary), var(--gold-secondary));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .modal-body {
                padding: 30px;
                background: transparent;
            }

            .input-group {
                position: relative;
                margin-bottom: 35px;
            }

            .input-group .form-control {
                height: 55px;
                background: rgba(0, 0, 0, 0.5) !important;
                border: 2px solid var(--gold-primary) !important;
                color: var(--gold-primary) !important;
                border-radius: 20px;
                padding-left: 55px;
                font-size: 1.1rem;
                letter-spacing: 0.5px;
                transition: all 0.4s ease;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }

            .input-group .form-control:focus {
                background: rgba(0, 0, 0, 0.7) !important;
                border-color: var(--gold-bright) !important;
                box-shadow: 0 0 25px rgba(255, 215, 0, 0.2) !important;
                transform: translateY(-2px);
            }

            .input-group .form-control::placeholder {
                color: rgba(255, 215, 0, 0.6) !important;
                font-size: 1rem;
                font-weight: 300;
            }

            .input-icon {
                position: absolute;
                left: 20px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--gold-primary);
                font-size: 1.4rem;
                z-index: 2;
                transition: all 0.3s ease;
            }

            .input-group:focus-within .input-icon {
                color: var(--gold-bright);
                transform: translateY(-50%) scale(1.1);
            }

            .modal-footer {
                border-top: 2px solid var(--gold-primary);
                padding: 25px;
                background: linear-gradient(45deg, rgba(255, 215, 0, 0.15), rgba(218, 165, 32, 0.15));
                border-radius: 0 0 20px 20px;
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }

            .btn-modal-cancel {
                background: transparent;
                color: var(--gold-primary);
                border: 2px solid var(--gold-primary);
                padding: 15px 30px;
                border-radius: 30px;
                font-weight: 600;
                font-size: 1rem;
                letter-spacing: 1px;
                transition: all 0.4s ease;
                min-width: 140px;
                text-transform: uppercase;
            }

            .btn-modal-cancel:hover {
                background: rgba(255, 215, 0, 0.1);
                border-color: var(--gold-bright);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 215, 0, 0.2);
            }

            .btn-modal-submit {
                background: linear-gradient(45deg, var(--gold-primary), var(--gold-bright));
                color: black;
                border: none;
                padding: 15px 30px;
                border-radius: 30px;
                font-weight: 700;
                font-size: 1rem;
                letter-spacing: 1px;
                transition: all 0.4s ease;
                min-width: 200px;
                text-transform: uppercase;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            .btn-modal-submit:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(255, 215, 0, 0.3);
                background: linear-gradient(45deg, var(--gold-bright), var(--gold-primary));
            }

            .btn-modal-submit i {
                font-size: 1.2rem;
            }

            .btn-close {
                background: var(--gold-primary);
                opacity: 0.9;
                padding: 8px;
                border-radius: 50%;
                transition: all 0.4s ease;
            }

            .btn-close:hover {
                opacity: 1;
                transform: rotate(90deg) scale(1.1);
                box-shadow: 0 0 15px rgba(255, 215, 0, 0.4);
            }

            /* Hiệu ứng hover cho input groups */
            .input-group:hover .form-control {
                border-color: var(--gold-bright) !important;
                box-shadow: 0 0 15px rgba(255, 215, 0, 0.1) !important;
            }

            /* Ghi đè màu nền cho autofill với animation */
            .modal input:-webkit-autofill,
            .modal input:-webkit-autofill:hover,
            .modal input:-webkit-autofill:focus,
            .modal input:-webkit-autofill:active {
                -webkit-box-shadow: 0 0 0 30px var(--bg-dark) inset !important;
                -webkit-text-fill-color: var(--gold-primary) !important;
                transition: background-color 5000s ease-in-out 0s;
                border: 2px solid var(--gold-primary) !important;
            }

            /* Animation cho modal khi mở */
            .modal.fade .modal-dialog {
                transform: scale(0.7);
                opacity: 0;
                transition: all 0.3s ease-in-out;
            }

            .modal.show .modal-dialog {
                transform: scale(1);
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="userDAO" class="dao.UserDAO" scope="page" />
        
        <c:if test="${sessionScope.users.idRole == 2}">
            <c:set var="totalUsers" value="${userDAO.selectAll().size()}" />
            <c:set var="adminCount" value="0" />
            <c:set var="userCount" value="0" />
            
            <c:forEach items="${userDAO.selectAll()}" var="user">
                <c:if test="${user.idRole == 2}">
                    <c:set var="adminCount" value="${adminCount + 1}" />
                </c:if>
                <c:if test="${user.idRole != 2}">
                    <c:set var="userCount" value="${userCount + 1}" />
                </c:if>
            </c:forEach>

            <div class="page-container">
                <div class="admin-header animate__animated animate__fadeIn">
                    <h1 class="admin-title">Quản Lý Người Dùng</h1>
                    <div class="user-info">
                        <i class="fas fa-user-shield"></i> ${sessionScope.users.name}
                    </div>
                </div>
                
                <div class="stats-row">
                    <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="stat-title"><i class="fas fa-users"></i> Tổng Người Dùng</div>
                        <h3 class="stat-value">${totalUsers}</h3>
                    </div>
                    
                    <div class="stat-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="stat-title"><i class="fas fa-user-shield"></i> Admin</div>
                        <h3 class="stat-value">${adminCount}</h3>
                    </div>
                    
                    <div class="stat-card" data-aos="fade-up" data-aos-delay="300">
                        <div class="stat-title"><i class="fas fa-user"></i> Người Dùng Thường</div>
                        <h3 class="stat-value">${userCount}</h3>
                    </div>
                </div>
                
                <div class="content-card" data-aos="fade-up" data-aos-delay="400">
                    <div class="search-filter">
                        <div class="search-box">
                            <input type="text" id="searchInput" placeholder="Tìm kiếm người dùng..." oninput="searchUsers()">
                            <i class="fas fa-search"></i>
                        </div>
                        <button class="btn-add-user" data-bs-toggle="modal" data-bs-target="#addUserModal">
                            <i class="fas fa-user-plus"></i>
                            Thêm người dùng
                        </button>
                        <a href="ThongKeUser.jsp" class="btn-stats">
                            <i class="fas fa-chart-pie"></i>
                            Thống kê
                        </a>
                    </div>
                    
                    <!-- Thông báo -->
                    <% if(request.getParameter("success") != null) { 
                        String success = request.getParameter("success");
                        String successMessage = "";
                        switch(success) {
                            case "delete":
                                successMessage = "Xóa người dùng thành công!";
                                break;
                            case "add":
                                successMessage = "Thêm người dùng thành công!";
                                break;
                            default:
                                successMessage = "Thao tác thành công!";
                        }
                    %>
                        <div class="alert custom-alert" role="alert" 
                             style="background: linear-gradient(135deg, rgba(255, 215, 0, 0.15), rgba(218, 165, 32, 0.2));
                                    border: 1px solid var(--gold-primary);
                                    color: var(--gold-primary);
                                    padding: 15px 20px;
                                    border-radius: 15px;
                                    margin-bottom: 20px;
                                    font-weight: 500;
                                    display: flex;
                                    align-items: center;
                                    justify-content: space-between;
                                    box-shadow: 0 0 20px rgba(255, 215, 0, 0.1);
                                    animation: slideInDown 0.5s ease forwards;">
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <i class="fas fa-check-circle" style="color: var(--gold-primary); font-size: 1.2rem;"></i>
                                <%= successMessage %>
                            </div>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                                    style="background: transparent;
                                           color: var(--gold-primary);
                                           opacity: 0.8;
                                           padding: 0;
                                           margin-left: 15px;
                                           transition: all 0.3s ease;">
                            </button>
                        </div>
                    <% } %>
                    
                    <% if(request.getParameter("error") != null) { 
                        String error = request.getParameter("error");
                        String errorMessage = "";
                        switch(error) {
                            case "invalid_id":
                                errorMessage = "ID người dùng không hợp lệ!";
                                break;
                            case "delete_failed":
                                errorMessage = "Xóa người dùng thất bại!";
                                break;
                            case "add_failed":
                                errorMessage = "Thêm người dùng thất bại!";
                                break;
                            case "missing_data":
                                errorMessage = "Vui lòng điền đầy đủ thông tin!";
                                break;
                            case "system_error":
                                errorMessage = "Có lỗi hệ thống xảy ra!";
                                break;
                            default:
                                errorMessage = "Có lỗi xảy ra!";
                        }
                    %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= errorMessage %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <div class="table-container">
                        <table class="user-table" id="userTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>HỌ TÊN</th>
                                    <th>EMAIL</th>
                                    <th>ĐIỆN THOẠI</th>
                                    <th>VAI TRÒ</th>
                                    <th>HÀNH ĐỘNG</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userDAO.selectAll()}" var="user" varStatus="status">
                                    <tr class="animate-row" style="animation-delay: ${status.index * 50}ms">
                                        <td>${user.idUser}</td>
                                        <td>${user.name}</td>
                                        <td>${user.email}</td>
                                        <td>${user.phone}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.idRole == 2}">
                                                    <span class="badge-admin">Admin</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge-user">User</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" onclick="editUser(${user.idUser}, '${user.name}', '${user.email}', '${user.phone}', ${user.idRole})">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger" onclick="deleteUser(${user.idUser})">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <c:if test="${totalUsers > 10}">
                        <nav class="pagination-container" data-aos="fade-up">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link"><i class="fas fa-angle-left"></i></a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">3</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link"><i class="fas fa-angle-right"></i></a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
                
                <div class="text-center mt-5 mb-4" data-aos="fade-up">
                    <a href="ADMIN.jsp" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Trở về trang Admin
                    </a>
                </div>
                
                <footer class="footer">
                    <p>&copy; <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy" /> Hotel Management System. All rights reserved.</p>
                </footer>
            </div>

            <!-- Modal Cập nhật người dùng -->
            <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editUserModalLabel">Cập nhật thông tin người dùng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="updateUser" method="POST">
                            <div class="modal-body">
                                <input type="hidden" id="editIdUser" name="idUser">
                                <div class="mb-3">
                                    <label for="editName" class="form-label">Tên</label>
                                    <input type="text" class="form-control" id="editName" name="name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editPassword" class="form-label">Mật khẩu</label>
                                    <input type="password" class="form-control" id="editPassword" name="password" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="editEmail" name="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editPhone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="editPhone" name="phone" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editRole" class="form-label">Vai trò</label>
                                    <select class="form-select" id="editRole" name="idRole" required>
                                        <option value="1">USER</option>
                                        <option value="2">ADMIN</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Modal Thêm người dùng mới -->
            <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" style="background: var(--bg-dark);">
                        <div class="modal-header" style="border-bottom: 1px solid var(--gold-border); background: linear-gradient(45deg, rgba(255, 215, 0, 0.1), rgba(218, 165, 32, 0.1));">
                            <h5 class="modal-title" id="addUserModalLabel" style="color: var(--gold-primary);">
                                <i class="fas fa-user-plus me-2"></i>Thêm người dùng mới
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="addUser" method="POST" onsubmit="return validateForm()">
                            <div class="modal-body" style="background: var(--bg-dark);">
                                <div class="input-group">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" class="form-control input-with-icon" id="name" name="name" 
                                           placeholder="Nhập tên người dùng" required
                                           style="background: var(--bg-dark) !important; color: var(--gold-primary) !important; border: 1px solid var(--gold-border);">
                                </div>
                                <div class="input-group">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" class="form-control input-with-icon" id="password" name="password" 
                                           placeholder="Nhập mật khẩu" required
                                           style="background: var(--bg-dark) !important; color: var(--gold-primary) !important; border: 1px solid var(--gold-border);">
                                </div>
                                <div class="input-group">
                                    <i class="fas fa-envelope input-icon"></i>
                                    <input type="email" class="form-control input-with-icon" id="email" name="email" 
                                           placeholder="Nhập email" required
                                           style="background: var(--bg-dark) !important; color: var(--gold-primary) !important; border: 1px solid var(--gold-border);">
                                </div>
                                <div class="input-group">
                                    <i class="fas fa-phone input-icon"></i>
                                    <input type="text" class="form-control input-with-icon" id="phone" name="phone" 
                                           placeholder="Nhập số điện thoại" required
                                           style="background: var(--bg-dark) !important; color: var(--gold-primary) !important; border: 1px solid var(--gold-border);">
                                </div>
                            </div>
                            <div class="modal-footer" style="border-top: 1px solid var(--gold-border); background: linear-gradient(45deg, rgba(255, 215, 0, 0.1), rgba(218, 165, 32, 0.1));">
                                <button type="button" class="btn btn-modal-cancel" data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-modal-submit">
                                    <i class="fas fa-plus me-2"></i>Thêm người dùng
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        
        <c:if test="${sessionScope.users.idRole != 2}">
            <div class="restricted-container">
            <div class="restricted-content animate__animated animate__fadeIn">
                <i class="fas fa-exclamation-triangle restricted-icon"></i>
                <h2 class="restricted-title">Truy cập bị từ chối</h2>
                <p>Bạn không có quyền truy cập vào trang này.</p>
                <p class="countdown-text">
                    Chuyển hướng sau <span class="countdown-number">5</span> giây
                </p>
                <a href="index.jsp" class="return-home" style="text-decoration: none">
                    <i class="fas fa-home" style="text-decoration: none"></i> Về trang chủ
                </a>
            </div>
        </div>
        </c:if>
        
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
                const table = document.getElementById('userTable');
                const rows = table.getElementsByTagName('tr');
                
                for (let i = 1; i < rows.length; i++) {
                    if (rows[i].textContent.toLowerCase().includes(searchValue)) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            });
            
            // Countdown redirect for restricted access
            if (document.querySelector('.countdown-number')) {
                let seconds = 5;
                const countdownElement = document.querySelector('.countdown-number');
                
                const countdown = setInterval(() => {
                    seconds--;
                    countdownElement.textContent = seconds;
                    
                    if (seconds <= 0) {
                        clearInterval(countdown);
                        window.location.href = 'index.jsp';
                    }
                }, 1000);
            }

            function editUser(id, name, email, phone, role) {
                document.getElementById('editIdUser').value = id;
                document.getElementById('editName').value = name;
                document.getElementById('editEmail').value = email;
                document.getElementById('editPhone').value = phone;
                document.getElementById('editRole').value = role;
                
                new bootstrap.Modal(document.getElementById('editUserModal')).show();
            }

            function deleteUser(id) {
                if(confirm('Bạn có chắc chắn muốn xóa người dùng này?')) {
                    window.location.href = 'DeleteUserServlet?id=' + id;
                }
            }

            function validateForm() {
                var name = document.getElementById('name').value;
                var password = document.getElementById('password').value;
                var email = document.getElementById('email').value;
                var phone = document.getElementById('phone').value;

                if (!name || !password || !email || !phone) {
                    alert('Vui lòng điền đầy đủ thông tin!');
                    return false;
                }

                // Validate email format
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert('Email không hợp lệ!');
                    return false;
                }

                // Validate phone number (adjust regex according to your needs)
                var phoneRegex = /^[0-9]{10}$/;
                if (!phoneRegex.test(phone)) {
                    alert('Số điện thoại không hợp lệ! Vui lòng nhập 10 số.');
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>