<%-- 
    Document   : DM
    Created on : Mar 4, 2025, 11:37:39 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gọi Món Cao Cấp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style/custom.css">
    <style>
        body {
            background-color: #1b1b1b;
            font-family: 'Poppins', sans-serif;
            color: white;
        }
        .navbar {
            background-color: #111;
            border-bottom: 2px solid gold;
        }
        .navbar-brand {
            font-size: 2rem;
            font-weight: bold;
            color: gold;
        }
        .hero {
            background: url('img/luxury-restaurant.jpg') no-repeat center center/cover;
            color: white;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .hero h1 {
            font-size: 4rem;
            font-weight: bold;
            text-shadow: 2px 2px 10px black;
        }
        .menu-item {
            border: 3px solid gold;
            padding: 20px;
            border-radius: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            background: #222;
        }
        .menu-item:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(255, 215, 0, 0.5);
        }
        .menu-item img {
            border-radius: 20px;
            transition: transform 0.3s;
            width: 100%;
            height: 250px;
            object-fit: cover;
            border: 2px solid gold;
        }
        .menu-item h4, .menu-item p {
            color: gold;
        }
        .btn-success {
            background-color: gold;
            border: none;
            color: black;
        }
        .btn-success:hover {
            background-color: #c9a300;
        }
        footer {
            background: black;
            color: gold;
            text-align: center;
            padding: 20px;
            border-top: 2px solid gold;
        }
      .hero {
    background: url('img/tnat.jpg') no-repeat center center/cover;
    color: white;
    height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 50px; /* Tạo khoảng trống xung quanh nội dung */
    width: 100%;
}
.hero div {
    background: rgba(255, 255, 255, 0.2); /* Nền trắng trong suốt hơn */
    backdrop-filter: blur(5px); /* Giảm độ mờ xuống 5px */
    -webkit-backdrop-filter: blur(5px); /* Hỗ trợ Safari */
    padding: 40px;
    border-radius: 15px;
    display: inline-block;
    max-width: 90%;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); /* Đổ bóng nhẹ */
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3); /* Giúp chữ rõ hơn */
}
.col-md-3 menu-item {
    
    padding: 10px;
}

    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">AMAZING</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#menu">Thực đơn</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">Về Chúng Tôi</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <section id="home" class="hero">
        <div>
            <h1>Trải nghiệm ẩm thực hoàng gia</h1>
            <p>Thưởng thức những món ăn tuyệt vời trong không gian đẳng cấp</p>
            <a href="#menu" class="btn btn-success btn-lg">Khám phá thực đơn</a>
        </div>
    </section>

    <section id="menu" class="container my-5">
        <h2 class="text-center mb-4 text-gold">Thực đơn cao cấp</h2>
      <div class="row g-4">
            <div class="col-md-3 menu-item">
                <img src="img/fish.jpg" alt="Fish">
                <h4>ID: 1 - Fish Sandwich</h4>
                <p>50000</p>
                <a href="order.jsp?id=1&name=Fish Sandwich&price=10" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/bonuong.jpg" alt="Bò Nướng">
                <h4>ID: 2 - Bò Nướng</h4>
                <p>4000000</p>
                <a href="order.jsp?id=2&name=Bò Nướng&price=40" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/creme.jpg" alt="Kem Flan">
                <h4>ID: 3 - Kem Flan</h4>
                <p>50000</p>
                <a href="order.jsp?id=3&name=Kem Flan&price=20" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/sushi.webp" alt="Sushi">
                <h4>ID: 4 - Sushi</h4>
                <p>3000000</p>
                <a href="order.jsp?id=4&name=Sushi&price=30" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/lobster.jpg" alt="Lobster">
                <h4>ID: 5 - Tôm Hùm</h4>
                <p>2000000</p>
                <a href="order.jsp?id=5&name=Tôm Hùm&price=100" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/steak.jpg" alt="Steak">
                <h4>ID: 6 - Steak Wagyu</h4>
                <p>1500000</p>
                <a href="order.jsp?id=6&name=Steak Wagyu&price=150" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/truffle.jpg" alt="Truffle Pasta">
                <h4>ID: 7 - Truffle Pasta</h4>
                <p>900000</p>
                <a href="order.jsp?id=7&name=Truffle Pasta&price=90" class="btn btn-success">Đặt món</a>
            </div>
            <div class="col-md-3 menu-item">
                <img src="img/oyster.jpg" alt="Oyster">
                <h4>ID: 8 - Hàu Tươi</h4>
                <p>500000</p>
                <a href="order.jsp?id=8&name=Hàu Tươi&price=50" class="btn btn-success">Đặt món</a>
            </div>
        </div>
    </section>

    <section id="about" class="text-center py-5 bg-dark">
        <h2 class="text-gold">Về chúng tôi</h2>
        <p class="container text-light">Chúng tôi mang đến trải nghiệm ẩm thực hoàn hảo với các nguyên liệu tươi ngon được chọn lọc kỹ càng.</p>
    </section>

    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center" style="align-items: center ; padding-top: 20px">
                <p>&copy; 2025 Amazing Hotel. All Rights Reserved.</p>
                <p>123 Luxury St, City, Country | Phone: +123 456 789 | Email: info@amazinghotel.com</p>
                <div>
                    <a href="#" class="text-white me-3"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#" class="text-white me-3"><i class="fa-brands fa-twitter"></i></a>
                    <a href="#" class="text-white"><i class="fa-brands fa-instagram"></i></a>
                </div>
            </div>
        </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
