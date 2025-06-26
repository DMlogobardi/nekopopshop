<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Impostazioni Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/impostazioniadmin.css">
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
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekored z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-shield-alt text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-shield text-2xl text-nekored"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Impostazioni Admin</span></h1>
                <p class="text-xl text-nekored font-bold" style="font-size: 20px; background: linear-gradient(90deg, #f24535, #E55458); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Gestisci il sistema</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="admin.jsp" class="folder-tab"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a>
                <a href="gestioneprodotti.jsp" class="folder-tab"><i class="fas fa-boxes mr-2"></i> Prodotti</a>
                <a href="ordini.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Ordini</a>
                <a href="gestioneutenti.jsp" class="folder-tab"><i class="fas fa-users mr-2"></i> Utenti</a>
                <a href="impostazioniadmin.jsp" class="folder-tab active"><i class="fas fa-cog mr-2"></i> Impostazioni</a>
            </div>
        </div>
    </div>

    <!-- Settings Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Settings Navigation -->
        <div class="lg:col-span-1">
            <div class="profile-card bg-white border-2 border-nekored">
                <!-- User Profile Summary -->
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <div class="flex items-center">
                        <div class="avatar-upload">
                            <div class="avatar-preview" id="imagePreview" style="background-image: url('https://randomuser.me/api/portraits/women/44.jpg');">
                            </div>
                            <div class="avatar-edit">
                                <input type="file" id="imageUpload" accept=".png, .jpg, .jpeg">
                                <label for="imageUpload"><i class="fas fa-camera"></i></label>
                            </div>
                        </div>
                        <div class="ml-4">
                            <h2 class="text-lg font-bold text-white" style="font-size: 30px">Marika Rossi</h2>
                            <p class="text-pink-200 text-sm">Membro dal: 15/03/2021</p>
                        </div>
                    </div>
                </div>

                <!-- Settings Navigation -->
                <div class="p-4">
                    <div class="space-y-1">
                        <button data-tab="dashboard" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800 active">
                            <i class="fas fa-tachometer-alt mr-3 text-nekored"></i>
                            <span>Dashboard</span>
                        </button>

                        <button data-tab="users" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-users mr-3 text-gray-600"></i>
                            <span>Utenti</span>
                            <span class="ml-auto bg-nekopink text-nekored rounded-full px-2 py-1 text-xs font-bold">1,284</span>
                        </button>

                        <button data-tab="products" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-box-open mr-3 text-gray-600"></i>
                            <span>Prodotti</span>
                            <span class="ml-auto bg-nekopink text-nekored rounded-full px-2 py-1 text-xs font-bold">547</span>
                        </button>

                        <button data-tab="orders" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-shopping-bag mr-3 text-gray-600"></i>
                            <span>Ordini</span>
                            <span class="ml-auto bg-nekopink text-nekored rounded-full px-2 py-1 text-xs font-bold">89</span>
                        </button>

                        <button data-tab="settings" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-cog mr-3 text-gray-600"></i>
                            <span>Impostazioni</span>
                        </button>

                        <button data-tab="logs" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-clipboard-list mr-3 text-gray-600"></i>
                            <span>Logs</span>
                        </button>
                    </div>
                </div>

                <!-- Account Status -->
                <div class="border-t border-gray-200 p-4">
                    <h3 class="font-bold text-gray-800 mb-3 flex items-center">
                        <i class="fas fa-shield-alt mr-2 text-gray-600"></i> Privilegi Admin
                    </h3>
                    <div class="bg-nekored/10 border border-nekored/30 text-nekored px-4 py-3 rounded-lg text-sm">
                        <div class="flex items-center">
                            <i class="fas fa-crown mr-2"></i>
                            <span>Super Admin - Accesso Completo</span>
                        </div>
                    </div>
                    <div class="mt-3 text-xs text-gray-500">
                        <p>Ultimo accesso: 2 minuti fa</p>
                        <p>IP: 192.168.1.1</p>
                    </div>
                </div>
            </div>

            <!-- Security Tips -->
            <div class="profile-card bg-white border-2 border-nekored mt-6">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h3 class="text-lg font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-lightbulb mr-3"></i> Avvisi di Sistema
                    </h3>
                </div>

                <div class="p-4">
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-exclamation-triangle text-yellow-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">5 ordini in attesa di elaborazione</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-exclamation-circle text-red-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">3 prodotti esauriti</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-check-circle text-green-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Sistema aggiornato all'ultima versione</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-info-circle text-blue-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Backup completato oggi alle 03:00</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Settings Content -->
        <div class="lg:col-span-3">
            <!-- Dashboard Tab Content -->
            <div id="dashboard-tab" class="tab-content active">
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
                    <!-- Dashboard Header -->
                    <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                        <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                            <i class="fas fa-tachometer-alt mr-3"></i> Dashboard Admin
                        </h2>
                    </div>

                    <!-- Stats Cards -->
                    <div class="p-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <div class="stats-card bg-nekopink/20 p-4 rounded-lg border border-nekopink/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekopink/30 text-nekored mr-4">
                                    <i class="fas fa-users text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Utenti Registrati</p>
                                    <p class="text-2xl font-bold text-nekored">1,284</p>
                                </div>
                            </div>
                        </div>

                        <div class="stats-card bg-nekobeige/20 p-4 rounded-lg border border-nekobeige/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekobeige/30 text-nekoorange mr-4">
                                    <i class="fas fa-shopping-cart text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Ordini Oggi</p>
                                    <p class="text-2xl font-bold text-nekoorange">24</p>
                                </div>
                            </div>
                        </div>

                        <div class="stats-card bg-nekopink/20 p-4 rounded-lg border border-nekopink/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekopink/30 text-nekopeach mr-4">
                                    <i class="fas fa-box-open text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Prodotti</p>
                                    <p class="text-2xl font-bold text-nekopeach">547</p>
                                </div>
                            </div>
                        </div>

                        <div class="stats-card bg-nekobeige/20 p-4 rounded-lg border border-nekobeige/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekobeige/30 text-nekoorange mr-4">
                                    <i class="fas fa-chart-line text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Fatturato</p>
                                    <p class="text-2xl font-bold text-nekoorange">&#8364 8,742</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Activity -->
                    <div class="p-6 border-t border-gray-200">
                        <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
                            <i class="fas fa-history mr-2 text-nekored"></i> Attivit&agrave Recente
                        </h3>
                        <div class="space-y-4">
                            <div class="flex items-start">
                                <div class="flex-shrink-0 mt-1">
                                    <i class="fas fa-user-plus text-green-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-gray-700">Nuovo utente registrato: Mario Bianchi</p>
                                    <p class="text-xs text-gray-500">2 minuti fa</p>
                                </div>
                            </div>

                            <div class="flex items-start">
                                <div class="flex-shrink-0 mt-1">
                                    <i class="fas fa-shopping-bag text-blue-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-gray-700">Nuovo ordine #ORD-45678 completato</p>
                                    <p class="text-xs text-gray-500">15 minuti fa</p>
                                </div>
                            </div>

                            <div class="flex items-start">
                                <div class="flex-shrink-0 mt-1">
                                    <i class="fas fa-exclamation-triangle text-yellow-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-gray-700">Prodotto esaurito: Chainsaw Man Vol.5</p>
                                    <p class="text-xs text-gray-500">1 ora fa</p>
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
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
