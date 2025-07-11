<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Profilo Utente</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/utente.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src ="frontend/Scripts/OrdiniUtente.js"></script>
    <script src ="frontend/Scripts/WishlistUtente.js"></script>
    <script src ="frontend/Scripts/ImpostazioniUtente.js"></script>
    <script src ="frontend/Scripts/Sicurezza.js"></script>
    <script src ="frontend/Scripts/Pagamenti.js"></script>
    <script src ="frontend/Scripts/Indirizzi.js"></script>
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
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="admin.jsp" class="folder-tab"><i class="fas fa-user-shield mr-2"></i> Admin</a>
                <a href="utente.jsp" class="folder-tab active"><i class="fas fa-user mr-2"></i> Utente</a>

            </div>
        </div>
    </div>

    <!-- Profile Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Profile Info -->
        <div class="lg:col-span-1">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <!-- Avatar Section -->
                <div class="p-6 text-center">
                    <div class="avatar-upload">
                        <div class="avatar-preview">
                            <div id="imagePreview" style="background-image: url('https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400');">
                            </div>
                        </div>
                        <div class="avatar-edit">
                            <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                            <label for="imageUpload"><i class="fas fa-camera"></i></label>
                        </div>
                    </div>

                    <h3 class="text-2xl font-bold mt-4 text-gray-800">NekoFan123</h3>
                    <p class="text-gray-600">Membro dal: 15/03/2022</p>

                    <div class="mt-4 flex justify-center space-x-2">
                        <span class="badge bg-nekopink text-nekopeach">Premium</span>
                        <span class="badge bg-nekopink text-nekopeach">Verified</span>
                    </div>
                </div>

                <!-- Stats -->
                <div class="px-6 pb-6">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-gray-600">Livello</span>
                        <span class="font-bold text-nekopeach">12</span>
                    </div>
                    <div class="progress-bar mb-4">
                        <div class="progress-fill" style="width: 65%"></div>
                    </div>

                    <div class="grid grid-cols-3 gap-2 text-center">
                        <div class="stats-card bg-nekopink/20 p-3 rounded-lg">
                            <div class="text-nekopeach font-bold text-xl">24</div>
                            <div class="text-xs text-gray-600">Ordini</div>
                        </div>
                        <div class="stats-card bg-nekored/20 p-3 rounded-lg">
                            <div class="text-nekopeach font-bold text-xl">128</div>
                            <div class="text-xs text-gray-600">Punti</div>
                        </div>
                        <div class="stats-card bg-nekoorange/20 p-3 rounded-lg">
                            <div class="text-nekored font-bold text-xl">8</div>
                            <div class="text-xs text-gray-600">Liste</div>
                        </div>
                    </div>
                </div>

                <!-- Navigation -->
                <div class="border-t border-gray-200">
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-nekopeach font-bold border-b border-gray-200" data-tab="dashboard">
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

                    <button id="security-tab-btn" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="security">
                        <i class="fas fa-lock mr-3"></i> Sicurezza
                    </button>

                    <button id="payments-tab-btn" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="payments">
                        <i class="fas fa-credit-card mr-3"></i> Pagamenti
                    </button>

                    <button id="addresses-tab-btn" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="addresses">
                        <i class="fas fa-map-marker-alt mr-3"></i> Indirizzi
                    </button>


                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition"
                            data-tab="logout"
                            type="button"> <!-- Aggiunto type="button" -->
                        <i class="fas fa-sign-out-alt mr-3"></i> Esci
                    </button>


                </div>
            </div>

            <!-- Rewards Card -->
            <div class="profile-card bg-white border-2 border-nekoorange mt-6">
                <div class="bg-gradient-to-r from-nekoorange to-nekopink p-4">
                    <h3 class="text-lg font-bold text-white flex items-center" style="font-size: 30px">
                        <i class= "fas fa-trophy mr-2" style="font-size: 30px" ></i> I tuoi premi
                    </h3>
                </div>
                <div class="p-4">
                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 rounded-full bg-nekopink flex items-center justify-center mr-3">
                            <i class= "fas fa-medal text-nekopeach text-2xl"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-800">Collezionista</h4>
                            <p class="text-xs text-gray-600">Hai completato 10 ordini</p>
                        </div>
                    </div>
                    <div class="flex items-center">
                        <div class="w-12 h-12 rounded-full bg-nekopink flex items-center justify-center mr-3">
                            <i class="fas fa-star text-nekopeach text-2xl"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-800">Fan accanito</h4>
                            <p class="text-xs text-gray-600">50 articoli nella wishlist</p>
                        </div>
                    </div>
                    <div class="mt-4 text-center">
                        <button onclick="window.location.href='premi.jsp'" class="bg-nekoorange hover:bg-nekopeach text-white px-4 py-2 rounded-lg text-sm font-bold transition">
                            Scopri altri premi
                        </button>
                    </div>
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
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <div class="bg-nekopink/10 p-6 rounded-xl">
                                <h3 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                                    <i class="fas fa-shopping-bag mr-2"></i> Ultimi ordini
                                </h3>
                                <div class="space-y-4">
                                    <div class="order-card bg-white p-4 rounded-lg relative">
                                        <div class="flex justify-between items-start">
                                            <div>
                                                <h4 class="font-bold text-gray-800">Ordine #NEKO-2023-045</h4>
                                                <p class="text-sm text-gray-600">15 Ottobre 2023</p>
                                            </div>
                                            <span class="badge bg-green-100 text-green-800">Spedito</span>
                                        </div>
                                        <div class="mt-2 flex items-center">
                                            <div class="w-10 h-10 rounded-full overflow-hidden mr-2">
                                                <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=100" alt="Chainsaw Man" class="w-full h-full object-cover">
                                            </div>
                                            <div class="w-10 h-10 rounded-full overflow-hidden mr-2">
                                                <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" alt="Jujutsu Kaisen" class="w-full h-full object-cover">
                                            </div>
                                            <div class="text-sm text-gray-500">+2 altri</div>
                                        </div>
                                        <div class="mt-3 flex justify-between items-center">
                                            <span class="font-bold text-nekopeach">&#8364 42,97</span>
                                            <a href="#" class="text-sm text-kawaiblue hover:underline">Dettagli</a>
                                        </div>
                                    </div>

                                    <div class="order-card bg-white p-4 rounded-lg relative">
                                        <div class="flex justify-between items-start">
                                            <div>
                                                <h4 class="font-bold text-gray-800">Ordine #NEKO-2023-044</h4>
                                                <p class="text-sm text-gray-600">2 Ottobre 2023</p>
                                            </div>
                                            <span class="badge bg-blue-100 text-blue-800">In elaborazione</span>
                                        </div>
                                        <div class="mt-2">
                                            <div class="w-10 h-10 rounded-full overflow-hidden">
                                                <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" alt="Action Figure" class="w-full h-full object-cover">
                                            </div>
                                        </div>
                                        <div class="mt-3 flex justify-between items-center">
                                            <span class="font-bold text-nekopeach">&#8364 39,99</span>
                                            <a href="#" class="text-sm text-kawaiblue hover:underline">Dettagli</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 text-center">
                                    <a href="ordiniutente.jsp" class="text-sm text-nekopeach font-bold hover:underline">Vedi tutti gli ordini</a>
                                </div>
                            </div>

                            <div class="bg-nekored/10 p-6 rounded-xl">
                                <h3 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                                    <i class="fas fa-heart mr-2"></i> Lista desideri
                                </h3>
                                <div class="space-y-4">
                                    <div class="wishlist-item bg-white p-3 rounded-lg flex items-center">
                                        <div class="w-16 h-16 rounded-lg overflow-hidden flex-shrink-0">
                                            <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200" alt="Jujutsu Kaisen" class="w-full h-full object-cover">
                                        </div>
                                        <div class="ml-3 flex-1">
                                            <h4 class="font-bold text-sm text-gray-800">Jujutsu Kaisen Vol.15</h4>
                                            <p class="text-xs text-gray-600">Disponibile dal 15/11</p>
                                        </div>
                                        <div class="text-right">
                                            <span class="block font-bold text-nekopeach">&#8364 14,99</span>
                                            <button class="text-xs text-kawaiblue hover:underline">Aggiungi al carrello</button>
                                        </div>
                                    </div>

                                    <div class="wishlist-item bg-white p-3 rounded-lg flex items-center">
                                        <div class="w-16 h-16 rounded-lg overflow-hidden flex-shrink-0">
                                            <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200" alt="Demon Slayer" class="w-full h-full object-cover">
                                        </div>
                                        <div class="ml-3 flex-1">
                                            <h4 class= "font-bold text-sm text-gray-600"></h4>
                                        </div>

                                        </div>
                                </div>

                            </div>
                        </div>
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