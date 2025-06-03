<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - I tuoi ordini</title>
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
                    },
                    animation: {
                        'pulse-slow': 'pulse 3s infinite',
                        'float': 'float 6s ease-in-out infinite',
                    }
                }
            }
        }
    </script>
    <style>
        @font-face {
            font-family: 'Milkyway';  /* Scegli un nome per il font */
            src: url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff2'),  /* Percorso relativo */
            url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff');
            font-weight: normal;        /* Peso del font (es. 400, 700) */
            font-style: normal;        /* normale, italic, ecc. */
            font-display: swap;        /* Ottimizza il rendering */
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @keyframes blossom-fall {
            0% { transform: translateY(-50px) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(100vh) rotate(360deg); opacity: 0; }
        }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f0f0f0;

            /* Immagine di background principale */
            background-image: url('${pageContext.request.contextPath}/frontend/images/sfondo.png');

            /* Centra e copre tutto lo spazio senza ripetizioni */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;

            /* Altezza minima = viewport height */
            min-height: 100vh;

            /* Fix per mobile: scroll invece di fixed (evita bug su iOS/Android) */
            background-attachment: scroll;

            /* Ottimizzazione prestazioni */
            image-rendering: smooth;
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

        .nekotag {
            background: linear-gradient(90deg, #E55458, #F29966);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            font-weight: 800;
            font-size: 45px;
        }

        .stats-card {
            transition: all 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(229, 84, 88, 0.2);
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            width: 20px;
            height: 20px;
            background-color: #E55458;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: bold;
        }

        .order-card {
            transition: all 0.3s ease;
            border-left: 4px solid #E55458;
        }

        .order-card:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
        }

        .status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: bold;
            text-transform: uppercase;
        }

        .progress-tracker {
            position: relative;
            height: 8px;
            background-color: #f2d5bb;
            border-radius: 4px;
            margin-top: 20px;
        }

        .progress-tracker::before {
            content: '';
            position: absolute;
            top: -15px;
            width: 100%;
            height: 40px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .progress-step {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 3px solid #f2d5bb;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            z-index: 2;
            color: white;
            font-size: 0.75rem;
        }

        .progress-step.active {
            background-color: #E55458;
            border-color: #E55458;
        }

        .progress-step.completed {
            background-color: #4CAF50;
            border-color: #4CAF50;
        }

        .progress-step-text {
            position: absolute;
            top: 35px;
            font-size: 0.7rem;
            color: #666;
            white-space: nowrap;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #4CAF50, #E55458);
            border-radius: 4px;
            transition: width 0.3s ease;
            position: relative;
            z-index: 1;
        }

        .order-item {
            transition: all 0.3s ease;
            border-left: 2px solid #fbd8da;
        }

        .order-item:hover {
            background-color: #fbd8da20;
        }

        .cherry-blossom {
            position: absolute;
            width: 30px;
            height: 30px;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48ZyBmaWxsPSIjZmY3ZWI4Ij48cGF0aCBkPSJNNTAgMTBjLTIyIDAtNDAgMTgtNDAgNDBzMTggNDAgNDAgNDAgNDAtMTggNDAtNDAtMTgtNDAtNDAtNDB6bTAgODFhOSA5IDAgMCAxIDAgMCAwIDkgOSAwIDAgMCAwIDB6Ii8+PHBhdGggZD0iTTIwIDEwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDE4IDAgMiAyIDAgMCAwLTIgMiA5IDkgMCAwIDEtMTggMHoiLz48cGF0aCBkPSJNNjAgMTBhMiAyIDAgMCAwLTItMmE5IDkgMCAwIDEgMCAxOCAyIDIgMCAwIDAgMiAyIDkgOSAwIDAgMSAwLTE4eiIvPjxwYXRoIGQ9Ik0yMCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAxOCAwIDIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxLTE4IDB6Ii8+PHBhdGggZD0iTTYwIDYwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDAgMTggMiAyIDAgMCAwIDIgMiA5IDkgMCAwIDEgMC0xOHoiLz48L2c+PC9zdmc+');
            background-size: cover;
            animation: blossom-fall 15s linear infinite;
            z-index: 0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animated-card {
            animation: fadeIn 0.5s ease;
        }

        .text-3xl{
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }
        .text-xl{
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
<!-- Decorative elements -->
<div id="decorations"></div>

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekopeach z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-box-open text-white text-lg"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-box-open text-lg text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold" style="font-size: 45px"><span class="nekotag">I tuoi ordini</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Storico e stato degli ordini</p>
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
                <a href="wishlist.jsp" class="folder-tab"><i class="fas fa-heart mr-2"></i> Wishlist</a>
                <a href="ordini.jsp" class="folder-tab active"><i class="fas fa-box-open mr-2"></i> Ordini</a>
            </div>
        </div>
    </div>

    <!-- Orders Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Orders Stats -->
        <div class="lg:col-span-1">
            <!-- Orders Summary Card -->
            <div class="profile-card bg-white border-2 border-nekored mb-6">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 25px">
                        <i class="fas fa-chart-line mr-3"></i> Riepilogo ordini
                    </h2>
                </div>

                <div class="p-4">
                    <div class="grid grid-cols-2 gap-4 mb-4">
                        <div class="stats-card bg-nekopink/20 p-3 rounded-lg text-center">
                            <div class="text-3xl font-bold text-nekopeach">14</div>
                            <div class="text-sm text-gray-600">Ordini totali</div>
                        </div>
                        <div class="stats-card bg-nekored/20 p-3 rounded-lg text-center">
                            <div class="text-3xl font-bold text-nekored">&#8364 1,284</div>
                            <div class="text-sm text-gray-600">Totale speso</div>
                        </div>
                    </div>

                    <div class="space-y-4">
                        <div>
                            <div class="flex justify-between text-sm text-gray-600 mb-1">
                                <span>Completati</span>
                                <span>8 (57%)</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-green-500 h-2.5 rounded-full" style="width: 57%"></div>
                            </div>
                        </div>

                        <div>
                            <div class="flex justify-between text-sm text-gray-600 mb-1">
                                <span>In transito</span>
                                <span>3 (21%)</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-yellow-500 h-2.5 rounded-full" style="width: 21%"></div>
                            </div>
                        </div>

                        <div>
                            <div class="flex justify-between text-sm text-gray-600 mb-1">
                                <span>Annullati</span>
                                <span>2 (14%)</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-red-500 h-2.5 rounded-full" style="width: 14%"></div>
                            </div>
                        </div>

                        <div>
                            <div class="flex justify-between text-sm text-gray-600 mb-1">
                                <span>In elaborazione</span>
                                <span>1 (7%)</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-blue-500 h-2.5 rounded-full" style="width: 7%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Orders Filter Card -->
            <div class="profile-card bg-white border-2 border-nekored">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h3 class="text-xl font-bold text-white flex items-center" style="font-size: 25px">
                        <i class="fas fa-filter mr-3"></i> Filtra ordini
                    </h3>
                </div>

                <div class="p-4">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Stato ordine</label>
                        <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach">
                            <option>Tutti gli ordini</option>
                            <option>Completati</option>
                            <option>In transito</option>
                            <option>In elaborazione</option>
                            <option>Annullati</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Periodo</label>
                        <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach">
                            <option>Ultimi 6 mesi</option>
                            <option>Quest'anno</option>
                            <option>2022</option>
                            <option>2021</option>
                            <option>Tutto</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Categoria</label>
                        <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach">
                            <option>Tutte le categorie</option>
                            <option>Manga</option>
                            <option>Action Figure</option>
                            <option>Merchandise</option>
                            <option>Preordini</option>
                        </select>
                    </div>

                    <div class="flex justify-between">
                        <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-lg transition">
                            Resetta
                        </button>
                        <button class="bg-nekopeach hover:bg-nekored text-white font-bold py-2 px-4 rounded-lg transition">
                            Applica
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Orders Content -->
        <div class="lg:col-span-3">
            <!-- Orders Header -->
            <div class="profile-card bg-white border-2 border-nekopink mb-6">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div>
                            <h2 class="text-xl font-bold text-white" style="font-size: 25px">I tuoi ordini recenti</h2>
                            <p class="text-pink-200">14 ordini trovati</p>
                        </div>
                        <div class="mt-4 md:mt-0">
                            <button class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                                <i class="fas fa-download mr-2"></i> Scarica fatture
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Orders List -->
            <div class="space-y-6">
                <!-- Order 1 -->
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden animated-card">
                    <div class="bg-gradient-to-r from-nekopink to-nekobeige p-4 flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div class="flex items-center">
                            <div class="w-12 h-12 rounded-full bg-white flex items-center justify-center text-nekopeach mr-4">
                                <i class="fas fa-box-open text-lg"></i>
                            </div>
                            <div>
                                <h3 class="font-bold text-gray-800">Ordine #NPS-2023-1547</h3>
                                <p class="text-sm text-gray-600">Effettuato il 15/09/2023</p>
                            </div>
                        </div>
                        <div class="mt-2 md:mt-0 text-right">
                            <div class="text-lg font-bold text-nekopeach">&#8364 142.85</div>
                            <span class="status-badge bg-green-100 text-green-800">Completato</span>
                        </div>
                    </div>

                    <div class="p-4 border-b border-gray-100">
                        <div class="progress-tracker">
                            <div class="progress-fill" style="width: 100%"></div>
                            <div class="flex justify-between relative">
                                <div class="progress-step completed">
                                    <i class="fas fa-check"></i>
                                    <div class="progress-step-text">Ordinato</div>
                                </div>
                                <div class="progress-step completed">
                                    <i class="fas fa-check"></i>
                                    <div class="progress-step-text">Processato</div>
                                </div>
                                <div class="progress-step completed">
                                    <i class="fas fa-check"></i>
                                    <div class="progress-step-text">Spedito</div>
                                </div>
                                <div class="progress-step completed">
                                    <i class="fas fa-check"></i>
                                    <div class="progress-step-text">Consegnato</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="divide-y divide-gray-100">
                        <!-- Order Item 1 -->
                        <div class="order-item p-4 flex">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">Jujutsu Kaisen Vol.15</h4>
                                <p class="text-sm text-gray-500 mb-2">Manga</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 14.99</span>
                                        <span class="text-gray-500 ml-2">x1</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Order Item 2 -->
                        <div class="order-item p-4 flex">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">Chainsaw Man Figure</h4>
                                <p class="text-sm text-gray-500 mb-2">Action Figure</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 59.99</span>
                                        <span class="text-gray-500 ml-2">x1</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="p-4 bg-gray-50 flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div class="text-sm text-gray-600 mb-2 md:mb-0">
                            <i class="fas fa-truck mr-2 text-nekopeach"></i>
                            <span>Spedito con DHL Express - Codice tracciamento: <span class="font-bold">DH123456789JP</span></span>
                        </div>
                        <div class="space-x-2">
                            <button class="bg-white border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white px-4 py-2 rounded-lg transition text-sm">
                                <i class="fas fa-redo mr-1"></i> Acquista di nuovo
                            </button>
                            <button class="bg-nekopeach hover:bg-nekored text-white px-4 py-2 rounded-lg transition text-sm">
                                <i class="fas fa-file-invoice mr-1"></i> Fattura
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Order 2 -->
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden animated-card">
                    <div class="bg-gradient-to-r from-nekopink to-nekobeige p-4 flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div class="flex items-center">
                            <div class="w-12 h-12 rounded-full bg-white flex items-center justify-center text-nekopeach mr-4">
                                <i class="fas fa-box-open text-lg"></i>
                            </div>
                            <div>
                                <h3 class="font-bold text-gray-800">Ordine #NPS-2023-1503</h3>
                                <p class="text-sm text-gray-600">Effettuato il 10/09/2023</p>
                            </div>
                        </div>
                        <div class="mt-2 md:mt-0 text-right">
                            <div class="text-lg font-bold text-nekopeach">&#8364 87.96</div>
                            <span class="status-badge bg-yellow-100 text-yellow-800">In transito</span>
                        </div>
                    </div>

                    <div class="p-4 border-b border-gray-100">
                        <div class="progress-tracker">
                            <div class="progress-fill" style="width: 66%"></div>
                            <div class="flex justify-between relative">
                                <div class="progress-step completed">
                                    <i class="fas fa-check"></i>
                                    <div class="progress-step-text">Ordinato</div>
                                </div>
                                <div class="progress-step completed">
                                    <i class="fas fa-check"></i>
                                    <div class="progress-step-text">Processato</div>
                                </div>
                                <div class="progress-step active">
                                    <i class="fas fa-shipping-fast"></i>
                                    <div class="progress-step-text">Spedito</div>
                                </div>
                                <div class="progress-step">
                                    <i class="fas fa-home"></i>
                                    <div class="progress-step-text">Consegnato</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="divide-y divide-gray-100">
                        <!-- Order Item 1 -->
                        <div class="order-item p-4 flex">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1620898854390-d301eb3715a4?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">Demon Slayer T-Shirt</h4>
                                <p class="text-sm text-gray-500 mb-2">Merchandise</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 24.99</span>
                                        <span class="text-gray-500 ml-2">x1</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Order Item 2 -->
                        <div class="order-item p-4 flex">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">Tokyo Revengers Vol.1</h4>
                                <p class="text-sm text-gray-500 mb-2">Manga</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 12.99</span>
                                        <span class="text-gray-500 ml-2">x2</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Order Item 3 -->
                        <div class="order-item p-4 flex">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">My Hero Academia Poster</h4>
                                <p class="text-sm text-gray-500 mb-2">Poster</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 14.99</span>
                                        <span class="text-gray-500 ml-2">x1</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="p-4 bg-gray-50 flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div class="text-sm text-gray-600 mb-2 md:mb-0">
                            <i class="fas fa-map-marker-alt mr-2 text-nekopeach"></i>
                            <span>Prevista consegna: <span class="font-bold">20/09/2023</span></span>
                        </div>
                        <div class="space-x-2">
                            <button class="bg-white border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white px-4 py-2 rounded-lg transition text-sm">
                                <i class="fas fa-shipping-fast mr-1"></i> Traccia ordine
                            </button>
                            <button class="bg-nekopeach hover:bg-nekored text-white px-4 py-2 rounded-lg transition text-sm">
                                <i class="fas fa-question-circle mr-1"></i> Assistenza
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Order 3 -->
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden animated-card">
                    <div class="bg-gradient-to-r from-nekopink to-nekobeige p-4 flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div class="flex items-center">
                            <div class="w-12 h-12 rounded-full bg-white flex items-center justify-center text-nekopeach mr-4">
                                <i class="fas fa-box-open text-lg"></i>
                            </div>
                            <div>
                                <h3 class="font-bold text-gray-800">Ordine #NPS-2023-1421</h3>
                                <p class="text-sm text-gray-600">Effettuato il 01/09/2023</p>
                            </div>
                        </div>
                        <div class="mt-2 md:mt-0 text-right">
                            <div class="text-lg font-bold text-gray-500 line-through">&#8364 179.97</div>
                            <span class="status-badge bg-red-100 text-red-800">Annullato</span>
                        </div>
                    </div>

                    <div class="p-4">
                        <div class="alert bg-red-50 text-red-800 p-3 rounded-lg text-sm flex items-center">
                            <i class="fas fa-exclamation-circle mr-2"></i>
                            <span>L'ordine &egrave stato annullato il 03/09/2023 su tua richiesta.</span>
                        </div>
                    </div>

                    <div class="divide-y divide-gray-100">
                        <!-- Order Item 1 -->
                        <div class="order-item p-4 flex opacity-60">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">Attack on Titan - Levi Figurine</h4>
                                <p class="text-sm text-gray-500 mb-2">Action Figure</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 79.99</span>
                                        <span class="text-gray-500 ml-2">x1</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Order Item 2 -->
                        <div class="order-item p-4 flex opacity-60">
                            <div class="w-16 h-16 bg-gray-100 rounded-lg overflow-hidden mr-4">
                                <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=100" alt="Product" class="w-full h-full object-cover">
                            </div>
                            <div class="flex-1">
                                <h4 class="font-medium text-gray-800">Chainsaw Man Mug</h4>
                                <p class="text-sm text-gray-500 mb-2">Merchandise</p>
                                <div class="flex justify-between">
                                    <div class="text-sm">
                                        <span class="font-bold text-gray-700">&#8364 19.99</span>
                                        <span class="text-gray-500 ml-2">x1</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="p-4 bg-gray-50 flex md:justify-end">
                        <button class="bg-nekopeach hover:bg-nekored text-white px-4 py-2 rounded-lg transition text-sm">
                            <i class="fas fa-sync-alt mr-1"></i> Ripristina ordine
                        </button>
                    </div>
                </div>

                <!-- Empty State Example (hidden by default) -->
                <div class="hidden profile-card bg-white border-2 border-nekopink p-8 text-center">
                    <div class="mb-6">
                        <i class="fas fa-box-open text-6xl text-gray-300 mb-4"></i>
                        <h3 class="text-xl font-bold text-gray-600 mb-2">Nessun ordine trovato</h3>
                        <p class="text-gray-500 mb-4">Non hai ancora effettuato ordini con il tuo account. Inizia a fare shopping!</p>
                        <button class="bg-nekopeach hover:bg-nekored text-white font-bold py-2 px-6 rounded-full transition">
                            Esplora il catalogo
                        </button>
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="mt-6 flex justify-center">
                <nav class="flex items-center space-x-1">
                    <button class="w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100">
                        <i class="fas fa-chevron-left text-xs"></i>
                    </button>

                    <button class="w-10 h-10 rounded-full border border-nekopeach bg-nekopeach text-white flex items-center justify-center">
                        1
                    </button>

                    <button class="w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100">
                        2
                    </button>

                    <button class="w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100">
                        3
                    </button>

                    <button class="w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100">
                        <i class="fas fa-chevron-right text-xs"></i>
                    </button>
                </nav>
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
                        <i class="fas fa-caret-right mr-2"></i> Rimborsi e resi
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Traccia ordine
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
            <p>&copy; 2023 NekoPopShop. Tutti i diriti riservati.</p>
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

<!-- Scripts -->
<script>
    // Function to create cherry blossom decorations
    function createCherryBlossoms() {
        const decorations = document.getElementById('decorations');
        const count = 15;

        for (let i = 0; i < count; i++) {
            const blossom = document.createElement('div');
            blossom.className = 'cherry-blossom';

            // Random position
            const left = Math.random() * 100;
            blossom.style.left = `${left}vw`;

            // Random delay and duration
            const delay = Math.random() * 10;
            const duration = 10 + Math.random() * 15;

            blossom.style.animationDelay = `${delay}s`;
            blossom.style.animationDuration = `${duration}s`;

            // Random size
            const size = 15 + Math.random() * 20;
            blossom.style.width = `${size}px`;
            blossom.style.height = `${size}px`;

            decorations.appendChild(blossom);
        }
    }

    // Function to track order status
    function updateOrderStatus() {
        document.querySelectorAll('.order-card').forEach(card => {
            const status = card.querySelector('.status-badge');
            if (status) {
                const currentStatus = status.textContent.trim();
                const progressBar = card.querySelector('.progress-fill');

                if (currentStatus === 'Completato') {
                    progressBar.style.width = '100%';
                } else if (currentStatus === 'In transito') {
                    progressBar.style.width = '66%';
                } else if (currentStatus === 'In elaborazione') {
                    progressBar.style.width = '33%';
                } else {
                    progressBar.style.width = '0%';
                }
            }
        });
    }

    // Function to handle order actions
    function setupOrderButtons() {
        document.querySelectorAll('[data-order-action]').forEach(button => {
            button.addEventListener('click', function() {
                const action = this.getAttribute('data-order-action');
                const orderId = this.closest('.order-card').getAttribute('data-order-id');

                // Here you would typically make an AJAX call to the server
                alert(`Azione "${action}" richiesta per ordine: ${orderId}`);
            });
        });
    }

    // Function to toggle order details
    function setupOrderDetailsToggle() {
        document.querySelectorAll('.order-toggle').forEach(toggle => {
            toggle.addEventListener('click', function() {
                const orderId = this.getAttribute('data-order-id');
                const details = document.getElementById(`order-details-${orderId}`);

                if (details) {
                    details.classList.toggle('hidden');
                }
            });
        });
    }

    // Initialize everything when the DOM is loaded
    document.addEventListener('DOMContentLoaded', () => {
        createCherryBlossoms();
        updateOrderStatus();
        setupOrderButtons();
        setupOrderDetailsToggle();
    });
</script>
</body>
</html>
