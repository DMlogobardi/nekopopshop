<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Gestione Ordini</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/ordini.css">
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
                        nekoblue: '#5d8bf4',
                        nekoaqua: '#2dd4bf',
                        nekogreen: '#4ade80',
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

            </div>

        </div>

        <!-- Navigation -->

    </div>

    <!-- Search and Filter Section -->
    <div class="max-w-6xl mx-auto mb-8">
        <div class="profile-card bg-white border-2 border-nekoblue">
            <div class="bg-gradient-to-r from-nekoblue to-nekoaqua p-4">
                <h2 class="text-xl font-bold text-white flex items-center">
                    <i class="fas fa-filter mr-3" style="font-size: 30px"></i>
                    <span style="font-size: 30px">Filtra Ordini</span>
                </h2>
            </div>

            <div class="p-6 grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                    <label for="search" class="block text-gray-700 text-sm font-bold mb-2">Cerca per ID ordine o cliente</label>
                    <div class="relative">
                        <input type="text" id="search" placeholder="ID ordine, nome cliente..."
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekoblue">
                        <button class="absolute right-0 top-0 h-full px-4 text-nekoblue">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <div>
                    <label for="date-range" class="block text-gray-700 text-sm font-bold mb-2">Intervallo date</label>
                    <div class="flex gap-2">
                        <input type="date" id="start-date" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekoblue">
                        <span class="flex items-center">a</span>
                        <input type="date" id="end-date" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekoblue">
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2">Stato ordine</label>
                    <div class="flex flex-wrap">
                        <div class="filter-chip active" data-status="all">
                            <i class="fas fa-circle mr-2" style="font-size: 8px;"></i> Tutti
                        </div>
                        <div class="filter-chip inactive" data-status="processing">
                            <i class="fas fa-circle mr-2" style="color: #92400e; font-size: 8px;"></i> In elaborazione
                        </div>
                        <div class="filter-chip inactive" data-status="shipped">
                            <i class="fas fa-circle mr-2" style="color: #065f46; font-size: 8px;"></i> Spedito
                        </div>
                        <div class="filter-chip inactive" data-status="delivered">
                            <i class="fas fa-circle mr-2" style="color: #1e40af; font-size: 8px;"></i> Consegnato
                        </div>
                        <div class="filter-chip inactive" data-status="cancelled">
                            <i class="fas fa-circle mr-2" style="color: #991b1b; font-size: 8px;"></i> Cancellato
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Orders List -->
    <div class="max-w-6xl mx-auto">
        <div class="profile-card bg-white border-2 border-nekoblue mb-6">
            <div class="bg-gradient-to-r from-nekoblue to-nekoaqua p-4">
                <h2 class="text-xl font-bold text-white flex items-center justify-between">
          <span>
            <i class="fas fa-clipboard-list mr-3" style="font-size: 30px"></i>
            <span style="font-size: 30px">Elenco Ordini</span>
          </span>
                    <span class="text-sm bg-white/30 px-3 py-1 rounded-full font-normal">
            <span id="orders-count">8</span> ordini trovati
          </span>
                </h2>
            </div>

            <div class="p-6">
                <!-- Loading state -->
                <div id="loading" class="flex justify-center items-center py-12">
                    <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekoblue"></div>
                </div>

                <!-- Orders grid -->
                <div id="orders-grid" class="grid grid-cols-1 gap-4 hidden">
                    <!-- Order card 1 (sample) -->
                    <div class="order-card bg-white p-4">
                        <div class="flex flex-col">
                            <div class="flex justify-between items-start mb-3">
                                <div>
                                    <h3 class="font-bold text-lg text-gray-800">Ordine #NEKO-2023-0015</h3>
                                    <p class="text-sm text-gray-600">Cliente: Marco Rossi</p>
                                </div>
                                <div class="flex items-center">
                  <span class="status-badge status-processing mr-3">
                    <i class="fas fa-clock mr-1"></i> In elaborazione
                  </span>
                                    <span class="text-sm font-bold text-gray-700">€129.98</span>
                                </div>
                            </div>

                            <div class="flex justify-between items-center mb-3">
                                <div>
                                    <p class="text-sm text-gray-600"><i class="far fa-calendar-alt mr-2"></i> Data: 15/06/2023</p>
                                    <p class="text-sm text-gray-600"><i class="fas fa-box mr-2"></i> 3 articoli</p>
                                </div>
                                <div class="flex gap-2">
                                    <button class="action-btn view-btn">
                                        <i class="fas fa-eye mr-1"></i> Dettagli
                                    </button>
                                    <button class="action-btn update-btn">
                                        <i class="fas fa-check mr-1"></i> Completa
                                    </button>
                                    <button class="action-btn cancel-btn">
                                        <i class="fas fa-times mr-1"></i> Annulla
                                    </button>
                                </div>
                            </div>

                            <!-- Order details (hidden by default) -->
                            <div class="order-details">
                                <div class="border-t border-gray-200 pt-3 mt-3">
                                    <h4 class="font-bold text-gray-700 mb-2">Prodotti:</h4>
                                    <div class="grid grid-cols-1 md:grid-cols-3 gap-3 mb-4">
                                        <!-- Product 1 -->
                                        <div class="flex items-center p-2 bg-gray-50 rounded-lg">
                                            <img src="https://via.placeholder.com/200" alt="Product" class="product-image mr-3">
                                            <div>
                                                <p class="font-medium text-gray-800">Nendoroid Hatsune Miku</p>
                                                <p class="text-sm text-gray-600">Quantità: 1</p>
                                                <p class="text-sm font-bold text-nekoblue">€49.99</p>
                                            </div>
                                        </div>
                                        <!-- Product 2 -->
                                        <div class="flex items-center p-2 bg-gray-50 rounded-lg">
                                            <img src="https://via.placeholder.com/200" alt="Product" class="product-image mr-3">
                                            <div>
                                                <p class="font-medium text-gray-800">One Piece Poster</p>
                                                <p class="text-sm text-gray-600">Quantità: 2</p>
                                                <p class="text-sm font-bold text-nekoblue">€29.99</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <div>
                                            <h4 class="font-bold text-gray-700 mb-2">Indirizzo di spedizione:</h4>
                                            <div class="bg-gray-50 p-3 rounded-lg">
                                                <p class="text-sm">Marco Rossi</p>
                                                <p class="text-sm">Via Roma 123</p>
                                                <p class="text-sm">20100 Milano, Italia</p>
                                                <p class="text-sm mt-2"><i class="fas fa-phone mr-2"></i> +39 1234567890</p>
                                            </div>
                                        </div>

                                        <div>
                                            <h4 class="font-bold text-gray-700 mb-2">Metodo di pagamento:</h4>
                                            <div class="bg-gray-50 p-3 rounded-lg">
                                                <div class="flex items-center mb-2">
                                                    <i class="fab fa-cc-paypal text-2xl text-blue-500 mr-2"></i>
                                                    <span class="font-medium">PayPal</span>
                                                </div>
                                                <p class="text-sm">ID transazione: PAYPAL-5JK4321</p>
                                                <p class="text-sm">Stato: Completato</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Order card 2 (sample) -->
                    <div class="order-card bg-white p-4">
                        <div class="flex flex-col">
                            <div class="flex justify-between items-start mb-3">
                                <div>
                                    <h3 class="font-bold text-lg text-gray-800">Ordine #NEKO-2023-0014</h3>
                                    <p class="text-sm text-gray-600">Cliente: Anna Bianchi</p>
                                </div>
                                <div class="flex items-center">
                  <span class="status-badge status-shipped mr-3">
                    <i class="fas fa-truck mr-1"></i> Spedito
                  </span>
                                    <span class="text-sm font-bold text-gray-700">€89.99</span>
                                </div>
                            </div>

                            <div class="flex justify-between items-center mb-3">
                                <div>
                                    <p class="text-sm text-gray-600"><i class="far fa-calendar-alt mr-2"></i> Data: 12/06/2023</p>
                                    <p class="text-sm text-gray-600"><i class="fas fa-box mr-2"></i> 1 articolo</p>
                                </div>
                                <div class="flex gap-2">
                                    <button class="action-btn view-btn">
                                        <i class="fas fa-eye mr-1"></i> Dettagli
                                    </button>
                                    <button class="action-btn update-btn">
                                        <i class="fas fa-check mr-1"></i> Segna come consegnato
                                    </button>
                                </div>
                            </div>

                            <!-- Order details (hidden by default) -->
                            <div class="order-details">
                                <div class="border-t border-gray-200 pt-3 mt-3">
                                    <h4 class="font-bold text-gray-700 mb-2">Informazioni spedizione:</h4>
                                    <div class="bg-gray-50 p-3 rounded-lg mb-4">
                                        <div class="flex items-center mb-2">
                                            <i class="fas fa-truck text-xl text-nekoblue mr-2"></i>
                                            <span class="font-medium">Corriere: DHL Express</span>
                                        </div>
                                        <p class="text-sm">Codice tracking: <span class="font-medium">1234567890</span></p>
                                        <p class="text-sm">Stimato consegna: 18/06/2023</p>
                                    </div>

                                    <h4 class="font-bold text-gray-700 mb-2">Prodotti:</h4>
                                    <div class="grid grid-cols-1 md:grid-cols-3 gap-3 mb-4">
                                        <!-- Product 1 -->
                                        <div class="flex items-center p-2 bg-gray-50 rounded-lg">
                                            <img src="https://via.placeholder.com/200" alt="Product" class="product-image mr-3">
                                            <div>
                                                <p class="font-medium text-gray-800">Luffy Gear 5 Figure</p>
                                                <p class="text-sm text-gray-600">Quantità: 1</p>
                                                <p class="text-sm font-bold text-nekoblue">€89.99</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- No orders found -->
                <div id="no-orders" class="hidden">
                    <div class="no-orders text-center p-8 rounded-lg">
                        <div class="w-16 h-16 mx-auto mb-4 bg-white/80 rounded-full flex items-center justify-center">
                            <i class="fas fa-search text-2xl text-nekoblue"></i>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-2">Nessun ordine trovato</h3>
                        <p class="text-gray-600 mb-4">Prova a modificare i filtri di ricerca</p>
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="px-6 pb-6 pt-3">
                <div class="flex justify-between items-center">
                    <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-medium disabled:opacity-50" id="prev-page" disabled>
                        <i class="fas fa-chevron-left mr-2"></i> Precedenti
                    </button>
                    <div class="flex gap-2">
                        <button class="pagination-btn w-8 h-8 rounded-full bg-nekopink text-nekopeach">1</button>
                        <button class="pagination-btn w-8 h-8 rounded-full">2</button>
                    </div>
                    <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-medium" id="next-page">
                        Successivi <i class="fas fa-chevron-right ml-2"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Confirmation Modal -->
<div id="confirmation-modal" class="fixed inset-0 z-50 confirmation-modal hidden">
    <div class="flex items-center justify-center min-h-screen">
        <div class= "confirmation-box bg-white rounded-lg shadow-xl max-w-md w">

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
</body>
</html>
