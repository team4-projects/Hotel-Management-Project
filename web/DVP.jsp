<%-- 
    Document   : DVP
    Created on : Mar 5, 2025, 10:28:20 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOUR SEASONS DINING</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700&display=swap');

        body {
            background-color: #0d0d0d;
            color: gold;
            font-family: 'Merriweather', serif;
            margin: 0;
            padding: 0;
        }

        header {
            text-align: center;
            padding: 50px 0;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.6));
        }

        .abc h3 {
            font-size: 2rem;
            font-weight: 700;
            color: gold;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .abc h1 {
            font-size: 3rem;
            font-weight: 700;
            color: white;
        }

        .abc h1 em {
            color: gold;
            font-style: normal;
        }

        .hero {
            position: relative;
            height: 50vh;
            background: url('img/tnat.jpg') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .description {
            text-align: center;
            font-size: 1.2rem;
            margin: 30px auto;
            max-width: 80%;
        }

        .container {
            text-align: center;
            padding: 40px 0;
        }

        .title {
            font-size: 2.5rem;
            font-weight: 700;
            color: gold;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .restaurant-list {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: nowrap;
            gap: 10px;
            max-width: 1240px;
            margin: auto;
            overflow: hidden; /* Tránh tràn ngoài */
        }

        .restaurant-item {
            max-width: 180px;
            flex: 1 1 16%;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid gold;
            background-color: rgba(255, 215, 0, 0.1);
        }

        .restaurant-item img {
            width: 100%;
            height: 140px;
            border-radius: 8px;
            object-fit: cover;
        }

        .restaurant-item h3 {
            font-size: 1.2rem;
            margin-top: 8px;
        }

       @font-face {
    font-family: 'Casterio Signature';
    src: url('http://your-link-to-font.com/CasterioSignature.ttf') format('truetype'); 
    font-weight: normal;
    font-style: normal;
}

.restaurant-item p {
    font-size: 0.9rem;
    color: white;
    font-family: 'Casterio Signature', cursive;
}


        .restaurant-item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(255, 215, 0, 0.3);
            border-color: gold;
        }
        
        .swiper-container {
    width: 80%; /* Điều chỉnh để vừa 6 thẻ */
    max-width: 1200px; /* Giới hạn tối đa */
    margin: auto;
    display: flex;
    justify-content: center;
    overflow: hidden;
}

.swiper-wrapper {
    display: flex;
    justify-content: center;
    gap: 10px; /* Khoảng cách giữa các thẻ */
    flex-wrap: nowrap; /* Không cho xuống dòng */
}

.swiper-slide {
    width: 180px; /* Giảm kích thước mỗi thẻ */
    padding: 10px;
}


    </style>
</head>
<body>
    <header>
        <section class="abc">
            <h3>FOUR SEASONS DINING</h3>
            <h1>IT'S <em>MAGIC</em> AT THE TABLE</h1>
        </section>
    </header>

    <section class="hero">
        <div class="overlay"></div>
    </section>

    <section class="description">
        <p>
            The table is set. The menu is ready. All that’s missing now is you.
            Discover unparalleled fine dining and extraordinary culinary experiences
            at Four Seasons acclaimed restaurants and bars around the globe.
        </p>
    </section>

    <div class="container">
        <h2 class="title">AWARD-WINNING RESTAURANTS & BARS</h2>
        <div class="restaurant-list">
            <div class="restaurant-item">
                <img src="./img/DVP1.jpg" alt="Dish 1">
                <h3>Bò Beefsteak</h3>
                <p>SPAGHETTI GRATIN</p>
            </div>
            <div class="restaurant-item">
                <img src="./img/DVP2.jpg" alt="Dish 2">
                <h3>Jin Sha</h3>
                <p>SEA URCHIN</p>
            </div>
            <div class="restaurant-item">
                <img src="./img/DVP3.jpg" alt="Dish 3">
                <h3>Auro</h3>
                <p>DRY-AGED SHIMA AJI</p>
            </div>
            <div class="restaurant-item">
                <img src="./img/DVP4.jpg" alt="Dish 4">
                <h3>BKK Social Club</h3>
                <p>JIMADOR</p>
            </div>
            <div class="restaurant-item">
                <img src="./img/DVP5.jpg" alt="Dish 5">
                <h3>Pelagos</h3>
                <p>CAVIAR [PASTA]</p>
            </div>
            <div class="restaurant-item">
                <img src="./img/DVP6.jpg" alt="Dish 6">
                <h3>VIRTÙ</h3>
                <p>SMOKED FASHIONED</p>
            </div>
        </div>
    </div>
</body>
</html>
