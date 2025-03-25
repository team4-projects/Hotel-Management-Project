<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm - Amazing Hotel</title>
    <link rel="stylesheet" href="style/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <style>
        body {
            background-color: #111;
            color: #FFD700;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }
        
        header {
            background: #000;
            padding: 20px 0;
            margin-bottom: 30px;
            text-align: center;
        }
        
        header h1 {
            color: #FFD700;
            font-size: 2.5em;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 20px;
            letter-spacing: 2px;
        }
        
        header a {
            color: #FFD700;
            text-decoration: none;
            font-size: 1.2em;
            transition: all 0.3s ease;
            display: inline-block;
            padding: 10px 20px;
            border: 1px solid #FFD700;
            border-radius: 25px;
            margin-top: 10px;
        }
        
        header a:hover {
            color: #111;
            background: #FFD700;
            text-decoration: none;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.2);
        }
        
        .search-results {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .search-dates {
            background: linear-gradient(145deg, #1a1a1a, #222);
            padding: 35px;
            border-radius: 20px;
            margin-bottom: 40px;
            border: 1px solid rgba(255, 215, 0, 0.3);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .search-dates::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(to right, transparent, #FFD700, transparent);
        }
        
        .search-dates h3 {
            color: #FFD700;
            margin-bottom: 25px;
            font-size: 1.8em;
            font-weight: 600;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .search-dates p {
            color: #fff;
            font-size: 1.2em;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .search-dates p i {
            color: #FFD700;
            font-size: 1.1em;
        }
        
        .search-dates .date-value {
            color: #FFD700;
            font-weight: 600;
            background: rgba(255, 215, 0, 0.1);
            padding: 8px 15px;
            border-radius: 10px;
            margin-left: 10px;
            border: 1px solid rgba(255, 215, 0, 0.2);
        }
        
        h2 {
            color: #FFD700;
            margin-bottom: 25px;
            font-weight: 600;
            text-align: center;
        }
        
        .card {
            background: #222;
            border: 1px solid #FFD700;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            height: 100%;
        }
        
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(255, 215, 0, 0.3);
        }
        
        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        
        .card-body {
            padding: 20px;
        }
        
        .card-title {
            color: #FFFF99;
            font-size: 1.2em;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        .fw-bold.text-warning {
            color: #FFD700 !important;
            font-size: 1.1em;
            margin: 15px 0;
        }
        
        .book-btn {
            background-color: transparent;
            border: 2px solid #FFD700;
            color: #FFD700;
            padding: 10px 20px;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
            text-transform: uppercase;
            font-size: 0.9em;
        }
        
        .book-btn:hover {
            background-color: #FFD700;
            color: #111;
        }
        
        .no-rooms {
            text-align: center;
            padding: 40px 20px;
            background: #222;
            border: 1px solid #FFD700;
            border-radius: 15px;
            margin: 40px 0;
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.1);
        }
        
        .no-rooms h3 {
            color: #FFD700;
            margin-bottom: 15px;
            font-size: 1.5em;
        }
        
        .no-rooms p {
            color: #fff;
            margin-bottom: 20px;
        }
        
        .no-rooms .btn-primary {
            background-color: transparent;
            border: 2px solid #FFD700;
            color: #FFD700;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
            border-radius: 10px;
        }
        
        .no-rooms .btn-primary:hover {
            background-color: #FFD700;
            color: #111;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .row > * {
            animation: fadeIn 0.5s ease-out forwards;
        }
        
        .row > *:nth-child(2) { animation-delay: 0.1s; }
        .row > *:nth-child(3) { animation-delay: 0.2s; }
        .row > *:nth-child(4) { animation-delay: 0.3s; }
    </style>
</head>
<body>
    <header>
        <h1>Kết quả tìm kiếm</h1>
        <p><a href="index.jsp"><i class="fa-solid fa-house"></i> TRANG CHỦ</a></p>
    </header>

    <div class="search-results">
        <div class="search-dates">
            <h3>Thời gian tìm kiếm</h3>
            <p><i class="fas fa-calendar-check"></i> Check-in: <span class="date-value">${checkIn}</span></p>
            <p><i class="fas fa-calendar-times"></i> Check-out: <span class="date-value">${checkOut}</span></p>
        </div>

        <c:if test="${empty availableRooms}">
            <div class="no-rooms">
                <h3>Không có phòng trống trong thời gian này</h3>
                <p>Vui lòng thử tìm kiếm với thời gian khác</p>
                <a href="DP.jsp" class="btn btn-primary mt-3">Quay lại tìm kiếm</a>
            </div>
        </c:if>

        <div class="row">
            <c:forEach items="${availableRooms}" var="room">
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="card p-3">
                        <c:choose>
                            <c:when test="${room.idRoom >= 401 && room.idRoom <= 404}">
                                <img src="img/imgP/PHONG${room.idRoom - 400}.jpg" class="card-img-top" alt="${room.nameRoom}">
                            </c:when>
                            <c:when test="${room.idRoom >= 501 && room.idRoom <= 504}">
                                <img src="img/imgP/PHONGD${room.idRoom - 500}.jpg" class="card-img-top" alt="${room.nameRoom}">
                            </c:when>
                        </c:choose>
                        <div class="card-body text-center">
                            <h5 class="card-title">${room.nameRoom}</h5>
                            <p class="fw-bold text-warning">${room.price} VNĐ/Ngày</p>
                            <a href="DDP.jsp?roomId=${room.idRoom}&checkIn=${checkIn}&checkOut=${checkOut}" 
                               class="btn book-btn w-100">Đặt phòng</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 