<%-- 
   Document   : index
   Created on : Mar 4, 2025, 11:19:16 AM
   Author     : ASUS
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Amazing Hotel - Book your stay with ease" />
        <meta name="keywords" content="hotel, booking, stay, luxury, accommodation" />
        <meta name="author" content="Amazing Hotel" />
        <title>Amazing Hotel</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>
            .video-background {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                overflow: hidden;
                z-index: -1;
            }

            .video-background iframe {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 120vw;  /* Phóng to video lớn hơn màn hình */
                height: 67.5vw; /* Giữ đúng tỷ lệ 16:9 */
                max-height: 120vh;
                max-width: 213.33vh;
                transform: translate(-50%, -50%) scale(1.2); /* Phóng to lên 120% */
                object-fit: cover; /* Che phủ toàn bộ */
                pointer-events: none; /* Ngăn bấm vào video */
            }
            /* Hiệu ứng ánh sáng vàng nhẹ cho AMAZING HOTEL */
            .video-overlay h1 {
                font-family: 'Merriweather', serif;
                font-size: 2rem; /* Giảm kích thước */
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 2px;
                color: #FFD700; /* Màu vàng nhẹ */
                text-shadow: 0 0 3px rgba(255, 215, 0, 0.5), 0 0 6px rgba(255, 200, 0, 0.3);
                transition: text-shadow 0.4s ease-in-out, color 0.4s ease-in-out;
            }

            /* Khi hover vào, ánh sáng sẽ tăng nhẹ */
            .video-overlay h1:hover {
                color: #ffec80;
                text-shadow: 0 0 8px rgba(255, 215, 0, 0.7), 0 0 15px rgba(255, 200, 0, 0.5);
            }

            /* Font chữ ký mềm mại hiện đại cho "NƠI ĐỂ THUỘC VỀ" */
            .video-overlay h2 {
                font-family: 'Merriweather', serif;
                font-size: 1.2rem; /* Nhỏ hơn */
                font-weight: 400;
                color: #ffffff;
                display: inline-block;
                transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
            }

            /* Khi hover, xoay nhẹ và tăng độ rõ */
            .video-overlay h2:hover {
                transform: rotate(1deg);
                opacity: 0.9;
            }


        </style>
    </head>
    <body>
        <%
            Users u = (Users) session.getAttribute("users");
        %>

        <div class="video-background">
            <iframe 
                src="https://www.youtube.com/embed/WB2IWIYo_1A?autoplay=1&mute=1&loop=1&playlist=WB2IWIYo_1A&vq=hd2160&rel=0&modestbranding=1&showinfo=0" 
                frameborder="0"
                allow="autoplay; encrypted-media"
                allowfullscreen>
            </iframe>
        </div>




        <header class="bg-dark text-white py-3 position-relative" style="z-index: 2;">
            <div class="container d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <img src="./img/logo-1.png" alt="logo" class="me-3" height="50" />
                    <div id="videoOverlay" class="video-overlay">
                        <h1 class="h4 mb-0">AMAZING HOTEL</h1>
                        <h2 class="h6 mb-0">NƠI ĐỂ THUỘC VỀ</h2>
                    </div>
                </div>
                <nav>
                    <ul class="nav">
                        <li class="nav-item"><a href="index.jsp" class="nav-link text-white"><i class="fa-solid fa-house"></i> TRANG CHỦ</a></li>
                        <li class="nav-item"><a href="GT.jsp" class="nav-link text-white">GIỚI THIỆU</a></li>
                        <li class="nav-item"><a href="DP.jsp" class="nav-link text-white">ĐẶT PHÒNG</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">DỊCH VỤ</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="DM.jsp">MÓN ĂN</a></li>
                                <li><a class="dropdown-item" href="DVP.jsp">DỊCH VỤ</a></li>
                                <li><a class="dropdown-item" href="DG.jsp">ĐÁNH GIÁ</a></li>
                            </ul>
                        </li>
                        <%
                            if (u == null) {

                        %>
                        <li class="nav-item"><a href="DN.jsp" class="nav-link text-white">ĐĂNG NHẬP</a></li>
                            <%                        } else {
                            %>
                        <li class="nav-item d-flex"><a href="HS.jsp" class="nav-link text-white"><%= u.getName()%></a></li>

                        <%
                            }
                        %>
                        <li class="nav-item d-flex">
                            <a href="#" class="nav-link text-white"><i class="fa-brands fa-facebook"></i></a>
                            <a href="#" class="nav-link text-white"><i class="fa-solid fa-envelope"></i></a>
                        </li>
                     
                    </ul>
                </nav>
            </div>
        </header>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                setTimeout(() => {
                    document.getElementById("videoOverlay").classList.add("show");
                }, 500);
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelector(".navbar").classList.add("show");
            });
        </script>


    </body>
</html>

