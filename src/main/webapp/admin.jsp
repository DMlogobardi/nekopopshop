<!DOCTYPE html>
<html lang="it">
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
                <h1 class="text-3xl font-bold" style="font-size: 45px"><span class="text-admin-gradient">Admin Dashboard</span></h1>
                <p class="text-xl text-nekopeach font-semibold">NekoPop Shop Management</p>
            </div>
        </div>

        <!-- Navigation -->
        <jsp:include page="navBar.jsp" />

    </div>

    <!-- Admin Dashboard Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Sidebar -->
        <div class="lg:col-span-1">
            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-4 sticky top-6">
                <!-- User Profile -->
                <div class="flex items-center mb-6 pb-6 border-b border-gray-200">
                    <div class="w-14 h-14 rounded-full bg-gradient-to-br from-adminblue to-adminindigo flex items-center justify-center text-white text-2xl font-bold">
                        AM
                    </div>
                    <div class="ml-4">
                        <h3 class="font-bold text-gray-800">Admin Master</h3>
                        <p class="text-xs text-gray-500">Super Admin <span class="text-xs bg-green-100 text-green-800 px-2 py-0.5 rounded ml-1">Online</span></p>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="space-y-1 mb-6">
                    <a href="#" class="sidebar-item active flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach" onclick="loadContent('dashboard')">
                        <i class="fas fa-tachometer-alt sidebar-icon mr-3 text-gray-500"></i>
                        <span>Dashboard</span>
                    </a>
                    <a href="#" onclick="loadContent('products')" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach">
                        <i class="fas fa-box sidebar-icon mr-3 text-gray-500"></i>
                        <span>Prodotti</span>
                        <span class="notification-badge ml-auto">5</span>
                    </a>
                    <a href="#" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach" onclick="loadContent('users')">
                        <i class="fas fa-users sidebar-icon mr-3 text-gray-500"></i>
                        <span>Utenti</span>
                        <span class="text-xs bg-gray-100 text-gray-800 px-2 py-0.5 rounded ml-auto">32</span>
                    </a>
                    <a href="#" onclick="loadContent('orders')" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach" onclick="loadContent('orders')">
                        <i class="fas fa-shopping-cart sidebar-icon mr-3 text-gray-500"></i>
                        <span>Ordini</span>
                        <span class="notification-badge ml-auto">12</span>
                    </a>
                    <a href="#" onclick="loadContent('settings')" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach" onclick="loadContent('settings')">
                        <i class="fas fa-cog sidebar-icon mr-3 text-gray-500"></i>
                        <span>Impostazioni</span>
                    </a>
                </nav>



                <!-- Quick Actions -->
                <div class="mt-4 pt-4 border-t border-gray-200">
                    <h4 class="font-bold mb-3 text-gray-700 flex items-center">
                        <i class="fas fa-bolt mr-2 text-gray-500"></i> Azioni Rapide
                    </h4>
                    <div class="grid grid-cols-2 gap-3">
                        <button class="btn-outline flex items-center justify-center text-xs py-2 px-3">
                            <i class="fas fa-plus mr-1"></i> Prodotto
                        </button>
                        <button class="btn-outline flex items-center justify-center text-xs py-2 px-3">
                            <i class="fas fa-tag mr-1"></i> Sconto
                        </button>
                        <button class="btn-outline flex items-center justify-center text-xs py-2 px-3">
                            <i class="fas fa-file-export mr-1"></i> Report
                        </button>
                        <button class="btn-outline flex items-center justify-center text-xs py-2 px-3">
                            <i class="fas fa-bell mr-1"></i> Notifiche
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="lg:col-span-3 space-y-6">
            <!-- Contenitore dinamico -->
            <div id="dynamic-content">
                <!-- Welcome Banner -->
                <div class="admin-card p-6 bg-white rounded-xl">
                    <div class="flex flex-col md:flex-row items-start md:items-center justify-between">
                        <div>
                            <h2 class="text-xl font-bold text-gray-800 mb-2">Benvenuto, <span class="text-admin-gradient">Admin Master</span> 👋</h2>
                            <p class="text-gray-600">Ecco una panoramica dello stato del tuo negozio. Hai <span class="font-bold text-nekopeach">12 nuovi ordini</span> </p>
                        </div>
                    </div>
                </div>

                <!-- Alert -->
                <div class="alert alert-warning">
                    <i class="fas fa-exclamation-circle alert-icon"></i>
                    <div>
                        <div class="font-bold">Avviso di Manutenzione</div>
                        <div class="text-sm">Il sistema sar&agrave in manutenzione domani dalle 2:00 alle 4:00 AM. Si prega di pianificare di conseguenza.</div>
                    </div>
                </div>

                <!-- Quick Stats -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    <!-- Order Stats -->
                    <div class="stat-card p-5">
                        <div class="flex items-start justify-between">
                            <div>
                                <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Ordini Oggi</p>
                                <h3 class="text-xs font-bold text-gray-800 mt-1">24</h3>
                                <div class="mt-3">
                                    <span class="text-green-500 text-xs font-bold flex items-center">
                                        <i class="fas fa-arrow-up mr-1"></i> 12% vs ieri
                                    </span>
                                </div>
                            </div>
                            <div class="w-10 h-10 rounded-full bg-nekopink/20 flex items-center justify-center">
                                <i class="fas fa-shopping-cart text-nekopeach text-2xl"></i>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="progress">
                                <div class="progress-bar bg-gradient-to-r from-nekopink to-nekopeach" style="width: 65%;"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Revenue Stats -->
                    <div class="stat-card p-5">
                        <div class="flex items-start justify-between">
                            <div>
                                <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Guadagni Oggi</p>
                                <h3 class="text-xs font-bold text-gray-800 mt-1">&#8364 1,245</h3>
                                <div class="mt-3">
                                      <span class="text-green-500 text-xs font-bold flex items-center">
                                        <i class="fas fa-arrow-up mr-1"></i> 8% vs ieri
                                      </span>
                                </div>
                            </div>
                            <div class="w-10 h-10 rounded-full bg-green-100/20 flex items-center justify-center">
                                <i class="fas fa-euro-sign text-green-500 text-2xl"></i>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="progress">
                                <div class="progress-bar bg-gradient-to-r from-green-400 to-green-600" style="width: 75%;"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Customer Stats -->
                    <div class="stat-card p-5">
                        <div class="flex items-start justify-between">
                            <div>
                                <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Nuovi Clienti</p>
                                <h3 class="text- font-bold text-gray-800 mt-1">18</h3>
                                <div class="mt-3">
                                      <span class="text-green-500 text-xs font-bold flex items-center">
                                        <i class="fas fa-arrow-up mr-1"></i> 5 vs ieri
                                      </span>
                                </div>
                            </div>
                            <div class="w-10 h-10 rounded-full bg-blue-100/20 flex items-center justify-center">
                                <i class="fas fa-user-plus text-blue-500 text-2xl"></i>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="progress">
                                <div class="progress-bar bg-gradient-to-r from-blue-400 to-blue-600" style="width: 55%;"></div>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Recent Orders & Top Products -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    <!-- Recent Orders -->
                    <div class="admin-card">
                        <div class="p-5 border-b border-gray-200">
                            <h3 class="text-lg font-bold text-gray-800" style="font-size: 30px">Ordini Recenti</h3>
                            <p class="text-sm text-gray-500">Ultimi 10 ordini effettuati</p>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="admin-table custom-scrollbar">
                                <thead>
                                <tr>
                                    <th class="text-white">ID</th>
                                    <th class="text-white">Cliente</th>
                                    <th class="text-white">Stato</th>
                                    <th class="text-white">Totale</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#ORD-10245</td>
                                    <td class="flex items-center">
                                        <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="User" class="avatar mr-2">
                                        <span>Marta Rossi</span>
                                    </td>
                                    <td><span class="order-status status-processing"></span> <span class="badge badge-primary">In lavorazione</span></td>
                                    <td class="font-bold">&#8364 84.99</td>
                                </tr>
                                <tr>
                                    <td>#ORD-10244</td>
                                    <td class="flex items-center">
                                        <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="User" class="avatar mr-2">
                                        <span>Luca Bianchi</span>
                                    </td>
                                    <td><span class="order-status status-shipped"></span> <span class="badge badge-success">Spedito</span></td>
                                    <td class="font-bold">&#8364 45.50</td>
                                </tr>
                                <tr>
                                    <td>#ORD-10243</td>
                                    <td class="flex items-center">
                                        <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="User" class="avatar mr-2">
                                        <span>Anna Verdi</span>
                                    </td>
                                    <td><span class="order-status status-delivered"></span> <span class="badge badge-info">Consegnato</span></td>
                                    <td class="font-bold">&#8364 112.99</td>
                                </tr>
                                <tr>
                                    <td>#ORD-10242</td>
                                    <td class="flex items-center">
                                        <img src="https://randomuser.me/api/portraits/men/22.jpg" alt="User" class="avatar mr-2">
                                        <span>Marco Neri</span>
                                    </td>
                                    <td><span class="order-status status-pending"></span> <span class="badge badge-warning">In attesa</span></td>
                                    <td class="font-bold">&#8364 67.30</td>
                                </tr>
                                <tr>
                                    <td>#ORD-10241</td>
                                    <td class="flex items-center">
                                        <img src="https://randomuser.me/api/portraits/women/56.jpg" alt="User" class="avatar mr-2">
                                        <span>Sara Gialli</span>
                                    </td>
                                    <td><span class="order-status status-cancelled"></span> <span class="badge badge-danger">Cancellato</span></td>
                                    <td class="font-bold">&#8364 99.99</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="p-4 border-t border-gray-200 text-right">
                            <a href="#" class="text-sm font-semibold text-nekopeach hover:underline">Vedi tutti gli ordini →</a>
                        </div>
                    </div>
                </div>
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

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg text-white mb-4">Iscriviti alla Newsletter</h4>
                <div class="flex mt-2">
                    <input type="email" placeholder="Tua email" class="bg-white/20 border border-pink-300 text-white rounded-l-lg px-4 py-3 w-full placeholder-pink-200 focus:outline-none">
                    <button class="bg-white text-nekopink font-bold px-4 rounded-r-lg">
                        <i class="fas fa-paper-plane"></i>
                    </button>
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