<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.Users"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê người dùng</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            :root {
                --bg-dark: #1a1a1a;
                --gold-primary: #FFD700;
                --gold-secondary: #DAA520;
                --gold-bright: #FFF700;
                --gold-border: #B8860B;
            }

            body {
                background-color: var(--bg-dark);
                color: var(--gold-primary);
            }

            .dashboard-container {
                padding: 30px;
            }

            .stats-card {
                background: linear-gradient(135deg, rgba(0, 0, 0, 0.95), rgba(10, 10, 10, 0.97));
                border: 2px solid var(--gold-primary);
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 25px;
                box-shadow: 0 0 20px rgba(255, 215, 0, 0.1);
            }

            .stats-card h3 {
                color: var(--gold-primary);
                font-size: 1.2rem;
                margin-bottom: 15px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .stats-card .number {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--gold-bright);
                text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            }

            .chart-container {
                background: linear-gradient(135deg, rgba(0, 0, 0, 0.95), rgba(10, 10, 10, 0.97));
                border: 2px solid var(--gold-primary);
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 25px;
                box-shadow: 0 0 20px rgba(255, 215, 0, 0.1);
            }

            .chart-title {
                color: var(--gold-primary);
                font-size: 1.4rem;
                margin-bottom: 20px;
                text-align: center;
                font-weight: 600;
            }

            .btn-back {
                background: transparent;
                color: var(--gold-primary);
                border: 2px solid var(--gold-primary);
                padding: 10px 20px;
                border-radius: 25px;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s ease;
                margin-bottom: 20px;
            }

            .btn-back:hover {
                background: rgba(255, 215, 0, 0.1);
                color: var(--gold-bright);
                transform: translateX(-5px);
            }

            .table {
                color: var(--gold-primary);
                border-color: var(--gold-border);
            }

            .table thead th {
                background: linear-gradient(45deg, rgba(255, 215, 0, 0.15), rgba(218, 165, 32, 0.15));
                border-color: var(--gold-border);
                color: var(--gold-bright);
            }

            .table tbody td {
                border-color: var(--gold-border);
            }

            .badge {
                padding: 8px 12px;
                border-radius: 20px;
                font-weight: 500;
            }

            .badge-admin {
                background: linear-gradient(45deg, #FFD700, #DAA520);
                color: black;
            }

            .badge-user {
                background: linear-gradient(45deg, #4a4a4a, #2d2d2d);
                color: var(--gold-primary);
                border: 1px solid var(--gold-primary);
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="userDAO" class="dao.UserDAO" scope="page" />
        
        <c:if test="${sessionScope.users.idRole == 2}">
            <!-- Calculate statistics -->
            <c:set var="allUsers" value="${userDAO.selectAll()}" />
            <c:set var="totalUsers" value="${allUsers.size()}" />
            <c:set var="adminCount" value="0" />
            <c:set var="userCount" value="0" />
            
            <c:forEach items="${allUsers}" var="user">
                <c:if test="${user.idRole == 2}">
                    <c:set var="adminCount" value="${adminCount + 1}" />
                </c:if>
                <c:if test="${user.idRole == 1}">
                    <c:set var="userCount" value="${userCount + 1}" />
                </c:if>
            </c:forEach>
            
            <div class="dashboard-container">
                <a href="QuanLyUser.jsp" class="btn-back">
                    <i class="fas fa-arrow-left"></i>
                    Quay lại quản lý người dùng
                </a>

                <div class="row">
                    <!-- Thống kê tổng quan -->
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h3><i class="fas fa-users"></i> Tổng số người dùng</h3>
                            <div class="number">${totalUsers}</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h3><i class="fas fa-user-shield"></i> Số Admin</h3>
                            <div class="number">${adminCount}</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h3><i class="fas fa-user"></i> Số User thường</h3>
                            <div class="number">${userCount}</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h3><i class="fas fa-chart-line"></i> Tỷ lệ Admin/User</h3>
                            <div class="number">
                                <c:set var="ratio" value="${(adminCount / userCount) * 100}" />
                                ${String.format("%.1f", ratio)}%
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <!-- Biểu đồ phân bố người dùng -->
                    <div class="col-md-6">
                        <div class="chart-container">
                            <h4 class="chart-title">Phân bố người dùng theo vai trò</h4>
                            <canvas id="userDistributionChart"></canvas>
                        </div>
                    </div>
                    
                    <!-- Bảng thống kê chi tiết -->
                    <div class="col-md-6">
                        <div class="chart-container">
                            <h4 class="chart-title">Danh sách người dùng theo vai trò</h4>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Tên</th>
                                            <th>Email</th>
                                            <th>Vai trò</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${userDAO.selectAll()}" var="user">
                                            <tr>
                                                <td>${user.name}</td>
                                                <td>${user.email}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.idRole == 2}">
                                                            <span class="badge badge-admin">Admin</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-user">User</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
                    <a href="index.jsp" class="back-btn">
                        <i class="fas fa-home"></i> Về trang chủ
                    </a>
                </div>
            </div>
            
            <script>
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
            </script>
        </c:if>
        
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Chart initialization -->
        <script>
            window.addEventListener('DOMContentLoaded', (event) => {
                // Biểu đồ phân bố người dùng
                const ctx = document.getElementById('userDistributionChart');
                if (ctx) {
                    new Chart(ctx.getContext('2d'), {
                        type: 'doughnut',
                        data: {
                            labels: ['Admin', 'User'],
                            datasets: [{
                                data: [Number('${adminCount}'), Number('${userCount}')],
                                backgroundColor: [
                                    'rgba(255, 215, 0, 0.8)',
                                    'rgba(218, 165, 32, 0.8)'
                                ],
                                borderColor: [
                                    'rgba(255, 215, 0, 1)',
                                    'rgba(218, 165, 32, 1)'
                                ],
                                borderWidth: 2
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'bottom',
                                    labels: {
                                        color: '#FFD700',
                                        font: {
                                            size: 14
                                        }
                                    }
                                }
                            }
                        }
                    });
                }
            });
        </script>
    </body>
</html> 