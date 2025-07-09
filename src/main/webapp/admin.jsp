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
        if (token == null && !"A".equals(token)) {
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
    <title>NekoPopShop - Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="frontend/Scripts/dashboard_dinamic.js" defer></script>
    <script src="frontend/Scripts/admin_Dainamic.js" defer></script>
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
                        nekopurple: '#9c6ade',
                        kawaiblue: '#6a8cde',
                        kawaililac: '#d8b4fe',
                        adminblue: '#3a86ff',
                        adminindigo: '#5e60ce'
                    }
                }
            }
        }
    </script>
    <style>
        .loader {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #e55458;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>

</head>
<body class="relative overflow-x-hidden bg-gray-50">
<div id="decorations"></div>

<div class="container mx-auto px-4 py-6">

</div>

<div class="container mx-auto px-4 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-kawaililac z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-shield-alt text-white text-2xl"></i>
                </div>
                <div class="w-16 h-16 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-shield text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold" style="font-size: 45px"><span class="text-admin-gradient">Admin Shop Management</span></h1>
            </div>
        </div>

        <!-- Navigation -->
        <jsp:include page="navBar.jsp" />

    </div>
    <jsp:include page="error.jsp" />
    <!-- Admin Dashboard Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Sidebar -->
        <div class="lg:col-span-1">
            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-4 sticky top-6">
                <div class="flex items-center mb-6 pb-6 border-b border-gray-200">
                    <div class="ml-4">
                        <h3 id="nick" class="font-bold text-gray-800">Admin Master</h3>
                        <p class="text-xs text-gray-500">Super Admin </p>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="space-y-1 mb-6">
                    <a href="#"
                       class="sidebar-item active flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach"
                       onclick="handleSidebarClick(this, 'dashboard')">
                        <i class="fas fa-tachometer-alt sidebar-icon mr-3 text-gray-500"></i>
                        <span class="truncate text-sm sm:text-base">Dashboard</span>
                    </a>

                    <a href="#"
                       class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach"
                       onclick="handleSidebarClick(this, 'products')">
                        <i class="fas fa-box sidebar-icon mr-3 text-gray-500"></i>
                        <span class="truncate text-sm sm:text-base">Prodotti</span>
                    </a>

                    <a href="#"
                       class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach"
                       onclick="handleSidebarClick(this, 'users')">
                        <i class="fas fa-users sidebar-icon mr-3 text-gray-500"></i>
                        <span class="truncate text-sm sm:text-base">Utenti</span>
                    </a>

                    <a href="#"
                       class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach"
                       onclick="handleSidebarClick(this, 'orders')">
                        <i class="fas fa-shopping-cart sidebar-icon mr-3 text-gray-500"></i>
                        <span class="truncate text-sm sm:text-base">Ordini</span>
                    </a>
                </nav>
            </div>
        </div>

        <!-- Main Content -->
        <div class="lg:col-span-3 space-y-6">
            <!-- Contenitore dinamico -->
            <div id="dynamic-content" class="mx-auto w-full max-w-4xl">

            </div>
        </div>
    </div>
</div>
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