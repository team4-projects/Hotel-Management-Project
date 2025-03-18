<%-- 
    Document   : order
    Created on : Mar 5, 2025, 9:34:06 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ORDER - Luxury Dining</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Google Font: Leyton (Giả lập) -->
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;900&display=swap" rel="stylesheet">

        <style>
            /* Background & Font */
            body {
                background-color: #0d0d0d;
                color: gold;
                font-family: 'Playfair Display', serif; /* Thay thế gần nhất nếu Leyton không có */
                opacity: 0;
                animation: fadeIn 1s ease-in-out forwards;
            }

            @keyframes fadeIn {
                to {
                    opacity: 1;
                }
            }

            /* Container */
            .container {
                max-width: 550px;
                background: linear-gradient(135deg, #1c1c1c, #2a2a2a);
                padding: 30px;
                border-radius: 15px;
                border: 3px solid gold;
                box-shadow: 0 0 20px rgba(255, 215, 0, 0.4);
                text-align: center;
                animation: popUp 0.6s ease-in-out forwards;
            }

            @keyframes popUp {
                to {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            /* Title */
            h2 {
                font-size: 2.8rem;
                font-weight: 900;
                text-transform: uppercase;
                letter-spacing: 3px;
                margin-bottom: 20px;
                color: gold;
            }

            /* Input Fields */
            .form-control {
                background: transparent;
                border: 2px solid gold;
                color: gold;
                font-size: 1.2rem;
                padding: 10px;
            }

            .form-control:focus {
                color: white;
                background: transparent;
                border-color: #ffcc00;
                box-shadow: 0 0 10px rgba(255, 204, 0, 0.6);
            }

            /* Button */
            .btn-success {
                background: gold;
                border: none;
                color: black;
                font-size: 1.4rem;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 2px;
                padding: 12px;
                border-radius: 10px;
                transition: all 0.3s ease-in-out;
            }

            .btn-success:hover {
                background: #ffcc00;
                box-shadow: 0 0 15px rgba(255, 204, 0, 0.6);
                transform: scale(1.05);
            }
        </style>

        <script>
            const menu = {
                1: {name: "Fish Sandwich", price: 50000},
                2: {name: "Bò Nướng", price: 4000000},
                3: {name: "Kem Flan", price: 50000},
                4: {name: "Sushi", price: 3000000},
                5: {name: "Tôm Hùm", price: 2000000},
                6: {name: "Steak Wagyu", price: 1500000},
                7: {name: "Truffle Pasta", price: 900000},
                8: {name: "Hàu Tươi", price: 500000}
            };

            function updateFoodDetails() {
                const foodId = document.getElementById("foodId").value;
                if (menu[foodId]) {
                    document.getElementById("foodName").value = menu[foodId].name;
                    document.getElementById("foodPrice").value = menu[foodId].price;
                    updateTotalPrice();
                } else {
                    document.getElementById("foodName").value = "";
                    document.getElementById("foodPrice").value = "";
                    document.getElementById("totalPrice").value = "";
                }
            }

            function updateTotalPrice() {
                const foodId = document.getElementById("foodId").value;
                const quantity = parseInt(document.getElementById("quantity").value);
                if (menu[foodId]) {
                    const totalPrice = menu[foodId].price * quantity;
                    document.getElementById("totalPrice").value = totalPrice;
                }
            }
        </script>
    </head>
    <body>
        <div class="container mt-5">
            <h2>ORDER</h2>
            <form action="OrderFoodServlet" method="GET">
                <div class="mb-3">
                    <label class="form-label">ID Món Ăn</label>
                    <input type="number" id="foodId" name="foodId" class="form-control" required oninput="updateFoodDetails()">
                </div>
                <div class="mb-3">
                    <label class="form-label">Tên Món</label>
                    <input type="text" id="foodName" name="foodName" class="form-control" readonly required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Giá</label>
                    <input type="text" id="foodPrice" name="foodPrice" class="form-control" readonly required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số Lượng</label>
                    <input type="number" id="quantity" name="quantity" class="form-control" min="1" value="1" required oninput="updateTotalPrice()">
                </div>
                <div class="mb-3">
                    <label class="form-label">Tổng Giá</label>
                    <input type="text" id="totalPrice" name="totalPrice" class="form-control" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ghi chú</label>
                    <textarea name="note" class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-warning w-100">Xác Nhận ORDER</button>
            </form>
        </div>
        <!-- Modal Thông Báo Thành Công -->
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content bg-dark text-warning">
                    <div class="modal-header border-warning">
                        <h5 class="modal-title" id="successModalLabel">Đặt món ăn thành công!</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Cảm ơn bạn đã đặt món tại Amazing Hotel. Chúng tôi sẽ liên hệ bạn sớm!
                    </div>
                    <div class="modal-footer border-warning">
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
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

