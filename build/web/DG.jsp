<%-- 
    Document   : DG
    Created on : Mar 4, 2025, 11:36:44 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bình luận sản phẩm - Luxury Style</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- AOS Animation -->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #1a1a1a, #222);
            color: #fff;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
        }
        .luxury-card {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid gold;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(255, 215, 0, 0.5);
            padding: 30px;
        }
        .luxury-card input, .luxury-card textarea {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
        }
        .luxury-card input:focus, .luxury-card textarea:focus {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: none;
        }
        .btn-luxury {
            background: gold;
            color: #000;
            font-weight: bold;
            border-radius: 30px;
            transition: 0.3s;
        }
        .btn-luxury:hover {
            background: #d4af37;
            color: #fff;
            transform: scale(1.05);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: gold;
            text-shadow: 2px 2px 10px rgba(255, 215, 0, 0.8);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="header" data-aos="fade-down">
            <h1>Bình luận sản phẩm & dịch vụ</h1>
            <p>
                <a href="index.jsp" class="btn btn-outline-light">
                    <i class="fa-solid fa-house"></i> TRANG CHỦ
                </a>
            </p>
        </div>

        <div class="luxury-card" data-aos="zoom-in">
            <form>
                <div class="mb-3">
                    <label for="name" class="form-label">Tên của bạn:</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label for="comment" class="form-label">Bình luận của bạn:</label>
                    <textarea id="comment" name="comment" rows="4" class="form-control" required></textarea>
                </div>
                
                <div class="mb-3">
                    <label for="rating" class="form-label">Đánh giá của bạn:</label>
                    <input type="number" id="rating" name="rating" class="form-control" min="1" max="5">
                </div>
                
                <button type="submit" class="btn btn-luxury w-100" data-aos="fade-up">Gửi bình luận</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- AOS Animation -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: true
        });
    </script>
</body>
</html>
