<%-- 
    Document   : DDP
    Created on : Mar 5, 2025, 10:05:05 PM
    Author     : ADMIN
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

            @keyframes glowing-border {
                0% {
                    box-shadow: 0 0 5px #FFD700;
                }
                50% {
                    box-shadow: 0 0 15px #FFD700, 0 0 25px #FFD700;
                }
                100% {
                    box-shadow: 0 0 5px #FFD700;
                }
            }

            .border-glow {
                border: 2px solid #FFD700;
                animation: glowing-border 1.5s infinite alternate;
                border-radius: 10px;
            }
            .form-control {
                background-color: #444 !important; /* Màu xám */
                border: 1px solid #FFD700; /* Viền vàng */
            }

            .form-control::placeholder {
                color: #bbb; /* Màu placeholder nhạt hơn */
            }

            .form-control:focus {
                box-shadow: none;
                background-color: #444 !important; /* Màu xám */
                color: #000 !important;
            }


            /* Chỉnh màu chữ thành trắng */
            label, .btn {
                color: #fff !important;
            }

            /* Ô nhập liệu nền trắng, viền xám */


            .form-control::placeholder {
                color: #777; /* Placeholder màu xám nhạt */
            }

            /* Khi focus không có viền vàng */



            /* Bỏ màu vàng viền bên trong box */
            .border-glow {
                border: 2px solid #ccc; /* Đổi viền thành xám */
                box-shadow: none; /* Xóa hiệu ứng phát sáng vàng */
            }

            /* Nút gửi bình luận màu vàng nhưng chữ đen */
            .btn-warning {
                background-color: #FFD700 !important;
                color: #000 !important;
                border: none;
            }

            .btn-warning:hover {
                background-color: #FFC107 !important; /* Màu vàng nhạt khi hover */
            }
            /* Tổng thể */
            body {
                background-color: #111;
                color: #FFD700;
                font-family: 'Poppins', sans-serif;
            }

            /* Card với hiệu ứng */
            .card {
                background: #222;
                border: 1px solid #FFD700;
                border-radius: 15px;
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

            /* Header & Footer */
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

            /* Hiệu ứng viền phát sáng */
            @keyframes glowing-border {
                0% {
                    box-shadow: 0 0 5px #FFD700;
                }
                50% {
                    box-shadow: 0 0 15px #FFD700, 0 0 25px #FFD700;
                }
                100% {
                    box-shadow: 0 0 5px #FFD700;
                }
            }

            /* Viền phát sáng */
            .border-glow {
                border: 2px solid #FFD700;
                animation: glowing-border 1.5s infinite alternate;
                border-radius: 10px;
            }

            /* Form control (ô nhập liệu) */
            .form-control {
                background-color: #808080 !important; /* Nền trắng */
                color: #fff !important; /* Chữ đen */
                border: 1px solid #ccc; /* Viền xám */
            }

            .form-control::placeholder {
                color: #777; /* Placeholder màu xám nhạt */
            }

            .form-control:focus {
                box-shadow: none;
                background-color: #fff !important;
                color: #000 !important;
                border-color: #666;
            }

            /* Nút đặt phòng */
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

            /* Nút gửi bình luận */
            .btn-warning {
                background-color: #FFD700 !important;
                color: #000 !important;
                border: none;
            }

            .btn-warning:hover {
                background-color: #FFC107 !important;
            }
            body, h1, h2, h3, h4, h5, h6, p, label {
                color: #FFD700 !important;
            }
            .card-img-top {
                height: 200px; /* Điều chỉnh chiều cao phù hợp */
                object-fit: cover; /* Giữ tỉ lệ ảnh và cắt bớt phần thừa nếu cần */
                width: 100%; /* Đảm bảo ảnh chiếm hết chiều rộng của card */
            }

        </style>
    </head>
    <body>

        <%
            String error = request.getAttribute("error") + "";
            if (error.equals("null")) {
                error = "";
            }
        %>

        <header>
            <h1 class="display-5">Đặt Phòng</h1>
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
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1000">
                    <div class="card p-3">
                        <img src="img/imgP/PHONG2.jpg" class="card-img-top" alt="Basic Room">
                        <div class="card-body text-center">
                            <h5 class="card-title">Single Room 402</h5>
                            <p class="fw-bold text-warning">1.500.000 VNĐ/Ngày</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1200">
                    <div class="card p-3">
                        <img src="img/imgP/PHONGD1.jpg" class="card-img-top" alt="Double Room">
                        <div class="card-body text-center">
                            <h5 class="card-title">Double Room 501</h5>
                            <p class="fw-bold text-warning">2.000.000 VNĐ/Ngày</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1400">
                    <div class="card p-3">
                        <img src="img/imgP/PHONGD2.jpg" class="card-img-top" alt="Double Room">
                        <div class="card-body text-center">
                            <h5 class="card-title">Double Room 502</h5>
                            <p class="fw-bold text-warning">2.500.000 VNĐ/Ngày</p>
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
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1000">
                    <div class="card p-3">
                        <img src="img/imgP/PHONG4.jpg" class="card-img-top" alt="Basic Room">
                        <div class="card-body text-center">
                            <h5 class="card-title">Single Room 404</h5>
                            <p class="fw-bold text-warning">1.500.000 VNĐ/Ngày</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1200">
                    <div class="card p-3">
                        <img src="img/imgP/PHONGD3.jpg" class="card-img-top" alt="Double Room">
                        <div class="card-body text-center">
                            <h5 class="card-title">Double Room 503</h5>
                            <p class="fw-bold text-warning">2.000.000 VNĐ/Ngày</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-duration="1400">
                    <div class="card p-3">
                        <img src="img/imgP/PHONGD4.jpg" class="card-img-top" alt="Double Room">
                        <div class="card-body text-center">
                            <h5 class="card-title">Double Room 504</h5>
                            <p class="fw-bold text-warning">2.500.000 VNĐ/Ngày</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-5 p-4 border-glow rounded bg-dark text-warning">
            <h2 class="text-center">Thông tin đặt phòng</h2>
            <form action="BookRoomServlet" method="GET">
                <div class="mb-3">
                    <label for="roomId" class="form-label">Chọn phòng</label>
                    <select class="form-control" id="roomId" name="roomId" onchange="updateRoomDetails()">
                        <option value="401">401</option>
                        <option value="402">402</option>
                        <option value="403">403</option>
                        <option value="404">404</option>
                        <option value="501">501</option>
                        <option value="502">502</option>
                        <option value="503">503</option>
                        <option value="504">504</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="checkIn" class="form-label">Ngày nhận phòng</label>
                    <input type="date" class="form-control" id="checkIn" name="checkIn" required>
                </div>
                <div class="mb-3">
                    <label for="checkOut" class="form-label">Ngày trả phòng</label>
                    <input type="date" class="form-control" id="checkOut" name="checkOut" required>
                    <div id="error-message" style="color: red; display: none;">Ngày trả phòng phải lớn hơn ngày nhận phòng!</div>
                </div>
                <span style="color: red"><%= error%></span>
                <button type="submit" class="btn btn-warning w-100">Xác nhận thông tin đặt</button>
            </form>
        </div>
    </div>
    <!-- Modal Thông Báo Thành Công -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-dark text-warning">
                <div class="modal-header border-warning">
                    <h5 class="modal-title" id="successModalLabel">Đặt phòng thành công!</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Cảm ơn bạn đã đặt phòng tại Amazing Hotel. Chúng tôi sẽ liên hệ bạn sớm!
                </div>
                <div class="modal-footer border-warning">
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">OK</button>
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

    <script>
        document.getElementById("checkIn").addEventListener("change", validateDates);
        document.getElementById("checkOut").addEventListener("change", validateDates);

        function validateDates() {
            let checkInDate = document.getElementById("checkIn").value;
            let checkOutDate = document.getElementById("checkOut").value;
            let errorMessage = document.getElementById("error-message");

            if (checkInDate && checkOutDate) {
                let inDate = new Date(checkInDate);
                let outDate = new Date(checkOutDate);

                if (outDate <= inDate) {
                    errorMessage.style.display = "block";
                    document.getElementById("checkOut").value = ""; // Reset giá trị sai
                } else {
                    errorMessage.style.display = "none";
                }
            }
        }

        document.querySelector("form").addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn chặn gửi form ngay lập tức

            var successModal = new bootstrap.Modal(document.getElementById('successModal'));
            successModal.show();

            // Sau khi modal đóng, gửi form đi
            document.getElementById('successModal').addEventListener('hidden.bs.modal', function () {
                event.target.submit(); // Gửi form sau khi đóng modal
            }, {once: true}); // Chỉ thực hiện một lần
        });
    </script>

</body>
</html>
