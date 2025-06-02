<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Catalogo Manga</title>
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
                        kawaiblue: '#92b8d6',
                        nekopurple: '#b983d3',
                        kawaililac: '#caa8e8'
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
            50% { transform: translateY(-8px); }
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

        .cherry-blossom {
            position: absolute;
            width: 30px;
            height: 30px;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMj000MC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48ZyBmaWxsPSIjZmY3ZWI4Ij48cGF0aCBkPSJNNTAgMTBjLTIyIDAtNDAgMTgtNDAgNDBzMTggNDAgNDAgNDAgNDAtMTggNDAtNDAtMTgtNDAtNDAtNDB6bTAgODFhOSA5IDAgMCAxIDAgMCAwIDkgOSAwIDAgMCAwIDB6Ii8+PHBhdGggZD0iTTIwIDEwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDE4IDAgMiAyIDAgMCAwLTIgMiA5IDkgMCAwIDEtMTggMHoiLz48cGF0aCBkPSJNNjAgMTBhMiAyIDAgMCAwLTItMmE5IDkgMCAwIDEgMCAxOCAyIDIgMCAwIDAgMiAyIDkgOSAwIDAgMSAwLTE4eiIvPjxwYXRoIGQ9Ik0yMCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAxOCAwIDIgMiAwIDAgMC0yIDKgOSA5IDAgMCAxLTE4IDB6Ii8+PHBhdGggZD0iTTYwIDYwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDAgMTggMiAyIDAgMCAwIDIgMiA5IDkgMCAwIDEgMC0xOHoiLz48L2c+PC9zdmc+');
            background-size: cover;
            animation: blossom-fall 15s linear infinite;
        }

        .product-card {
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            background: white;
            border-radius: 15px;
            border: 2px solid #fbd8da;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }



        .header-content {
            background: linear-gradient(145deg, #E55458, #f2d5bb);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(233, 87, 110, 0.3);
            border: 2px solid #ffd1e3;
        }

        .sakura-divider {
            height: 3px;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSI1cHgiIHZpZXdCb3g9IjAgMCAxMDAgNSI+PHBhdGggZmlsbD0iI2ZmN2ViOCIgZD0iTTAgMCBMNTAgNSBMIDEwMCAwIFoiLz48L3N2Zz4=');
            background-size: cover;
        }

        .nekotag {
            background: linear-gradient(90deg, #E55458, #F29966);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            font-weight: 800;
            font-size: 45px;
        }



        .filter-btn {
            transition: all 0.3s ease;
            padding: 8px 16px;
            border-radius: 20px;
            background: #f2d5bb;
            color: #E55458;
            font-weight: 600;
        }

        .filter-btn.active {
            background: #E55458;
            color: white;
        }

        .alphabet-link {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            font-weight: 700;
            background: white;
            transition: all 0.3s ease;
        }

        .alphabet-link.active, .alphabet-link:hover {
            background: #E55458;
            color: white;
            transform: translateY(-3px);
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
        .text-sm{
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }
        .text-2xl{
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
                    <i class="fas fa-paw text-white text-lg"></i>
                </div>
                <img src="frontend/images/logo_nekopop.jpg"
                     alt="NekoPop Logo"
                     style="width: 120px; height: 120px;"
                     class="rounded-full border-4 border-white shadow-lg">
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold "> <span class="nekotag">NekoPop Shop</span></h1>
                <p class= "text-sm text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;"> Manga & Action Figure</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab active"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>
    </div>

    <!-- Catalog Header -->
    <div class="header-content p-6 mb-8 relative">
        <div class="absolute -top-2 right-4 flex gap-2">
            <div class="w-3 h-3 rounded-full bg-nekopink"></div>
            <div class="w-3 h-3 rounded-full bg-kawaililac"></div>
            <div class="w-3 h-3 rounded-full bg-nekopeach"></div>
        </div>

        <div class="text-center">
            <h2 class= "text-2xl font-bold text-white mb-2"> Esplora il Nostro Catalogo</h2>
            <p class="text-white/90">Scopri la nostra vasta selezione di manga e volumi a prezzi incredibili</p>
        </div>
    </div>

    <!-- Search and Filter Section -->
    <div class="bg-white rounded-2xl border-2 border-nekopink p-6 mb-8">
        <!-- Search Section -->
        <div class="search-section mb-6 relative">
            <form id="searchForm" method="GET" action="getcatalog" class="relative">
                <input type="text"
                       class="w-full p-4 pl-12 pr-6 rounded-full border-2 border-nekopink focus:border-nekopeach focus:outline-none"
                       name="serch"
                       placeholder="Cerca manga per nome...">
                <i class="fas fa-search absolute left-4 top-1/2 transform -translate-y-1/2 text-nekopeach"></i>
                <input type="hidden" name="filter" id="filterInput" value="">
                <input type="hidden" name="page" id="pageInput" value="0">
            </form>
        </div>

        <!-- Filter Section -->
        <div class="filter-section flex flex-wrap gap-2 mb-6">
            <button class="filter-btn active" onclick="setFilter('')">
                <i class="fas fa-layer-group mr-2"></i> Tutti
            </button>
            <button class="filter-btn" onclick="setFilter('volumi')">
                <i class="fas fa-book-open mr-2"></i> Volumi
            </button>
            <button class="filter-btn" onclick="setFilter('action figure')">
                <i class="fas fa-dragon mr-2"></i> Action Figure
            </button>
            <button class="filter-btn" onclick="setFilter('nome')">
                <i class="fas fa-sort-alpha-down mr-2"></i> Per Nome
            </button>
        </div>

        <!-- Alphabet Navigation -->
        <div class="alphabet-nav flex flex-wrap gap-2">
            <a href="#" class="alphabet-link active">Tutti</a>
            <a href="#" class="alphabet-link">A</a>
            <a href="#" class="alphabet-link">B</a>
            <a href="#" class="alphabet-link">C</a>
            <a href="#" class="alphabet-link">D</a>
            <a href="#" class="alphabet-link">E</a>
            <a href="#" class="alphabet-link">F</a>
            <a href="#" class="alphabet-link">G</a>
            <a href="#" class="alphabet-link">H</a>
            <a href="#" class="alphabet-link">I</a>
            <a href="#" class="alphabet-link">J</a>
            <a href="#" class="alphabet-link">K</a>
            <a href="#" class="alphabet-link">L</a>
            <a href="#" class="alphabet-link">M</a>
            <a href="#" class="alphabet-link">N</a>
            <a href="#" class="alphabet-link">O</a>
            <a href="#" class="alphabet-link">P</a>
            <a href="#" class="alphabet-link">Q</a>
            <a href="#" class="alphabet-link">R</a>
            <a href="#" class="alphabet-link">S</a>
            <a href="#" class="alphabet-link">T</a>
            <a href="#" class="alphabet-link">U</a>
            <a href="#" class="alphabet-link">V</a>
            <a href="#" class="alphabet-link">W</a>
            <a href="#" class="alphabet-link">X</a>
            <a href="#" class="alphabet-link">Y</a>
            <a href="#" class="alphabet-link">Z</a>
        </div>
    </div>

    <!-- Manga Sections -->
    <!-- Manga Series Section -->
    <div class="bg-white rounded-2xl border-2 border-nekoorange p-6 mb-8">
        <div class="flex items-center mb-6">
            <div class="w-10 h-10 rounded-full bg-nekopeach flex items-center justify-center mr-3">
                <i class= "fas fa-layer-group text-white"></i>
            </div>
            <h2 class= "text-2xl font-bold text-nekopeach"> Serie di Manga</h2>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Manga Item 1 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/71FQ9+Y2KRL._AC_UF1000,1000_QL80_.jpg"
                         alt="Attack on Titan"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Attack on Titan</h3>
                    <p class="text-gray-600 text-lg mt-2">Essere divorati vivi: per l'umanit&agrave &egrave il destino pi&ugrave crudele.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">&#8364 24.99</span>
                        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">Completo</span>
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">34 volumi</span>
                    </div>
                </div>
            </div>

            <!-- Manga Item 2 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/91QYVKf0K6L._AC_UF1000,1000_QL80_.jpg"
                         alt="Naruto"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Naruto</h3>
                    <p class="text-gray-600 text-lg mt-2">La storia del ninja dai capelli biondi che vuole diventare Hokage.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">Disponibile</span>
                        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">72 volumi</span>
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">Disponibili</span>
                    </div>
                </div>
            </div>

            <!-- Manga Item 3 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/91LiEf8M9kL._AC_UF1000,1000_QL80_.jpg"
                         alt="One Piece"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">One Piece</h3>
                    <p class="text-gray-600 text-lg mt-2">La leggendaria ricerca del tesoro pi&ugrave grande del mondo.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">Disponibile</span>
                        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">103+ volumi</span>
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">In corso</span>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="bg-white rounded-2xl border-2 border-nekoorange p-6 mb-8">
        <div class="flex items-center mb-6">
            <div class="w-10 h-10 rounded-full bg-nekopeach flex items-center justify-center mr-3">
                <i class= "fas fa-layer-group text-white"></i>
            </div>
            <h2 class= "text-2xl font-bold text-nekopeach"> Le nostre Action Figure</h2>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Action Figure Item 1 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/71FQ9+Y2KRL._AC_UF1000,1000_QL80_.jpg"
                         alt="Nana"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Komatsu Nana & Osaki Nana Action Girl Figure</h3>
                    <p class="text-gray-600 text-lg mt-2">Action figure in PVC delle due protagonoste pi&ugrave amate dei racconti di Ai Yazawa.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">&#8364 24.99</span>
                        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">Completo</span>

                    </div>
                </div>
            </div>

            <!-- Action Figure Item 2 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/91QYVKf0K6L._AC_UF1000,1000_QL80_.jpg"
                         alt="Naruto"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Naruto Shippuden naruto Uzumaki</h3>
                    <p class="text-gray-600 text-lg mt-2">La storia del ninja dai capelli biondi che vuole diventare Hokage, ora reso action figure da collezionare.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">Disponibile</span>
                        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">Disponibili</span>
                    </div>
                </div>
            </div>

            <!-- Action Figure Item 3 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/91LiEf8M9kL._AC_UF1000,1000_QL80_.jpg"
                         alt="One Piece"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800"> Megahouse One Piece Luffy Taro VAH</h3>
                    <p class="text-gray-600 text-lg mt-2">Il mitico Luffy alla leggendaria ricerca del tesoro pi&ugrave ambito dai pirati ora disponibile in action figure nella sua versione Taro dalla omonima saga.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">Disponibile</span>
                        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">Ultimi pezzi</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Volumes Section -->
    <div class="bg-white rounded-2xl border-2 border-nekopeach p-6 mb-8">
        <div class="flex items-center mb-6">
            <div class="w-10 h-10 rounded-full bg-nekopeach flex items-center justify-center mr-3">
                <i class="fas fa-book-open text-white"></i>
            </div>
            <h2 class="text-2xl font-bold text-nekopeach">Volumi disponibili</h2>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Volume Item 1 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/71k9Z7gVzGL._AC_UF1000,1000_QL80_.jpg"
                         alt="Demon Slayer"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                    <div class="absolute top-2 right-2 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">-15%</div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Demon Slayer Vol.8</h3>
                    <p class="text-gray-600 text-lg mt-2">La battaglia contro i demoni continua con azione mozzafiato!</p>
                    <div class="mt-4 flex justify-between items-center">
                        <div>
                            <span class="text-gray-400 line-through text-sm mr-2">&#8364 7.99</span>
                            <span class="text-nekopeach font-bold">&#8364 6.79</span>
                        </div>
                        <button class="bg-nekopeach hover:bg-nekored text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-cart-plus mr-1"></i> Acquista
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">Disponibile</span>
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">Spedizione rapida</span>
                    </div>
                </div>
            </div>

            <!-- Volume Item 2 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/81nP5-xT7EL._AC_UF1000,1000_QL80_.jpg"
                         alt="Death Note"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Death Note Vol.1</h3>
                    <p class="text-gray-600 text-lg mt-2">Light Yagami trova un quaderno che pu&ograve uccidere chiunque.</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">&#8364 7.99</span>
                        <button class="bg-nekopeach hover:bg-nekored text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-cart-plus mr-1"></i> Acquista
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">12+</span>
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">Spedizione rapida</span>
                    </div>
                </div>
            </div>

            <!-- Volume Item 3 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/91BYoDpJ4kL._AC_UF1000,1000_QL80_.jpg"
                         alt="My Hero Academia"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                    <div class="absolute top-2 right-2 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">NEW!</div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">My Hero Academia Vol.32</h3>
                    <p class="text-gray-600 text-lg mt-2">La nuova sfida della Classe 1-A contro gli eroi professionisti!</p>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">&#8364 8.99</span>
                        <button class="bg-nekopeach hover:bg-nekored text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-cart-plus mr-1"></i> Acquista
                        </button>
                    </div>
                    <div class="mt-2 flex items-center text-xs">
                        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">Novit&agrave</span>
                        <span class="bg-nekopeach text-white px-2 py-1 rounded-md">Spedizione rapida</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pagination -->
    <div class="flex justify-center gap-4">
        <button class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
            <i class="fas fa-arrow-left mr-2"></i> Precedente
        </button>
        <div class="flex items-center gap-2">
            <a href="#" class="w-10 h-10 bg-nekopeach text-white rounded-full flex items-center justify-center font-bold">1</a>
            <a href="#" class="w-10 h-10 bg-white text-nekopeach rounded-full flex items-center justify-center font-bold hover:bg-nekopink hover:text-white transition">2</a>
            <a href="#" class="w-10 h-10 bg-white text-nekopeach rounded-full flex items-center justify-center font-bold hover:bg-nekopink hover:text-white transition">3</a>
            <span class="text-nekopeach">...</span>
            <a href="#" class="w-10 h-10 bg-white text-nekopeach rounded-full flex items-center justify-center font-bold hover:bg-nekopink hover:text-white transition">10</a>
        </div>
        <button class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
            Successivo <i class="fas fa-arrow-right ml-2"></i>
        </button>
    </div>

    <!-- Promo Banner -->
    <div class="mt-12 bg-gradient-to-r from-nekopink to-nekopeach rounded-2xl p-6 md:p-8 relative overflow-hidden">
        <div class="absolute top-0 left-0 right-0 bottom-0 opacity-10">
            <div class="absolute top-10 left-10 w-32 h-32 rounded-full bg-white animate-ping"></div>
            <div class="absolute bottom-10 right-10 w-24 h-24 rounded-full bg-white animate-ping"></div>
        </div>
        <div class="relative z-10 flex flex-col md:flex-row items-center gap-6">
            <div class="flex-shrink-0">
                <div class="w-32 h-32 rounded-xl overflow-hidden border-4 border-white">
                    <img src="https://images.unsplash.com/photo-1608889825103-eb5c0e8dc9d9?q=80&w=1000"
                         alt="Special Offer"
                         class="w-full h-full object-cover">
                </div>
            </div>
            <div class="text-center md:text-left">
                <h3 class="text-2xl font-bold text-white mb-2"> Offerta Speciale</h3>
                <p class="text-white/90">Ottieni il 15% di sconto sui manga completi con il codice: <span class="font-bold">NEKO15</span></p>
                <button class="mt-4 bg-white text-nekopeach px-6 py-2 rounded-full font-bold hover:bg-pink-50 transition">
                    <i class="fas fa-tag mr-2"></i> Usa Codice
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Fixed chat button -->
<div class="fixed bottom-6 right-6 w-16 h-16 bg-gradient-to-br from-nekopink to-nekopeach rounded-full flex items-center justify-center shadow-xl z-50">
    <i class="fas fa-comment-alt text-white text-lg"></i>
    <div class="absolute top-0 right-0 w-4 h-4 bg-red-500 rounded-full border-2 border-white animate-pulse"></div>
</div>

<script>
    // Funzione per impostare il filtro e inviare il form
    function setFilter(filter) {
        document.getElementById('filterInput').value = filter;
        document.getElementById('pageInput').value = 0;
        document.getElementById('searchForm').submit();

        // Update active state for filter buttons
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.classList.remove('active');
        });
        event.target.classList.add('active');
    }

    // Generate floating cherry blossoms and cat decorations
    function generateDecorations() {
        const decorationsContainer = document.getElementById('decorations');
        const viewportWidth = window.innerWidth;
        const viewportHeight = window.innerHeight;

        // Generate cherry blossom decorations
        for (let i = 0; i < 25; i++) {
            const blossom = document.createElement('div');
            blossom.className = 'cherry-blossom';
            blossom.style.left = `${Math.random() * viewportWidth}px`;
            blossom.style.animationDelay = `${Math.random() * 15}s`;
            blossom.style.opacity = `0.${Math.floor(2 + Math.random() * 7)}`;
            blossom.style.transform = `scale(${0.5 + Math.random()})`;
            decorationsContainer.appendChild(blossom);
        }
    }

    // Initialize when page loads
    document.addEventListener('DOMContentLoaded', function() {
        generateDecorations();

        // Filter button active state
        document.querySelectorAll('.folder-tab').forEach(tab => {
            tab.addEventListener('click', function() {
                document.querySelectorAll('.folder-tab').forEach(t => t.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // Alphabet navigation active state
        document.querySelectorAll('.alphabet-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                document.querySelectorAll('.alphabet-link').forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // Search form submission
        document.querySelector('.search-bar').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('pageInput').value = 0;
                document.getElementById('searchForm').submit();
            }
        });
    });
</script>
</body>
</html>