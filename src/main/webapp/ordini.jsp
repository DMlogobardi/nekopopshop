<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Gestione Ordini</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
    <style>

        @font-face {
            font-family: 'Milkyway';
            src: url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff2'),
            url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff');
            font-weight: normal;
            font-style: normal;
            font-display: swap;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f0f0f0;
            background-image: url('${pageContext.request.contextPath}/frontend/images/sfondo.png');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            min-height: 100vh;
            background-attachment: scroll;
            overflow-x: hidden;
        }

        @media (min-width: 768px) {
            body {
                background-attachment: fixed;
            }
        }

            .folder-tab {
                position: relative;
                background-color: #f2d5bb;
                padding: 15px 25px;
                border-radius: 15px 15px 0 0;
                border: 2px solid #E55458;
                border-bottom: none;
                box-shadow: 0 -3px 8px #E55458;
                margin-right: -10px;
                z-index: 1;
                transition: all 0.3s ease;
                color: #E55458;
            }

            .folder-tab.active, .folder-tab:hover {
                background-color: #E55458;
                color: white;
                transform: translateY(-0px);
                z-index: 2;
            }

            .folder-tab::after {
                content: '';
                position: absolute;
                bottom: -15px;
                left: 0;
                width: 100%;
                height: 15px;
                background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxNXB4IiB2aWV3Qm94PSIwIDAgMTAwIDUiPiAgPHBhdGggZmlsbD0iI2ZmZDJlNSIgZD0iTTAgMCBMNTAgNSBMIDEwMCAwIFoiLz48L3N2Zz4=');
                background-size: 100% 15px;
                background-position: bottom center;
                background-repeat: no-repeat;
                z-index: -1;
            }

            .nekotag {
                background: linear-gradient(90deg, #E55458, #F29966);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                position: relative;
                font-weight: 800;
                font-size: 45px;
            }

            .profile-card {
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
                overflow: hidden;
                border-radius: 20px;
            }

            .profile-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(229, 84, 88, 0.3);
            }

            .header-content {
                background: linear-gradient(145deg, #E55458, #f2d5bb);
                border-radius: 20px;
                box-shadow: 0 10px 25px rgba(229, 84, 88, 0.3);
                border: 2px solid #ffd1e3;
            }

            .order-card {
                transition: all 0.3s ease;
                border: 2px solid #f2d5bb;
                border-radius: 15px;
                overflow: hidden;
            }

            .order-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(229, 84, 88, 0.2);
                border-color: #e55458;
            }

            .status-badge {
                padding: 4px 10px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: bold;
                text-transform: uppercase;
            }

            .status-processing {
                background-color: #fef3c7;
                color: #92400e;
            }

            .status-shipped {
                background-color: #d1fae5;
                color: #065f46;
            }

            .status-delivered {
                background-color: #dbeafe;
                color: #1e40af;
            }

            .status-cancelled {
                background-color: #fee2e2;
                color: #991b1b;
            }

            .product-image {
                height: 80px;
                width: 80px;
                object-fit: contain;
                background-color: #fbd8da50;
                border-radius: 8px;
            }

            .action-btn {
                transition: all 0.3s ease;
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
            }

            .view-btn {
                background-color: #5d8bf4;
                color: white;
            }

            .view-btn:hover {
                background-color: #3b82f6;
                transform: scale(1.05);
            }

            .update-btn {
                background-color: #4ade80;
                color: white;
            }

            .update-btn:hover {
                background-color: #22c55e;
                transform: scale(1.05);
            }

            .cancel-btn {
                background-color: #f24535;
                color: white;
            }

            .cancel-btn:hover {
                background-color: #d12b1a;
                transform: scale(1.05);
            }

            .pagination-btn {
                transition: all 0.3s ease;
            }

            .pagination-btn:hover {
                background-color: #e55458;
                color: white;
            }

            .pagination-btn.active {
                background-color: #e55458;
                color: white;
            }

            .no-orders {
                background: linear-gradient(45deg, #fbd8da, #f2d5bb);
                border: 2px dashed #e55458;
                border-radius: 15px;
            }

            .confirmation-modal {
                background-color: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(5px);
            }

            .confirmation-box {
                animation: pulse 0.5s ease-in-out;
            }

            .order-details {
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.5s ease;
            }

            .order-details.open {
                max-height: 1000px;
            }

            .filter-chip {
                display: inline-flex;
                align-items: center;
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 13px;
                font-weight: 600;
                margin-right: 8px;
                margin-bottom: 8px;
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .filter-chip.active {
                background-color: #e55458;
                color: white;
            }

            .filter-chip.inactive {
                background-color: #f3f4f6;
                color: #6b7280;
            }

            .filter-chip.inactive:hover {
                background-color: #e5e7eb;
            }

            .text-3xl {
                font-family: 'Milkyway', sans-serif;
                font-size: 2.5rem;
                color: #333;
            }

            .text-xl {
                font-family: 'Milkyway', sans-serif;
                font-size: 2.5rem;
                color: #333;
            }

            .text-lg {
                font-family: 'Milkyway', sans-serif;
                font-size: 2.5rem;
                color: #333;
            }

            .fa-star, .fas, .far {
                font-style: normal !important;
            }


    </style>
</head>
<body class="relative overflow-x-hidden">
<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekoblue z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-truck text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-shopping-bag text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Gestione Ordini</span></h1>
                <p class="text-xl text-nekoblue font-bold" style="font-size: 25px; background: linear-gradient(90deg, #e55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Pannello di amministrazione</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="admin.jsp" class="folder-tab"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a>
                <a href="gestioneprodotti.jsp" class="folder-tab"><i class="fas fa-boxes mr-2"></i> Prodotti</a>
                <a href="ordini.jsp" class="folder-tab active"><i class="fas fa-shopping-cart mr-2"></i> Ordini</a>
                <a href="gestioneutenti.jsp" class="folder-tab"><i class="fas fa-users mr-2"></i> Utenti</a>
                <a href="logout.jsp" class="folder-tab"><i class="fas fa-sign-out-alt mr-2"></i> Esci</a>
            </div>
        </div>
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
</body>
</html>
