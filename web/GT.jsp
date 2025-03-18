<%-- 
    Document   : GT
    Created on : Mar 4, 2025, 1:05:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Khách sạn 5 sao tại Nha Trang với view biển tuyệt đẹp, dịch vụ sang trọng và tiện nghi hiện đại.">
    <title>Best Western Premier Marvella Nha Trang</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: #f5f5f5;
            scroll-behavior: smooth;
        }
        
        /* Hero Section */
        .welcome-section {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('./img/GT.jpg') center/cover;
            color: white;
            text-align: center;
            padding: 120px 20px;
            border-radius: 15px;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Image Gallery */
        .imgGT img {
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease-in-out;
        }

        .imgGT img:hover {
            transform: scale(1.05);
        }

        /* Điểm Nổi Bật */
        .highlight-section {
            background: #121212;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(200, 155, 60, 0.4);
            transition: transform 0.3s ease-in-out;
            border: 1px solid rgba(200, 155, 60, 0.6);
        }

        .highlight-section:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 18px rgba(200, 155, 60, 0.6);
        }

        .highlight-section h2 {
            color: #c89b3c;
            font-weight: bold;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .highlight-list {
            padding: 0;
        }

        .highlight-list li {
            font-size: 18px;
            padding: 15px;
            background: rgba(255, 255, 255, 0.05);
            color: #f5f5f5;
            border: 1px solid rgba(200, 155, 60, 0.4);
            transition: all 0.3s ease-in-out;
            border-radius: 10px;
            margin: 8px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .highlight-list li i {
            font-size: 22px;
            color: #c89b3c;
        }

        .highlight-list li:hover {
            background: rgba(200, 155, 60, 0.2);
            transform: scale(1.05);
            box-shadow: 0 0 12px rgba(200, 155, 60, 0.6);
        }

        /* Fade In Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .btn-luxury {
        display: inline-block;
        padding: 12px 24px;
        font-size: 18px;
        font-weight: bold;
        text-transform: uppercase;
        color: #FFD700; /* Màu vàng gold */
        background: transparent;
        border: 2px solid #FFD700; /* Viền vàng gold */
        border-radius: 8px;
        text-decoration: none;
        transition: all 0.3s ease-in-out;
        box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
        position: relative;
        overflow: hidden;
    }

    .btn-luxury:hover {
        background: #000; /* Đổi nền thành đen khi hover */
        color: #FFD700;
        box-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
        transform: scale(1.05);
    }
    </style>
</head>
<body>
    <main class="container py-5">
        <!-- Welcome Section -->
        <section class="welcome-section mb-5" data-aos="fade-up">
            <h1 class="display-3 fw-bold">Chào mừng đến với sự sang trọng</h1>
            <p class="lead">
                Best Western Premier Marvella Nha Trang - Đẳng cấp 5 sao tại thành phố biển. Tận hưởng không gian xa hoa, tiện nghi và tầm nhìn tuyệt đẹp.
            </p>
            <a href="#highlights" class="btn btn-light btn-lg mt-3">Khám phá ngay <i class="fas fa-arrow-down"></i></a>
        </section>
        
        <!-- Image Gallery -->
        <div class="row row-cols-1 row-cols-md-3 g-4 imgGT">
            <div class="col" data-aos="zoom-in">
                <img src="./img/GT3jpg.jpg" class="img-fluid" alt="Hồ bơi vô cực">
            </div>
            <div style="padding-top: 30px" class="col" data-aos="zoom-in" data-aos-delay="200">
                <img src="./img/GT.jpg" class="img-fluid" alt="Khách sạn Nha Trang">
            </div>
            <div class="col" data-aos="zoom-in" data-aos-delay="400">
                <img src="./img/GT2.jpg" class="img-fluid" alt="Phòng khách sạn sang trọng">
            </div>
        </div>
        
        <!-- Highlight Section -->
        <section id="highlights" class="highlight-section text-center mt-5" data-aos="fade-up">
            <h2 class="mb-4">Điểm Nổi Bật Của Chúng Tôi</h2>
            <ul class="list-group highlight-list">
                <li class="list-group-item" data-aos="fade-up" data-aos-delay="100">
                    <i class="fas fa-map-marker-alt"></i> Vị trí đắc địa trên đường Trần Phú
                </li>
                <li class="list-group-item" data-aos="fade-up" data-aos-delay="200">
                    <i class="fas fa-water"></i> 100% phòng và suite có tầm nhìn ra đại dương
                </li>
                <li class="list-group-item" data-aos="fade-up" data-aos-delay="300">
                    <i class="fas fa-swimming-pool"></i> Hồ bơi vô cực trên cao
                </li>
                <li class="list-group-item" data-aos="fade-up" data-aos-delay="400">
                    <i class="fas fa-golf-ball"></i> Câu lạc bộ Golf 3D trong nhà
                </li>
                <li class="list-group-item" data-aos="fade-up" data-aos-delay="500">
                    <i class="fas fa-cocktail"></i> Sky Bar ở tầng 32
                </li>
                <li class="list-group-item" data-aos="fade-up" data-aos-delay="600">
                    <i class="fas fa-spa"></i> Trầm Spa - Nâng niu giác quan của bạn
                </li>
            </ul>
        </section>
    </main>
    
    <a href="index.jsp" class="btn btn-luxury">
    Quay lại trang chủ
</a>

    <!-- Bootstrap & AOS JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: true
        });
    </script>
</body>
</html>
