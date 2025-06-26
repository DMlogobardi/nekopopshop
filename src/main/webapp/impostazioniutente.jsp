<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Impostazioni Utente</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/impostazioniutente.css">
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
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekopeach z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-cog text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-cog text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Impostazioni Utente</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Gestisci il tuo account</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
                <a href="wishlist.jsp" class="folder-tab "><i class="fas fa-heart mr-2"></i> Wishlist</a>
                <a href="ordiniutente.jsp" class="folder-tab"><i class="fas fa-box-open mr-2"></i> Ordini</a>
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
                            <h2 class="text-xl font-bold text-white" style="font-size: 30px">Marika Rossi</h2>
                            <p class="text-pink-200 text-sm">Membro dal: 15/03/2021</p>
                        </div>
                    </div>
                </div>

                <!-- Settings Navigation -->
                <div class="p-4">
                    <div class="space-y-1">
                        <button data-tab="profile" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800 active">
                            <i class="fas fa-user-circle mr-3 text-nekopeach"></i>
                            <span>Profilo</span>
                        </button>

                        <button onclick="window.location.href='sicurezza.jsp'" data-tab="security" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-lock mr-3 text-gray-600"></i>
                            <span>Sicurezza</span>
                        </button>

                        <button onclick="window.location.href='pagamenti.jsp'" data-tab="payments" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-credit-card mr-3 text-gray-600"></i>
                            <span>Pagamenti</span>
                            <span class="ml-auto bg-nekopink text-nekopeach rounded-full px-2 py-1 text-xs font-bold">2</span>
                        </button>

                        <button onclick="window.location.href='indirizzi.jsp'" data-tab="addresses" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-map-marker-alt mr-3 text-gray-600"></i>
                            <span>Indirizzi</span>
                            <span class="ml-auto bg-nekopink text-nekopeach rounded-full px-2 py-1 text-xs font-bold">3</span>
                        </button>


                    </div>
                </div>

                <!-- Account Status -->
                <div class="border-t border-gray-200 p-4">
                    <h3 class="font-bold text-gray-800 mb-3 flex items-center">
                        <i class="fas fa-shield-alt mr-2 text-gray-600"></i> Stato Account
                    </h3>
                    <div class="bg-green-50 border border-green-200 text-green-700 px-4 py-3 rounded-lg text-sm">
                        <div class="flex items-center">
                            <i class="fas fa-check-circle mr-2"></i>
                            <span>Verificato</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Security Tips -->
            <div class="profile-card bg-white border-2 border-nekored mt-6">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h3 class="text-xl font-bold text-white flex items-center" style="font-size: 25px">
                        <i class="fas fa-lightbulb mr-3"></i> Consigli di Sicurezza
                    </h3>
                </div>

                <div class="p-4">
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-check-circle text-green-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Usa una password unica e complessa</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-check-circle text-green-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Abilita l'autenticazione a due fattori</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-exclamation-circle text-yellow-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Aggiorna regolarmente i tuoi metodi di pagamento</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-exclamation-circle text-yellow-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Controlla i dispositivi connessi al tuo account</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Settings Content -->
        <div class="lg:col-span-3">
            <!-- Profile Tab Content -->
            <div id="profile-tab" class="tab-content active">
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
                    <!-- Profile Header -->
                    <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                        <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                            <i class="fas fa-user-circle mr-3"></i> Informazioni Profilo
                        </h2>
                    </div>

                    <!-- Profile Form -->
                    <div class="p-6">
                        <form>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                <div class="relative">
                                    <input type="text" id="firstName" class="form-input w-full px-4 py-3 rounded-lg" value="Marika">
                                    <label for="firstName" class="form-label absolute left-4 -top-2 bg-white px-1 text-gray-500 text-sm">Nome</label>
                                </div>

                                <div class="relative">
                                    <input type="text" id="lastName" class="form-input w-full px-4 py-3 rounded-lg" value="Rossi">
                                    <label for="lastName" class="form-label absolute left-4 -top-2 bg-white px-1 text-gray-500 text-sm">Cognome</label>
                                </div>

                                <div class="relative md:col-span-2">
                                    <input type="email" id="email" class="form-input w-full px-4 py-3 rounded-lg" value="marika.rossi@example.com">
                                    <label for="email" class="form-label absolute left-4 -top-2 bg-white px-1 text-gray-500 text-sm">Email</label>
                                    <div class="absolute right-4 top-4">
                                        <span class="verification-badge text-xs px-2 py-1 rounded-full">Verificata</span>
                                    </div>
                                </div>
                            </div>
                        </form>
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
