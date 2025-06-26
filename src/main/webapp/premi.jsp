<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - I tuoi premi</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/premi.css">
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
<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekopeach z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-trophy text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-medal text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">I tuoi premi</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Raccogli premi e ottieni riconoscimenti</p>
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
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
                <a href="premi.jsp" class="folder-tab active"><i class="fas fa-trophy mr-2"></i> Premi</a>
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
                    <p class="text-gray-600">Livello: 12</p>

                    <div class="mt-4 flex justify-center space-x-2">
                        <span class="badge bg-nekopink text-nekopeach">Premium</span>
                        <span class="badge bg-nekopink text-nekopeach">Collezionista I</span>
                    </div>
                </div>

                <!-- Stats -->
                <div class="px-6 pb-6">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-gray-600">Progresso</span>
                    </div>
                    <div class="progress-bar mb-4">
                        <div class="progress-fill" style="width: 65%"></div>
                    </div>

                    <div class="grid grid-cols-2 gap-2 text-center">
                        <div class="stats-card bg-nekopink/20 p-3 rounded-lg">
                            <div class="text-nekopeach font-bold text-xl">54</div>
                            <div class="text-xs text-gray-600">Ordini totali</div>
                        </div>
                        <div class="stats-card bg-nekored/20 p-3 rounded-lg">
                            <div class="text-nekopeach font-bold text-xl">87</div>
                            <div class="text-xs text-gray-600">Wishlist</div>
                        </div>
                    </div>
                </div>

                <!-- Navigation -->
                <div class="border-t border-gray-200">
                    <button onclick="window.location.href='utente.jsp'" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="dashboard">
                        <i class="fas fa-tachometer-alt mr-3"></i> Dashboard
                    </button>
                    <button onclick="window.location.href='ordiniutente.jsp'" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="orders">
                        <i class="fas fa-shopping-bag mr-3"></i> I miei ordini
                    </button>
                    <button onclick="window.location.href='wishlist.jsp'" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="wishlist">
                        <i class="fas fa-heart mr-3"></i> Lista desideri
                    </button>
                    <button onclick="window.location.href='impostazioniutente.jsp'" class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="settings">
                        <i class="fas fa-cog mr-3"></i> Impostazioni
                    </button>
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="logout">
                        <i class="fas fa-sign-out-alt mr-3"></i> Esci
                    </button>
                </div>
            </div>

            <!-- Current Rewards Card -->
            <div class="profile-card bg-white border-2 border-nekoorange mt-6">
                <div class="bg-gradient-to-r from-nekoorange to-nekopink p-4">
                    <h3 class="text-lg font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-award mr-2" style="font-size: 30px"></i> Premi attivi
                    </h3>
                </div>
                <div class="p-4">
                    <div class="flex items-center mb-4 p-3 bg-gradient-to-r from-nekopink/10 to-nekobeige/10 rounded-lg">
                        <div class="w-14 h-14 rounded-full bg-nekopink flex items-center justify-center mr-3 glow">
                            <i class="fas fa-medal text-white text-2xl"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-800">Collezionista I</h4>
                            <p class="text-xs text-gray-600">54/100 ordini</p>
                            <div class="w-full bg-gray-200 rounded-full h-1.5 mt-1">
                                <div class="bg-nekopeach h-1.5 rounded-full" style="width: 54%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center p-3 bg-gradient-to-r from-nekopink/10 to-nekobeige/10 rounded-lg">
                        <div class="w-14 h-14 rounded-full bg-nekopink flex items-center justify-center mr-3">
                            <i class="fas fa-star text-white text-2xl"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-800">Fan accanito</h4>
                            <p class="text-xs text-gray-600">87/150 articoli</p>
                            <div class="w-full bg-gray-200 rounded-full h-1.5 mt-1">
                                <div class="bg-nekopeach h-1.5 rounded-full" style="width: 58%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="lg:col-span-3">
            <!-- Collector Awards Section -->
            <div class="profile-card bg-white border-2 border-nekopeach mb-6">
                <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-shopping-bag mr-3"></i> Premi Collezionista
                    </h2>
                    <p class="text-pink-100 text-sm mt-1">Completa ordini per sbloccare nuovi livelli!</p>
                </div>

                <div class="p-6">
                    <!-- Progress Bar -->
                    <div class="mb-8">
                        <div class="flex justify-between items-center mb-2">
                            <span class="text-gray-600">Progresso complessivo: <span class="font-bold text-nekopeach">54/200 ordini</span></span>
                            <span class="text-gray-600">27%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5">
                            <div class="bg-gradient-to-r from-nekopeach to-nekoorange h-2.5 rounded-full" style="width: 27%"></div>
                        </div>
                        <div class="flex justify-between items-center mt-1 text-xs">
                            <span>0</span>
                            <span>50</span>
                            <span>100</span>
                            <span>150</span>
                            <span>200</span>
                        </div>
                    </div>

                    <!-- Reward Cards -->
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <!-- Collezionista -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative active">
                            <div class="reward-badge"><i class="fas fa-medal"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text;">
                                <i class="fas fa-medal"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Collezionista</h4>
                            <p class="text-xs text-gray-600 mb-2">Completa 50 ordini</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 100%"></div>
                            </div>
                            <div class="reward-level">Sbloccato</div>
                        </div>

                        <!-- Collezionista I -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekopeach relative active glow">
                            <div class="reward-badge bg-gradient-to-r from-nekoorange to-nekopeach"><i class="fas fa-medal"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #F29966, #E55458); -webkit-background-clip: text;">
                                <i class="fas fa-medal"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Collezionista I</h4>
                            <p class="text-xs text-gray-600 mb-2">Completa 100 ordini</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 54%"></div>
                            </div>
                            <div class="reward-level">54/100</div>
                        </div>

                        <!-- Collezionista II -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative">
                            <div class="reward-badge"><i class="fas fa-medal"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #CCCCCC, #999999); -webkit-background-clip: text;">
                                <i class="fas fa-medal"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Collezionista II</h4>
                            <p class="text-xs text-gray-600 mb-2">Completa 150 ordini</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 36%"></div>
                            </div>
                            <div class="reward-level">54/150</div>
                        </div>

                        <!-- Collezionista III -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative">
                            <div class="reward-badge"><i class="fas fa-medal"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #CCCCCC, #999999); -webkit-background-clip: text;">
                                <i class="fas fa-medal"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Collezionista III</h4>
                            <p class="text-xs text-gray-600 mb-2">Completa 200 ordini</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 27%"></div>
                            </div>
                            <div class="reward-level">54/200</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Fan Awards Section -->
            <div class="profile-card bg-white border-2 border-nekoorange">
                <div class="bg-gradient-to-r from-nekoorange to-nekopink p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-heart mr-3"></i> Premi Fan Accanito
                    </h2>
                    <p class="text-pink-100 text-sm mt-1">Aggiungi articoli alla wishlist per sbloccare nuovi livelli!</p>
                </div>

                <div class="p-6">
                    <!-- Progress Bar -->
                    <div class="mb-8">
                        <div class="flex justify-between items-center mb-2">
                            <span class="text-gray-600">Progresso complessivo: <span class="font-bold text-nekopeach">87/200 articoli</span></span>
                            <span class="text-gray-600">43.5%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5">
                            <div class="bg-gradient-to-r from-nekoorange to-nekored h-2.5 rounded-full" style="width: 43.5%"></div>
                        </div>
                        <div class="flex justify-between items-center mt-1 text-xs">
                            <span>0</span>
                            <span>50</span>
                            <span>100</span>
                            <span>150</span>
                            <span>200</span>
                        </div>
                    </div>

                    <!-- Reward Cards -->
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <!-- Fan Accanito -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative active">
                            <div class="reward-badge"><i class="fas fa-star"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text;">
                                <i class="fas fa-star"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Fan Accanito</h4>
                            <p class="text-xs text-gray-600 mb-2">Aggiungi 50 articoli</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 100%"></div>
                            </div>
                            <div class="reward-level">Sbloccato</div>
                        </div>

                        <!-- Fan Accanito I -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative">
                            <div class="reward-badge"><i class="fas fa-star"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #CCCCCC, #999999); -webkit-background-clip: text;">
                                <i class="fas fa-star"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Fan Accanito I</h4>
                            <p class="text-xs text-gray-600 mb-2">Aggiungi 100 articoli</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 87%"></div>
                            </div>
                            <div class="reward-level">87/100</div>
                        </div>

                        <!-- Fan Accanito II -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative">
                            <div class="reward-badge"><i class="fas fa-star"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #CCCCCC, #999999); -webkit-background-clip: text;">
                                <i class="fas fa-star"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Fan Accanito II</h4>
                            <p class="text-xs text-gray-600 mb-2">Aggiungi 150 articoli</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 58%"></div>
                            </div>
                            <div class="reward-level">87/150</div>
                        </div>

                        <!-- Fan Accanito III -->
                        <div class="reward-card bg-white p-4 text-center border-2 border-nekobeige relative">
                            <div class="reward-badge"><i class="fas fa-star"></i></div>
                            <div class="reward-icon" style="background: linear-gradient(90deg, #CCCCCC, #999999); -webkit-background-clip: text;">
                                <i class="fas fa-star"></i>
                            </div>
                            <h4 class="font-bold text-gray-800 mb-1">Fan Accanito III</h4>
                            <p class="text-xs text-gray-600 mb-2">Aggiungi 200 articoli</p>
                            <div class="reward-progress">
                                <div class="reward-progress-fill" style="width: 43.5%"></div>
                            </div>
                            <div class="reward-level">87/200</div>
                        </div>
                    </div>

                    <!-- Benefits -->
                    <div class="mt-8 bg-nekopink/10 p-6 rounded-xl">
                        <h4 class="font-bold text-lg text-nekopeach mb-3"><i class="fas fa-gift mr-2"></i> Benefici attivi</h4>
                        <ul class="space-y-2">
                            <li class="flex items-start">
                                <i class="fas fa-check-circle text-green-500 mt-1 mr-2"></i>
                                <span>Sconto del 5% su tutti gli ordini (Collezionista)</span>
                            </li>
                            <li class="flex items-start">
                                <i class="fas fa-check-circle text-green-500 mt-1 mr-2"></i>
                                <span>Accesso anticipato alle nuove uscite (Fan Accanito)</span>
                            </li>
                            <li class="flex items-start text-gray-400">
                                <i class="fas fa-lock mt-1 mr-2"></i>
                                <span>Sconto del 10% su tutti gli ordini (sblocco a Collezionista II)</span>
                            </li>
                        </ul>
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

<script>
    // Add cherry blossom decorations
    function createBlossoms() {
        const container = document.createElement('div');
        container.id = 'decorations';
        document.body.prepend(container);

        for (let i = 0; i < 15; i++) {
            const blossom = document.createElement('div');
            blossom.className = 'cherry-blossom';
            blossom.style.left = `${Math.random() * 100}%`;
            blossom.style.animationDuration = `${10 + Math.random() * 15}s`;
            blossom.style.animationDelay = `${Math.random() * 5}s`;
            blossom.style.opacity = '0.7';
            container.appendChild(blossom);
        }
    }

    // Initialize the page
    document.addEventListener('DOMContentLoaded', function() {
        createBlossoms();

        // Tab functionality
        const tabButtons = document.querySelectorAll('.tab-btn');
        tabButtons.forEach(button => {
            button.addEventListener('click', function() {
                const tabName = this.getAttribute('data-tab');
                const tabContents = document.querySelectorAll('.tab-content');

                tabContents.forEach(content => {
                    content.classList.remove('active');
                });

                document.getElementById(`${tabName}-tab`).classList.add('active');
            });
        });
    });
</script>
</body>
</html>
