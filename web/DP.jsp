<%-- 
    Document   : DP
    Created on : Mar 4, 2025, 11:23:28 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Phòng - Amazing Hotel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <style>
        body {
            background-color: #111;
            color: #FFD700;
            font-family: 'Poppins', sans-serif;
        }
        .card {
            background: #222;
            border: 1px solid #FFD700;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(255, 215, 0, 0.3);
        }
        .card img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .book-btn {
            background-color: transparent;
            border: 2px solid #FFD700;
            color: #FFD700;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }
        .book-btn:hover {
            background-color: #FFD700;
            color: #111;
        }
        header, footer {
            background: #000;
            text-align: center;
            padding: 20px 0;
        }
        a {
            color: #FFD700;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        
    .card-title {
    color: #FFFF99; /* Màu vàng nhạt */
}
.card-body .text-muted {
      color: #FFFFFF !important; /* Màu xám nhạt */
}
.card-body .fw-bold.text-warning {
    color: #FFD700; /* Màu vàng đậm */
}
.card-img-top {
    height: 200px; /* Điều chỉnh chiều cao phù hợp */
    object-fit: cover; /* Giữ tỉ lệ ảnh và cắt bớt phần thừa nếu cần */
    width: 100%; /* Đảm bảo ảnh chiếm hết chiều rộng của card */
}

    </style>
</head>
<body>
    <header>
        <h1 class="display-5">ĐẶT PHÒNG</h1>
        <p><a href="index.jsp"><i class="fa-solid fa-house"></i> TRANG CHỦ</a></p>
    </header>

    <div class="container my-5">
        <div class="row g-4">
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="800">
                <div class="card p-3">
                    <img src="img/imgP/PHONG1.jpg" class="card-img-top" alt="Basic Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Single Room 401</h5>
                        <p class="fw-bold text-warning">1.200.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1000">
                <div class="card p-3">
                    <img src="img/imgP/PHONG2.jpg" class="card-img-top" alt="Basic Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Single Room 402</h5>
                        <p class="fw-bold text-warning">1.500.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1200">
                <div class="card p-3">
                    <img src="img/imgP/PHONGD1.jpg" class="card-img-top" alt="Double Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Double Room 501</h5>
                        <p class="fw-bold text-warning">2.000.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1400">
                <div class="card p-3">
                    <img src="img/imgP/PHONGD2.jpg" class="card-img-top" alt="Double Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Double Room 502</h5>
                        <p class="fw-bold text-warning">2.500.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row g-4" style="padding-top: 30px">
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="800">
                <div class="card p-3">
                    <img src="img/imgP/PHONG3.jpg" class="card-img-top" alt="Basic Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Single Room 403</h5>
                        <p class="fw-bold text-warning">1.200.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1000">
                <div class="card p-3">
                    <img src="img/imgP/PHONG4.jpg" class="card-img-top" alt="Basic Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Single Room 404</h5>
                        <p class="fw-bold text-warning">1.500.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1200">
                <div class="card p-3">
                    <img src="img/imgP/PHONGD3.jpg" class="card-img-top" alt="Double Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Double Room 503</h5>
                        <p class="fw-bold text-warning">2.000.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1400">
                <div class="card p-3">
                    <img src="img/imgP/PHONGD4.jpg" class="card-img-top" alt="Double Room">
                    <div class="card-body text-center">
                        <h5 class="card-title">Double Room 504</h5>
                        <p class="fw-bold text-warning">2.500.000 VNĐ/Ngày</p>
                        <a href="DDP.jsp" class="btn book-btn w-100">Đặt phòng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Amazing Hotel. All Rights Reserved.</p>
        <p>123 Luxury St, City, Country | Phone: +123 456 789 | Email: info@amazinghotel.com</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>

