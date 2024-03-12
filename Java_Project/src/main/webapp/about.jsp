<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="about.css">
    <link rel="stylesheet" href="styleheader.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-Qe7zJwDyNUBnSEijb0W0+EzgVun6IbcsPTvXkjp65a+Y8i2RvlV3tCG0OOtBcpLPfcvHEv3+e30XAFNcKH7n0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>About Developers</title>
</head>
<body>
<%@ include file="Header.jsp" %>
<div class="about-section">
    <h1>Contact to Admin</h1>
    <p>If you have any problem in using website ,you can connect to admin with below address.</p>
    <p>If you forget your password,you can get your password by asking damin with your old email.If you see some toxic posts or chat,you can send screenshot to admin to ban.</p>
</div>

<div class="contact-section">
    <h2>Contact Us</h2>
    <div class="contact-options">
        <ul class="social-icons">
            <div class="contact-option">
                <li><a href="mailto:waim20214@gmail.com"><i class="fas fa-envelope"></i> Email</a></li>
            </div>
            <div class="contact-option">
                <li><a href="https://www.facebook.com/Wai Min Khant Lite"><i class="fab fa-facebook"></i> Facebook</a></li>
            </div>
            <div class="contact-option">
                <li><a href="https://t.me/yourtelegram"><i class="fab fa-telegram"></i> Telegram</a></li>
            </div>
            <div class="contact-option">
                <li><i class="fas fa-phone"></i><a href="https://www.x.com/waiminkhant">X</a></li>
            </div>
            <div class="contact-option">
                <li><a href="https://instagram.com/yourinstagram"><i class="fab fa-instagram"></i> Instagram</a></li>
            </div>
        </ul>
    </div>
</div>

</body>
</html>
