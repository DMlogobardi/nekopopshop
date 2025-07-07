<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Catalogo Manga</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/catalog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/catalog_dainamic.js" defer></script>
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
        <jsp:include page="navBar.jsp" />
    </div>
    <jsp:include page="error.jsp" />

    <!-- Catalog Header -->
    <div class="header-content p-6 mb-8 relative">
        <div class="absolute -top-2 right-4 flex gap-2">
            <div class="w-3 h-3 rounded-full bg-nekopink"></div>
            <div class="w-3 h-3 rounded-full bg-kawaililac"></div>
            <div class="w-3 h-3 rounded-full bg-nekopeach"></div>
        </div>

        <div class="text-center">
            <h2 class= "text-2xl font-bold text-white mb-2" style="font-size: 30px"> Esplora il Nostro Catalogo</h2>
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
                       placeholder="Cerca nel catalogo...">
                <i class="fas fa-search absolute left-4 top-1/2 transform -translate-y-1/2 text-nekopeach"></i>
                <input type="hidden" name="filter" id="filterInput" value="">
                <input type="hidden" name="page" id="pageInput" value="0">
            </form>
        </div>

        <!-- Filter Section -->
        <div class="filter-section flex flex-wrap gap-2 mb-6">
            <button class="filter-btn active" onclick="setFilter('delete')">
                <i class="fas fa-layer-group mr-2"></i> Tutti
            </button>
            <button class="filter-btn" onclick="setFilter('nome')">
                <i class="fas fa-sort-alpha-down mr-2"></i> Per Nome
            </button>
            <button class="filter-btn" onclick="setFilter('autore')">
                <i class="fa fa-pencil mr-2"></i> Per Autore
            </button>
            <button class="filter-btn" onclick="setFilter('anno')">
                <i class="far fa-calendar-alt mr-2"></i> Per Anno
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
            <h2 class= "text-2xl font-bold text-nekopeach"> I nostri magnifici manga</h2>
        </div>

        <div id = "catalogo1" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

        </div>
    </div>

    <!-- Pagination -->
    <div class="flex justify-center gap-4 mb-8">
        <button id="prev-btn1" class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
            <i class="fas fa-arrow-left mr-2"></i> Precedente
        </button>

        <div id="pagination1" class="flex items-center gap-2">
            <!-- Pagine generate dinamicamente -->
        </div>

        <button id="next-btn1" class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
            Successivo <i class="fas fa-arrow-right ml-2"></i>
        </button>
    </div>

    <!-- action figure Series Section -->
    <div class="bg-white rounded-2xl border-2 border-nekoorange p-6 mb-8">
        <div class="flex items-center mb-6">
            <div class="w-10 h-10 rounded-full bg-nekopeach flex items-center justify-center mr-3">
                <i class= "fas fa-layer-group text-white"></i>
            </div>
            <h2 class= "text-2xl font-bold text-nekopeach"> Le nostre magnifiche action figure</h2>
        </div>

        <div id = "catalogo2" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

        </div>
    </div>

    <!-- Pagination -->
    <div class="flex justify-center gap-4">
        <button id="prev-btn2" class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
            <i class="fas fa-arrow-left mr-2"></i> Precedente
        </button>

        <div id="pagination2" class="flex items-center gap-2">
            <!-- Pagine generate dinamicamente -->
        </div>

        <button id="next-btn2" class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
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
                    <img src="${pageContext.request.contextPath}/frontend/images/sailormoon.jpg"
                         alt="Special Offer"
                         class="w-full h-full object-cover">
                </div>
            </div>
            <div class="text-center md:text-left">
                <h3 class="text-2xl font-bold text-white mb-2"> Offerta Speciale</h3>
                <p class="text-white/90">Ottieni il 15% di sconto sui manga completi con il codice: <span id="code" class="font-bold">NeKo_15_PoP_ShoP</span></p>
                <button id="code_Button" class="mt-4 bg-white text-nekopeach px-6 py-2 rounded-full font-bold hover:bg-pink-50 transition">
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

<!-- Footer -->
<footer class="mt-16 bg-gradient-to-b from-nekoorange to-nekopeach text-white pt-12 pb-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <!-- Footer section -->
            <div>
                <div class="flex items-center mb-4">
                    <div class="w-10 h-10 rounded-full bg-white flex items-center justify-center">
                        <i class="fas fa-paw text-nekopink text-lg"></i>
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
                    <i class="fab fa-cc-visa text-lg"></i>
                    <i class="fab fa-cc-mastercard text-lg"></i>
                    <i class="fab fa-cc-paypal text-lg"></i>
                    <i class="fab fa-cc-apple-pay text-lg"></i>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>