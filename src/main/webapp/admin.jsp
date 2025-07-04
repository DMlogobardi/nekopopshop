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

<script>
    function caricaContenuto(pagina) {
        $("#contenuto").load(pagina);
    }
</script>
<div id="decorations"></div>

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
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="admin.jsp" class="folder-tab active"><i class="fas fa-user-shield mr-2"></i> Admin</a>
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>

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
                            <p class="text-gray-600">Ecco una panoramica dello stato del tuo negozio. Hai <span class="font-bold text-nekopeach">12 nuovi ordini</span> e <span class="font-bold text-nekopeach">5 prodotti</span> con scorte basse.</p>
                        </div>
                        <button class="btn-primary mt-4 md:mt-0 flex items-center">
                            <i class="fas fa-plus mr-2"></i> Crea Report
                        </button>
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

                <!-- Stock Stats -->
                <div class="stat-card p-5">
                    <div class="flex items-start justify-between">
                        <div>
                            <p class="text-xs foxsnt-semibold text-gray-500 uppercase tracking-wider">Scorte Basse</p>
                            <h3 class="text-xs font-bold text-gray-800 mt-1">5</h3>
                            <div class="mt-3">
                  <span class="text-red-500 text-xs font-bold flex items-center">
                    <i class="fas fa-exclamation-circle mr-1"></i> Rifornimento necessario
                  </span>
                            </div>
                        </div>
                        <div class="w-10 h-10 rounded-full bg-red-100/20 flex items-center justify-center">
                            <i class="fas fa-box-open text-red-500 text-2xl"></i>
                        </div>
                    </div>
                    <div class="mt-4">
                        <div class="progress">
                            <div class="progress-bar bg-gradient-to-r from-red-400 to-red-600" style="width: 30%;"></div>
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



            <!-- Recent Reviews & Low Stock Products -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <!-- Recent Reviews -->
                <div class="admin-card p-5">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-bold text-gray-800" style="font-size: 30px">Recensioni Recenti</h3>
                        <span class="text-xs bg-nekopink/20 text-nekopeach px-2 py-1 rounded-full">3 Nuove</span>
                    </div>
                    <div class="space-y-4">
                        <!-- Review 1 -->
                        <div class="flex">
                            <img src="https://randomuser.me/api/portraits/women/43.jpg" alt="User" class="w-10 h-10 rounded-full mr-3">
                            <div>
                                <div class="flex items-center mb-1">
                                    <h4 class="font-semibold text-sm">Giulia Fontana</h4>
                                    <span class="text-xs text-gray-500 ml-2">2 giorni fa</span>
                                </div>
                                <div class="flex items-center mb-2">
                                    <div class="flex text-yellow-400 text-xs">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                    </div>
                                    <span class="text-xs text-gray-500 ml-2">4.5/5</span>
                                </div>
                                <p class="text-sm text-gray-600">"La felpa &egrave fantastica! Ottima qualit&agrave e molto carina. Consiglio a tutti gli amanti del stile kawaii."</p>
                                <div class="mt-2 flex items-center">
                                    <span class="text-xs text-gray-500">PRODOTTO: </span>
                                    <a href="#" class="text-xs text-blue-500 hover:underline ml-1">Felpa Neko Pop</a>
                                </div>
                            </div>
                        </div>

                        <!-- Review 2 -->
                        <div class="flex">
                            <img src="https://randomuser.me/api/portraits/men/76.jpg" alt="User" class="w-10 h-10 rounded-full mr-3">
                            <div>
                                <div class="flex items-center mb-1">
                                    <h4 class="font-semibold text-sm">Marco Esposito</h4>
                                    <span class="text-xs text-gray-500 ml-2">4 giorni fa</span>
                                </div>
                                <div class="flex items-center mb-2">
                                    <div class="flex text-yellow-400 text-xs">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <span class="text-xs text-gray-500 ml-2">4/5</span>
                                </div>
                                <p class="text-sm text-gray-600">"Il prodotto &egrave arrivato velocemente. La taglia &egrave un po' piccola ma la qualit&agrave &egrave ottima."</p>
                                <div class="mt-2 flex items-center">
                                    <span class="text-xs text-gray-500">PRODOTTO: </span>
                                    <a href="#" class="text-xs text-blue-500 hover:underline ml-1">Maglia Neko Kawaii</a>
                                </div>
                            </div>
                        </div>

                        <!-- Review 3 -->
                        <div class="flex">
                            <img src="https://randomuser.me/api/portraits/women/12.jpg" alt="User" class="w-10 h-10 rounded-full mr-3">
                            <div>
                                <div class="flex items-center mb-1">
                                    <h4 class="font-semibold text-sm">Sara Romano</h4>
                                    <span class="text-xs text-gray-500 ml-2">1 settimana fa</span>
                                </div>
                                <div class="flex items-center mb-2">
                                    <div class="flex text-yellow-400 text-xs">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <span class="text-xs text-gray-500 ml-2">5/5</span>
                                </div>
                                <p class="text-sm text-gray-600">"Assolutamente perfetto! L'ho regalato a mia figlia ed &egrave impazzita per questo peluche. Spedizione rapidissima!"</p>
                                <div class="mt-2 flex items-center">
                                    <span class="text-xs text-gray-500">PRODOTTO: </span>
                                    <a href="#" class="text-xs text-blue-500 hover:underline ml-1">Peluche Neko Grande</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-t border-gray-200 text-right">
                        <a href="#" class="text-sm font-semibold text-nekopeach hover:underline">Vedi tutte le recensioni →</a>
                    </div>
                </div>

                <!-- Low Stock Products -->
                <div class="admin-card p-5">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-bold text-gray-800" style="font-size: 30px">Scorte Basse</h3>
                        <span class="text-xs bg-red-100 text-red-800 px-2 py-1 rounded-full">Urgente</span>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead>
                            <tr class="text-left text-xs text-gray-500 border-b border-gray-200">
                                <th class="pb-2">Prodotto</th>
                                <th class="pb-2">Scorte</th>
                                <th class="pb-2">Azione</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="border-b border-gray-100 hover:bg-gray-50">
                                <td class="py-3 flex items-center">
                                    <img src="https://m.media-amazon.com/images/I/71p-M3sErhL._AC_UY879_.jpg" alt="Product" class="w-10 h-10 rounded mr-3">
                                    <span class="text-sm font-medium">Portachiavi Neko Viola</span>
                                </td>
                                <td class="py-3">
                                    <span class="text-xs bg-red-100 text-red-800 px-2 py-1 rounded-full">3 rimanenti</span>
                                </td>
                                <td class="py-3">
                                    <button class="text-xs btn-outline px-2 py-1">Ordinare</button>
                                </td>
                            </tr>
                            <tr class="border-b border-gray-100 hover:bg-gray-50">
                                <td class="py-3 flex items-center">
                                    <img src="https://m.media-amazon.com/images/I/61kUCND1YML._AC_UX679_.jpg" alt="Product" class="w-10 h-10 rounded mr-3">
                                    <span class="text-sm font-medium">Tazza Neko Bianca</span>
                                </td>
                                <td class="py-3">
                                    <span class="text-xs bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full">5 rimanenti</span>
                                </td>
                                <td class="py-3">
                                    <button class="text-xs btn-outline px-2 py-1">Ordinare</button>
                                </td>
                            </tr>
                            <tr class="border-b border-gray-100 hover:bg-gray-50">
                                <td class="py-3 flex items-center">
                                    <img src="https://m.media-amazon.com/images/I/61IuVLQACFL._AC_UX679_.jpg" alt="Product" class="w-10 h-10 rounded mr-3">
                                    <span class="text-sm font-medium">Peluche Neko Grande</span>
                                </td>
                                <td class="py-3">
                                    <span class="text-xs bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full">6 rimanenti</span>
                                </td>
                                <td class="py-3">
                                    <button class="text-xs btn-outline px-2 py-1">Ordinare</button>
                                </td>
                            </tr>
                            <tr class="border-b border-gray-100 hover:bg-gray-50">
                                <td class="py-3 flex items-center">
                                    <img src="https://m.media-amazon.com/images/I/51oZQmOHJOL._AC_UX679_.jpg" alt="Product" class="w-10 h-10 rounded mr-3">
                                    <span class="text-sm font-medium">Felpa con Coda Neko M</span>
                                </td>
                                <td class="py-3">
                                    <span class="text-xs bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full">4 rimanenti</span>
                                </td>
                                <td class="py-3">
                                    <button class="text-xs btn-outline px-2 py-1">Ordinare</button>
                                </td>
                            </tr>
                            <tr class="hover:bg-gray-50">
                                <td class="py-3 flex items-center">
                                    <img src="https://m.media-amazon.com/images/I/61I7uFbRLRL._AC_UX679_.jpg" alt="Product" class="w-10 h-10 rounded mr-3">
                                    <span class="text-sm font-medium">Felpa Neko Pop L</span>
                                </td>
                                <td class="py-3">
                                    <span class="text-xs bg-red-100 text-red-800 px-2 py-1 rounded-full">2 rimanenti</span>
                                </td>
                                <td class="py-3">
                                    <button class="text-xs btn-outline px-2 py-1">Ordinare</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4 pt-4 border-t border-gray-200 text-right">
                        <a href="#" class="text-sm font-semibold text-nekopeach hover:underline">Gestisci inventario →</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Product Modal -->
