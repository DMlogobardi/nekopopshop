<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Il tuo negozio kawaii di manga e action figure</title>
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
                        nekored: '#f24535'
                    }
                }
            }
        }
    </script>
    <style>
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

        .cat-elements i {
            color: #fbd8da;
            animation: float 4s infinite ease-in-out;
        }

        .cherry-blossom {
            position: absolute;
            width: 30px;
            height: 30px;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48ZyBmaWxsPSIjZmY3ZWI4Ij48cGF0aCBkPSJNNTAgMTBjLTIyIDAtNDAgMTgtNDAgNDBzMTggNDAgNDAgNDAgNDAtMTggNDAtNDAtMTgtNDAtNDAtNDB6bTAgODFhOSA5IDAgMCAxIDAgMCAwIDkgOSAwIDAgMCAwIDB6Ii8+PHBhdGggZD0iTTIwIDEwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDE4IDAgMiAyIDAgMCAwLTIgMiA5IDkgMCAwIDEtMTggMHoiLz48cGF0aCBkPSJNNjAgMTBhMiAyIDAgMCAwLTItMmE5IDkgMCAwIDEgMCAxOCAyIDIgMCAwIDAgMiAyIDkgOSAwIDAgMSAwLTE4eiIvPjxwYXRoIGQ9Ik0yMCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAxOCAwIDIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxLTE4IDB6Ii8+PHBhdGggZD0iTTYwIDYwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDAgMTggMiAyIDAgMCAwIDIgMiA5IDkgMCAwIDEgMC0xOHoiLz48L2c+PC9zdmc+');
            background-size: cover;
            animation: blossom-fall 15s linear infinite;
        }

        .product-card {
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px #E55458;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px #E55458;
        }

        .product-card::after {
            content: 'NekoPop';
            position: absolute;
            top: 10px;
            right: -35px;
            background: #E55458;
            color: #f2d5bb;
            padding: 3px 35px;
            transform: rotate(45deg);
            font-size: 0.8rem;
            font-weight: bold;
        }

        .header-content {
            background: linear-gradient(145deg, #E55458, #f2d5bb);
            border-radius: 20px;
            box-shadow: 0 10px 25px #E55458;
            border: 2px solid #ffd1e3;
        }

        .sakura-divider {
            height: 3px;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSI1cHgiIHZpZXdCb3g9IjAgMCAxMDAgNSI+PHBhdGggZmlsbD0iI2ZmN2ViOCIgZD0iTTAgMCBMNTAgNSBMIDEwMCAwIFoiLz48L3N2Zz4=');
            background-size: cover;
        }

        .nekotag {
            background: linear-gradient(90deg, #E55458, #f2d5bb);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            font-weight: 800;
        }

        .nekotag::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, #E55458, #f2d5bb);
            border-radius: 10px;
        }
    </style>
</head>
<body class="relative overflow-x-hidden">
<!-- Decorative cat elements and cherry blossoms -->
<div id="decorations"></div>

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-kawaililac z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-paw text-white text-xl"></i>
                </div>
                <img src="${pageContext.request.contextPath}/frontend/images/logo_nekopop.jpg"
                     alt="NekoPop Logo"
                     style="width: 120px; height: 120px;"
                     class="rounded-full border-4 border-white shadow-lg">
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold mb-4"><span class="nekotag">NekoPop Shop</span></h1>
                <p class="text-sm text-nekopeach font-bold">Manga & Action Figure</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab active"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="admin.jsp" class="folder-tab"><i class="fas fa-user-shield mr-2"></i> Admin</a>
                <a href="profile.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>
    </div>

    <!-- Sponsor Section -->
    <div class="flex flex-wrap gap-4 mb-8">
        <!-- Sponsor Banner -->
        <div class="header-content p-6 w-full md:w-2/3 relative">
            <div class="absolute -top-2 right-4 flex gap-2">
                <div class="w-3 h-3 rounded-full bg-nekopink"></div>
                <div class="w-3 h-3 rounded-full bg-nekopurple"></div>
                <div class="w-3 h-3 rounded-full bg-kawaililac"></div>
            </div>

            <div class="flex flex-col md:flex-row items-center gap-4">
                <div class="bg-kawaililac rounded-xl px-4 py-2 flex items-center">
                    <i class="fas fa-star text-yellow-400 text-3xl mr-3"></i>
                    <div>
                        <h3 class="font-bold text-white text-lg">Offerta del giorno!</h3>
                        <p class="text-white text-xs">Sconti fino al 30%</p>
                    </div>
                </div>

                <div class="md:flex-1 flex flex-col md:flex-row items-center gap-4">
                    <div class="bg-gradient-to-r from-nekopink to-nekopurple w-24 h-24 rounded-xl p-1">
                        <div class="bg-white w-full h-full rounded-lg overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1615800000134-d3a9c1b1a7f0?q=80&w=1000"
                                 alt="Demon Slayer"
                                 class="w-full h-full object-cover">
                        </div>
                    </div>

                    <div class="text-center md:text-left">
                        <h3 class="font-bold text-xl text-nekopurple mb-1">Demon Slayer Vol. 1-10</h3>
                        <div class="flex justify-center md:justify-start items-center gap-1">
                            <p class="text-gray-500 line-through text-sm">&#8364 6,50</p>
                            <p class="text-2xl font-bold text-nekopink">&#8364 5,00</p>
                        </div>
                        <div class="mt-2 flex gap-2 justify-center md:justify-start">
                            <span class="bg-kawaiblue px-2 py-1 rounded-lg text-white text-xs">Limited Edition</span>
                            <span class="bg-nekopink px-2 py-1 rounded-lg text-white text-xs">-30%</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4 flex justify-between items-center">
                <p class="text-white text-sm">Offerta valida fino al 31/12/2023</p>
                <button class="bg-nekopurple hover:bg-nekopink text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
                    <i class="fas fa-gift mr-2"></i> Approfitta ora
                </button>
            </div>
        </div>

        <!-- Special Offer -->
        <div class="header-content p-6 w-full md:w-1/3 relative overflow-hidden">
            <div class="absolute top-0 left-0 right-0 bottom-0 z-0">
                <div class="absolute top-2 left-2 w-8 h-8 rounded-full bg-nekopink opacity-20 animate-ping"></div>
                <div class="absolute top-8 right-4 w-6 h-6 rounded-full bg-kawaiblue opacity-20 animate-ping"></div>
                <div class="absolute bottom-4 left-10 w-10 h-10 rounded-full bg-nekopurple opacity-20 animate-ping"></div>
            </div>

            <div class="relative z-10 flex flex-col items-center justify-center h-full">
                <div class="bg-gradient-to-br from-nekopeach to-nekoorange rounded-full w-20 h-20 flex items-center justify-center">
                    <i class="fas fa-headset text-4xl text-white"></i>
                </div>

                <h3 class="text-xl font-bold text-center text-white mt-4">Supporto Premium</h3>
                <p class="text-center text-gray-600 text-sm mt-2">Iscriviti oggi e ricevi un action figure in omaggio!</p>

                <button class="bg-nekopeach hover:bg-nekopurple text-white px-4 py-2 rounded-lg mt-4 font-bold transition-all">
                    <i class="fas fa-crown mr-2"></i> Vantaggi Premium
                </button>
            </div>
        </div>
    </div>

    <div class="sakura-divider my-6"></div>

    <!-- Content Area -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- News Section -->
        <div class="lg:col-span-2">
            <div class="bg-white rounded-xl border-2 border-kawaiblue overflow-hidden">
                <div class="bg-gradient-to-r from-kawaiblue to-nekopurple p-4 flex items-center">
                    <i class="fas fa-newspaper text-white text-2xl mr-3"></i>
                    <h2 class="text-xl font-bold text-nekopeach">Ultime Novit&agrave</h2>
                    <div class="ml-auto flex">
                        <i class="fas fa-cat text-white text-xl mr-2 animate-bounce"></i>
                        <i class="fas fa-cat text-white text-xl"></i>
                    </div>
                </div>

                <div class="p-6 space-y-6">
                    <!-- News item -->
                    <div class="flex items-start border-b border-gray-100 pb-6">
                        <div class="mr-4 flex-shrink-0">
                            <div class="bg-nekopeach w-14 h-14 rounded-xl flex items-center justify-center">
                                <i class="fas fa-truck text-white text-2xl"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="font-bold text-lg text-nekopurple mb-2">Consegna Espressa!</h3>
                            <p class="text-gray-600">Nuovo servizio di consegna in giornata per tutta la città di Milano! Dai un'occhiata alla nostra sezione informazioni.</p>
                            <div class="mt-3 flex items-center">
                                <span class="bg-nekopeach text-white px-2 py-1 rounded-md text-xs">Esclusiva</span>
                                <span class="ml-3 text-xs text-gray-400"><i class="far fa-clock mr-1"></i> 2 giorni fa</span>
                            </div>
                        </div>
                    </div>

                    <!-- News item -->
                    <div class="flex items-start border-b border-gray-100 pb-6">
                        <div class="mr-4 flex-shrink-0">
                            <div class="bg-nekopeach w-14 h-14 rounded-xl flex items-center justify-center">
                                <i class="fas fa-gifts text-white text-2xl"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="font-bold text-lg text-nekopurple mb-2">Sconto Compleanno!</h3>
                            <p class="text-gray-600">Registra il tuo compleanno nel tuo profilo e ricevi un coupon del 15% da utilizzare nel tuo mese speciale!</p>
                            <div class="mt-3 flex items-center">
                                <span class="bg-nekopeach text-white px-2 py-1 rounded-md text-xs">Omaggio</span>
                                <span class="ml-3 text-xs text-gray-400"><i class="far fa-clock mr-1"></i> 5 giorni fa</span>
                            </div>
                        </div>
                    </div>

                    <!-- News item -->
                    <div class="flex items-start">
                        <div class="mr-4 flex-shrink-0">
                            <div class="bg-nekopeach w-14 h-14 rounded-xl flex items-center justify-center">
                                <i class="fas fa-calendar-alt text-white text-2xl"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="font-bold text-lg text-nekopurple mb-2">Sakura Festival</h3>
                            <p class="text-gray-600">Festeggia con noi il Sakura Festival nel nostro negozio di Milano con sconti esclusivi su manga giapponesi e art book!</p>
                            <div class="mt-3 flex items-center">
                                <span class="bg-nekopeach text-white px-2 py-1 rounded-md text-xs">Evento</span>
                                <span class="ml-3 text-xs text-gray-400"><i class="far fa-clock mr-1"></i> 1 settimana fa</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Weekly Featured -->
            <div class="bg-white rounded-xl border-2 border-nekopeach mt-6 overflow-hidden">
                <div class="bg-gradient-to-r from-nekopink to-nekopeach p-4">
                    <h2 class="text-xl font-bold text-nekopeach flex items-center">
                        <i class="fas fa-crown mr-3"></i> Selezione della Settimana
                    </h2>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 p-4">
                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaililac relative">
                        <div class="relative h-48 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=1000"
                                 alt="Chainsaw Man"
                                 class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                        </div>
                        <div class="p-4">
                            <h3 class="font-bold text-gray-800">Chainsaw Man Vol.1</h3>
                            <p class="text-gray-600 text-sm mt-1">Denji è un ragazzo semplice con un sogno semplice...</p>
                            <div class="flex justify-between items-center mt-4">
                                <span class="text-nekopink font-bold">&#8364 12,99</span>
                                <button class="bg-nekopurple hover:bg-nekopink text-white py-2 px-4 rounded-lg text-sm transition">
                                    <i class="fas fa-cart-plus mr-1"></i> Aggiungi
                                </button>
                            </div>
                        </div>
                        <div class="absolute top-2 left-2 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">POP!</div>
                    </div>

                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaiblue relative">
                        <div class="relative h-48 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1558494948-4ece8de63a5f?q=80&w=1000"
                                 alt="Berserk"
                                 class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                        </div>
                        <div class="p-4">
                            <h3 class="font-bold text-gray-800">Berserk Vol.2</h3>
                            <p class="text-gray-600 text-sm mt-1">L'epico dark fantasy che ha ispirato una generazione...</p>
                            <div class="flex justify-between items-center mt-4">
                                <span class="text-nekopink font-bold">&#8364 14,99</span>
                                <button class="bg-kawaiblue hover:bg-nekopink text-white py-2 px-4 rounded-lg text-sm transition">
                                    <i class="fas fa-cart-plus mr-1"></i> Aggiungi
                                </button>
                            </div>
                        </div>
                        <div class="absolute top-2 left-2 bg-nekopurple text-white px-2 py-1 rounded-md text-xs font-bold">NEW!</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Featured Manga -->
        <div class="lg:col-span-1">
            <div class="bg-white rounded-xl border-2 border-nekopurple overflow-hidden h-full">
                <div class="bg-gradient-to-r from-nekopink to-nekoorange p-4">
                    <h2 class="text-xl font-bold text-nekopeach flex items-center">
                        <i class="fas fa-fire mr-3"></i> Pi&#249 Acquistati
                    </h2>
                </div>

                <div class="p-4 space-y-4">
                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-nekopink relative">
                        <div class="p-4 flex">
                            <div class="w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
                                <img src="https://images.unsplash.com/photo-1618331835717-801a9767105a?q=80&w=1000"
                                     alt="My Hero Academia"
                                     class="w-full h-full object-cover">
                            </div>

                            <div class="ml-4 flex flex-col justify-center">
                                <h3 class="font-bold text-gray-800">My Hero Academia Vol.30</h3>
                                <p class="text-gray-600 text-xs mt-1">Midoriya continua la sua formazione per diventare...</p>
                                <div class="mt-2 flex justify-between items-center">
                                    <span class="text-nekopink font-bold">&#8364 10,99</span>
                                    <div class="flex items-center">
                                        <i class="fas fa-star text-yellow-400 text-sm"></i>
                                        <span class="ml-1 text-xs text-gray-600">4.9</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="absolute -bottom-4 -right-4 w-12 h-12 rounded-full bg-nekopink text-white flex items-center justify-center text-xl">
                            <i class="fas fa-1"></i>
                        </div>
                    </div>

                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaiblue relative">
                        <div class="p-4 flex">
                            <div class="w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
                                <img src="https://images.unsplash.com/photo-1619546813926-a0e32086d239?q=80&w=1000"
                                     alt="One Piece"
                                     class="w-full h-full object-cover">
                            </div>

                            <div class="ml-4 flex flex-col justify-center">
                                <h3 class="font-bold text-gray-800">One Piece Vol.102</h3>
                                <p class="text-gray-600 text-xs mt-1">Le nuove avventure di Rufy e la sua ciurma...</p>
                                <div class="mt-2 flex justify-between items-center">
                                    <span class="text-nekopink font-bold">&#8364 11,49</span>
                                    <div class="flex items-center">
                                        <i class="fas fa-star text-yellow-400 text-sm"></i>
                                        <span class="ml-1 text-xs text-gray-600">4.8</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="absolute -bottom-4 -right-4 w-12 h-12 rounded-full bg-kawaiblue text-white flex items-center justify-center text-xl">
                            <i class="fas fa-2"></i>
                        </div>
                    </div>

                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaililac relative">
                        <div class="p-4 flex">
                            <div class="w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
                                <img src="https://images.unsplash.com/photo-1592400374401-4f48e6e57b1f?q=80&w=1000"
                                     alt="Jujutsu Kaisen"
                                     class="w-full h-full object-cover">
                            </div>

                            <div class="ml-4 flex flex-col justify-center">
                                <h3 class="font-bold text-gray-800">Jujutsu Kaisen Vol.19</h3>
                                <p class="text-gray-600 text-xs mt-1">La battaglia contro i maledetti continua...</p>
                                <div class="mt-2 flex justify-between items-center">
                                    <span class="text-nekopink font-bold">&#8364 10,99</span>
                                    <div class="flex items-center">
                                        <i class="fas fa-star text-yellow-400 text-sm"></i>
                                        <span class="ml-1 text-xs text-gray-600">4.7</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="absolute -bottom-4 -right-4 w-12 h-12 rounded-full bg-nekopurple text-white flex items-center justify-center text-xl">
                            <i class="fas fa-3"></i>
                        </div>
                    </div>

                    <a href="#" class="block mt-4 bg-nekopink hover:bg-nekopurple text-white text-center py-3 rounded-lg font-bold transition">
                        <i class="fas fa-arrow-right mr-2"></i> Vedi l'intera classifica
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Category Section -->
    <div class="mt-12">
        <h2 class="text-2xl font-bold text-center mb-8">
            <span class="nekotag">Esplora le Categorie</span>
        </h2>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <!-- Category -->
            <a href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopink text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-nekopink rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-user-ninja text-2xl text-nekopurple"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg">Shonen</h3>
                <p class="text-gray-600 mt-2 text-sm">Action e avventure epiche</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopurple text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-kawaiblue rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-heart text-2xl text-pink-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg">Shojo</h3>
                <p class="text-gray-600 mt-2 text-sm">Storie romantiche</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a href="#" class="bg-nekopink p-6 rounded-xl border-2 border-kawaiblue text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-nekopink rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-brain text-2xl text-blue-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg">Seinen</h3>
                <p class="text-gray-600 mt-2 text-sm">Per lettori maturi</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a href="#" class="bg-nekopink p-6 rounded-xl border-2 border-kawaililac text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-nekopink rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-paw text-2xl text-green-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg">Kemono</h3>
                <p class="text-gray-600 mt-2 text-sm">Animali antropomorfi</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <!-- Special Offer Banner -->
    <div class="mt-12 rounded-2xl overflow-hidden relative">
        <div class="absolute inset-0 bg-gradient-to-r from-nekopink to-nekopeach z-0"></div>
        <div class="relative z-10 p-8 md:p-12 flex flex-col md:flex-row items-center">
            <div class="text-center md:text-left mb-6 md:mb-0">
                <h3 class="text-2xl md:text-3xl font-bold text-white">Action Figure Limited Edition!</h3>
                <p class="text-white mt-2 max-w-md">Collezione esclusiva di figure da collezione con effetti luminosi e dettagli premium!</p>
                <button class="mt-4 bg-white text-nekopeach px-6 py-3 rounded-full font-bold hover:bg-pink-50 transition">
                    <i class="fas fa-gifts mr-2"></i> Scopri le offerte
                </button>
            </div>

            <div class="md:ml-auto">
                <div class="relative">
                    <div class="absolute top-0 right-0 -mt-6 -mr-6 w-12 h-12 rounded-full bg-yellow-400 flex items-center justify-center">
                        <i class="fas fa-certificate text-white"></i>
                    </div>
                    <div class="w-64 h-64 rounded-2xl overflow-hidden border-4 border-white shadow-2xl">
                        <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=1000"
                             alt="Limited Edition Figure"
                             class="w-full h-full object-cover">
                    </div>
                    <div class="absolute -bottom-4 -left-4 bg-white text-nekoorange px-4 py-2 rounded-lg font-bold shadow-lg">
                        Exclusive!
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
                        <i class="fas fa-paw text-nekopink text-xl"></i>
                    </div>
                    <h4 class="font-bold text-xl ml-3">NekoPop Shop</h4>
                </div>
                <p class="text-pink-100">Il tuo negozio preferito per manga e action figure, fornito da appassionati per appassionati!</p>
            </div>

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg mb-4">Contatti</h4>
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
                <h4 class="font-bold text-lg mb-4">Link Utili</h4>
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
                <h4 class="font-bold text-lg mb-4">Iscriviti alla Newsletter</h4>
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
                    <i class="fab fa-cc-visa text-3xl"></i>
                    <i class="fab fa-cc-mastercard text-3xl"></i>
                    <i class="fab fa-cc-paypal text-3xl"></i>
                    <i class="fab fa-cc-apple-pay text-3xl"></i>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Fixed chat button -->
<div class="fixed bottom-6 right-6 w-16 h-16 bg-gradient-to-br from-nekopink to-nekopurple rounded-full flex items-center justify-center shadow-xl z-50">
    <i class="fas fa-comment-alt text-white text-2xl"></i>
    <div class="absolute top-0 right-0 w-4 h-4 bg-red-500 rounded-full border-2 border-white animate-pulse"></div>
</div>

<script>
    // Generate floating cherry blossoms and cat decorations
    function generateDecorations() {
        const decorationsContainer = document.getElementById('decorations');
        const viewportWidth = window.innerWidth;
        const viewportHeight = window.innerHeight;

        // Cat decorations
        const catEmojis = ['😺', '😸', '😹', '😻', '🙀', '🐱', '🐾'];

        // Generate cat emoji decorations
        for (let i = 0; i < 15; i++) {
            const cat = document.createElement('div');
            cat.className = 'cat-elements absolute z-0';
            cat.style.left = `${Math.random() * viewportWidth}px`;
            cat.style.top = `${Math.random() * viewportHeight}px`;
            cat.innerHTML = `<i>${catEmojis[Math.floor(Math.random() * catEmojis.length)]}</i>`;
            cat.style.fontSize = `${12 + Math.random() * 24}px`;
            cat.style.opacity = `0.${Math.floor(1 + Math.random() * 9)}`;
            cat.style.animationDuration = `${4 + Math.random() * 12}s`;
            cat.style.animationDelay = `${Math.random() * 5}s`;
            decorationsContainer.appendChild(cat);
        }

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

    // Generate decorations on page load
    document.addEventListener('DOMContentLoaded', generateDecorations);

    // Folder tab interaction
    document.querySelectorAll('.folder-tab').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelectorAll('.folder-tab').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });
</script>
</body>
</html>