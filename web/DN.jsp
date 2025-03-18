<%-- 
    Document   : DN
    Created on : Mar 4, 2025, 1:03:50 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    />
    <link rel="stylesheet" href="style/DN.css" />
  </head>
  <style>
.video-background {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    z-index: -1; /* Đưa video xuống dưới nội dung khác */
}

.video-background iframe {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 120vw; /* Đặt kích thước lớn hơn màn hình để lấp đầy */
    height: 120vh;
    transform: translate(-50%, -50%); /* Căn giữa video */
    pointer-events: none; /* Chặn người dùng bấm vào video */
}


  </style>
  <body>
      <%
          String error = request.getAttribute("error") + "";
          if(error.equals("null")){
            error = "";
          }
      %>
      
    <div class="container" id="container">
      <div class="form-container register-container">
          <form action="RegisterServlet" method="POST">
          <h1>HG</h1>
          <input type="text" placeholder="Name" required name ="name" />
          <input type="email" placeholder="Email" required name ="email" />
          <input type="password" placeholder="Password" required name ="password" />
          <input type="text" placeholder="Phone" required name ="phone" />

          <button>Register</button>
          <span>or use your account</span>
          <div class="social-container">
            <a href="#" class="social"><i class="fa-brands fa-facebook"></i></a>
            <a href="#" class="social"><i class="fa-brands fa-google"></i></a>
            <a href="#" class="social"><i class="fa-brands fa-linkedin"></i></a>
          </div>
        </form>
      </div>

      <div class="form-container login-container">
          <form action="LoginServlet" method="POST">
          <h1>Login here</h1>
          <input type="email" placeholder="Email" required name="email" />
          <input type="password" placeholder="Password" required name="password" />
          <span style="color: red"><%= error %></span>
          <div class="content">
            <div class="checkbox">
              <input type="checkbox" name="checkbox" id="checkbox" />
              <label>Remember me</label>
            </div>
            <div class="pass-link">
              <a href="#">Forgot password ?</a>
            </div>
          </div>
          <button>Login</button>
          <span>or use your account</span>
          <div class="social-container">
            <a href="#" class="social"><i class="fa-brands fa-facebook"></i></a>
            <a href="#" class="social"><i class="fa-brands fa-google"></i></a>
            <a href="#" class="social"><i class="fa-brands fa-linkedin"></i></a>
          </div>
        </form>
      </div>

      <div class="overlay-container">
        <div class="overlay">
       <div class="video-background">
  <iframe 
      src="https://www.youtube.com/embed/1fDn7a4TvwI?autoplay=1&mute=1&loop=1&playlist=1fDn7a4TvwI&controls=0&disablekb=1&modestbranding=1&showinfo=0&rel=0" 
      frameborder="0"
      allow="autoplay; encrypted-media"
      allowfullscreen>
  </iframe>
</div>
          <div class="overlay-panel overlay-left">
            <br class="title">
              Hello <br>
              friends
            </h1>
            <p>If you have an account,login there and have fun</p>
            <button class="ghost" id="login">
              Login <i class="fa-solid fa-arrow-left"></i>
            </button>   
          </div>
          <div class="overlay-panel overlay-right">
            <h1 class="title">
              Start your 
              <br>

              Journy now
            </h1>
            <p>
              If you don't have an account yet , join us and start your journey
            </p>
            <button class="ghost" id="register">
              Register
              <i class="fa-solid fa-arrow-right"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
    <script src="script.js"></script>
  </body>
</html>