<div class="modal" id="addProductModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="font-bold text-lg">Aggiungi Nuovo Prodotto</h3>
            <button class="close-btn" onclick="closeModal('addProductModal')">&times;</button>
        </div>
        <div class="modal-body">
            <div class="space-y-4">
                <div>
                    <label class="form-label">Nome Prodotto</label>
                    <input type="text" class="form-input w-full" placeholder="Es. Maglia Neko Kawaii">
                </div>
                <div>
                    <label class="form-label">Descrizione</label>
                    <textarea class="form-input w-full" rows="3" placeholder="Descrizione dettagliata del prodotto"></textarea>
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="form-label">Prezzo</label>
                        <div class="relative">
                            <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500">&#8364</span>
                            <input type="number" class="form-input w-full pl-8" placeholder="0.00">
                        </div>
                    </div>
                    <div>
                        <label class="form-label">Quantit&agrave in Stock</label>
                        <input type="number" class="form-input w-full" placeholder="0">
                    </div>
                </div>
                <div>
                    <label class="form-label">Categoria</label>
                    <select class="form-select w-full">
                        <option>Abbigliamento</option>
                        <option>Accessori</option>
                        <option>Peluche</option>
                        <option>Casa</option>
                        <option>Altro</option>
                    </select>
                </div>
                <div>
                    <label class="form-label">Immagine Prodotto</label>
                    <div class="border-2 border-dashed border-gray-300 rounded-lg p-4 text-center">
                        <div class="flex flex-col items-center justify-center">
                            <i class="fas fa-cloud-upload-alt text-3xl text-gray-400 mb-2"></i>
                            <p class="text-sm text-gray-500 mb-1">Trascina l'immagine qui o clicca per selezionare</p>
                            <p class="text-xs text-gray-400">Formati supportati: JPG, PNG (max 5MB)</p>
                            <button class="btn-secondary mt-3 text-sm">Scegli File</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-secondary" onclick="closeModal('addProductModal')">Annulla</button>
            <button class="btn-primary">Aggiungi Prodotto</button>
        </div>
    </div>

