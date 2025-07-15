<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="jakarta.servlet.http.HttpSession, jakarta.servlet.http.Cookie"%>
<%@ page import="java.util.logging.Logger" %>
<!DOCTYPE html>
<html lang="it">
<%
    // Crea il logger
    Logger logger = Logger.getLogger("MyLogger");

    HttpSession s = request.getSession(false);
    boolean isLoggedIn = false;

    if (s != null) {
        Object token = s.getAttribute("logToken");
        if (!"C".equals(token)) {
            isLoggedIn = true;
        }
    }

    if (isLoggedIn) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("access".equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setMaxAge(1);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Profilo Utente</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/utente.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src ="frontend/Scripts/OrdiniUtente2.js"></script>
    <script src ="frontend/Scripts/WishlistUtentev2.js"></script>
    <script src ="frontend/Scripts/ImpostazioniUtente.js"></script>
    <script src ="frontend/Scripts/Logout.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        nekopink: '#fbd8da',
                        nekopeach: '#e55458',
                        nekobeige: '#f2d5bb',
                        nekoorange: '#f29966',
                        nekored: '#f24535',

                    }
                }
            }
        }
    </script>
</head>
<body class="relative overflow-x-hidden">
<!-- Decorative elements -->
<div id="decorations"></div>

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekopeach z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-user text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-astronaut text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Il Tuo Profilo</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Benvenuto nella tua area personale</p>
            </div>
        </div>

        <!-- Navigation -->
        <jsp:include page="navBar.jsp" />
    </div>
    <jsp:include page="error.jsp" />
    <!-- Profile Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Profile Info -->
        <div class="lg:col-span-1">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <!-- Avatar Section -->
                <div class="p-6 text-center">
                    <div class="avatar-upload">
                        <div class="avatar-preview">
                            <div id="imagePreview">
                                <img src="frontend/images/hachiprofilo.jpeg" alt="Avatar Preview" class="w-full h-full object-cover rounded-full">

                            </div>
                        </div>

                    </div>

                    <h3 class="text-2xl font-bold mt-4 text-gray-800">NekoFan123</h3>

                </div>



                <!-- Navigation -->
                <div class="border-t border-gray-200">
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-nekopeach font-bold border-b border-gray-200" data-tab="dashboard"
                    id="dashboard-tab-btn">
                        <i class="fas fa-tachometer-alt mr-3"></i> Dashboard
                    </button>
                    <button id="orders-tab-btn" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="orders">
                        <i class="fas fa-shopping-bag mr-3"></i> I miei ordini
                    </button>
                    <button id="wishlist-tab-btn" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="wishlist">
                        <i class="fas fa-heart mr-3"></i> Lista desideri
                    </button>

                    <button id="settings-tab-btn" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="settings">
                        <i class="fas fa-cog mr-3"></i> Impostazioni
                    </button>



                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition"
                            data-tab="logout"
                            type="button"> <!-- Aggiunto type="button" -->
                        <i class="fas fa-sign-out-alt mr-3"></i> Esci
                    </button>


                </div>
            </div>


        </div>

        <!-- Main Content -->
        <div class="lg:col-span-3">
            <!-- Dashboard Tab -->
            <div class="tab-content active" id="dashboard-tab">
                <div class="profile-card bg-white border-2 border-nekored">
                    <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                        <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                            <i class="fas fa-tachometer-alt mr-3"></i> La tua dashboard
                        </h2>
                    </div>


                    <div class="p-6">
                        <h2 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                        <i class="fas fa-heart mr-2"></i> Benvenuto nella tua area utente!
                    </h2>

                        <h2 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                            <i class="fas fa-heart mr-2"></i> Preparati all'esperienza offerta da NekoPop Shop!
                        </h2>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- Footer -->
<footer class="mt-16 bg-gradient-to-b from-nekoorange to-nekopeach text-white pt-12 pb-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <!-- Footer section -->
            <div>
                <div class="flex items-center mb-4">
                    <div class="w-10 h-10 rounded-full bg-white flex items-center justify-center">
                        <i class="fas fa-paw text-nekopink text-2xl"></i>
                    </div>
                    <h4 class="font-bold text-xl ml-3 text-white">NekoPop Shop</h4>
                </div>
                <p class="text-pink-100">Il tuo negozio preferito per manga e action figure, fornito da appassionati per appassionati!</p>
            </div>

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg mb-4 text-white">Contatti</h4>
                <p class="text-pink-100 flex items-center mb-3">
                    <i class="fas fa-map-marker-alt mr-3"></i>
                    <span>Via dei Manga, 123<br>Milano, Italia</span>
                </p>
                <p class="text-pink-100 flex items-center mb-3">
                    <i class="fas fa-phone mr-3"></i> +39 02 1234567
                </p>
                <p class="text-pink-100 flex items-center">
                    <i class="fas fa-envelope mr-3"></i> info@nekopopshop.com
                </p>
            </div>

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg text-white mb-4">Link Utili</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Assistenza Clienti
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> FAQ
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Spedizioni
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Termini e Condizioni
                    </a></li>
                </ul>
            </div>

            <!-- Footer section -->
            <div>

            </div>

            <div class="mt-4">
                <h5 class="font-bold mb-3">Seguici</h5>
                <div class="flex space-x-4">
                    <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                        <i class="fab fa-discord"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="border-t border-pink-300/30 mt-8 pt-6 text-center text-pink-100">
        <p>&copy; 2023 NekoPopShop. Tutti i diritti riservati.</p>
        <div class="flex justify-center mt-4">
            <div class="flex items-center gap-4">
                <i class="fab fa-cc-visa text-2xl"></i>
                <i class="fab fa-cc-mastercard text-2xl"></i>
                <i class="fab fa-cc-paypal text-2xl"></i>
                <i class="fab fa-cc-apple-pay text-2xl"></i>
            </div>
        </div>
    </div>
    </div>
</footer>


</body>
</html>