</div>




<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Funzione per caricare il contenuto via AJAX
    function loadContent(section) {
        // Mostra loader
        $('#dynamic-content').html('<div class="loader"></div>');

        // Rimuovi active da tutti gli item della sidebar
        $('.sidebar-item').removeClass('active');
        // Aggiungi active all'item cliccato
        $(event.target).closest('.sidebar-item').addClass('active');

        // Mappa delle sezioni con i loro URL
        const sections = {
            'dashboard': 'dashboard-content.jsp',
            'products': 'gestioneprodotti.jsp',
            'users': 'gestioneutenti.jsp',
            'orders': 'ordini.jsp',
            'settings': 'impostazioniadmin.jsp'
        };

        // Effettua la chiamata AJAX
        $.ajax({
            url: sections[section],
            type: 'GET',
            success: function(data) {
                $('#dynamic-content').html(data);

                // Se abbiamo caricato la dashboard, inizializza i grafici
                if(section === 'dashboard') {
                    initCharts();
                }
            },
            error: function(xhr, status, error) {
                $('#dynamic-content').html(`
                    <div class="admin-card p-6 bg-white rounded-xl text-center text-red-500">
                        <i class="fas fa-exclamation-triangle text-3xl mb-3"></i>
                        <p>Errore nel caricamento del contenuto</p>
                        <button onclick="loadContent('dashboard')" class="btn-primary mt-3">
                            Torna alla Dashboard
                        </button>
                    </div>
                `);
            }
        });
    }

    // Inizializzazione della pagina
    $(document).ready(function() {
        createFloatingElements();
        initCharts();

        // Gestione click sui link della sidebar
        $('.sidebar-item').click(function(e) {
            e.preventDefault();
            // La funzione loadContent viene chiamata dall'onclick
        });

    // Create floating elements
    function createFloatingElements() {
        const decorations = document.getElementById('decorations');
        const types = ['cherry-blossom', 'cherry-blossom'];
        const colors = ['#ff7eb8', '#ff65a3', '#ff4d8e'];

        for (let i = 0; i < 8; i++) {
            const element = document.createElement('div');
            const type = types[Math.floor(Math.random() * types.length)];
            const color = colors[Math.floor(Math.random() * colors.length)];

            element.className = type;
            element.style.left = Math.random() * 100 + 'vw';
            element.style.animationDuration = (10 + Math.random() * 20) + 's';
            element.style.animationDelay = Math.random() * 5 + 's';
            element.style.opacity = Math.random() * 0.5 + 0.2;
            element.style.transform = 'scale(' + (Math.random() * 0.5 + 0.5) + ')';

            decorations.appendChild(element);
        }
    }

    // Initialize charts
    function initCharts() {
        // Sales Chart
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                datasets: [{
                    label: 'Vendite',
                    data: [12, 19, 15, 24, 22, 18, 26],
                    backgroundColor: 'rgba(229, 84, 88, 0.05)',
                    borderColor: '#E55458',
                    borderWidth: 2,
                    tension: 0.4,
                    fill: true,
                    pointBackgroundColor: '#fff',
                    pointBorderColor: '#E55458',
                    pointBorderWidth: 2,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            drawBorder: false
                        },
                        ticks: {
                            stepSize: 5
                        }
                    },
                    x: {
                        grid: {
                            display: false,
                            drawBorder: false
                        }
                    }
                }
            }
        });

        // Revenue Chart
        const revenueCtx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(revenueCtx, {
            type: 'bar',
            data: {
                labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                datasets: [{
                    label: 'Guadagni',
                    data: [215, 325, 280, 465, 420, 310, 520],
                    backgroundColor: [
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)'
                    ],
                    borderColor: [
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)'
                    ],
                    borderWidth: 1,
                    borderRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            drawBorder: false
                        }
                    },
                    x: {
                        grid: {
                            display: false,
                            drawBorder: false
                        }
                    }
                }
            }
        });
    }

    // Modal functions
    function openModal(modalId) {
        document.getElementById(modalId).classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).classList.remove('active');
        document.body.style.overflow = 'auto';
    }

    // Initialize everything when DOM is loaded
    document.addEventListener('DOMContentLoaded', function() {
        createFloatingElements();
        initCharts();

        // Close modal when clicking outside
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => {
            modal.addEventListener('click', function(e) {
                if (e.target === modal) {
                    modal.classList.remove('active');
                    document.body.style.overflow = 'auto';
                }
            });
        });

        // Demo notification for skeleton loader
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.display = 'flex';
            });
        }, 1000);
    });
</script>
        <script>
            // Mappa i pulsanti ai contenuti
            const contentMap = {
                'products': 'gestioneprodotti.jsp',
                'users': 'gestioneutenti.jsp',
                'dashboard': 'dashboard.jsp',
                'orders' : 'ordini.jsp',
                'settings' : 'impostazioniadmin.jsp'
            };

            function loadContent(section) {
                const loader = `<div class="loader mt-8"> </div>`;
                $('#dynamic-content').html(loader).load(contentMap[section], function(response, status) {
                    if (status === "error") {
                        $('#dynamic-content').html(`<div class="alert alert-error">Errore nel caricamento</div>`);
                    }
                });
            }

            // Inizializzazione
            $(document).ready(function() {
                // Attiva il primo tab
                loadContent('dashboard');

                // Gestione click menu
                $('.sidebar-item').click(function(e) {
                    e.preventDefault();
                    const section = $(this).data('section');
                    loadContent(section);
                });
            });
        </script>
</div>
</body>
</html>