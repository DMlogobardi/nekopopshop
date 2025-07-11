<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Dettaglio Prodotto</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/catalog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/specificheprod_Dainamic.js" defer></script>
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

    <!-- Product Detail Section -->
    <div class="bg-white rounded-2xl border-2 border-nekopink p-6 mb-8">
        <!-- Back Button -->
        <a href="catalog.jsp" class="inline-block mb-6 text-nekopeach hover:text-nekored transition">
            <i class="fas fa-arrow-left mr-2"></i> Torna al catalogo
        </a>

        <div class="flex flex-col lg:flex-row gap-8">
            <!-- Product Images (Left) -->
            <div class="w-full lg:w-1/2">
                <!-- Main Image -->
                <div class="relative h-96 overflow-hidden rounded-xl mb-4 border-2 border-nekopink bg-white p-4">
                    <img id="img" src=""
                         alt="NF"
                         class="w-full h-full object-contain transition-transform duration-300 hover:scale-105">
                    <div class="absolute top-2 right-2 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">-5%</div>
                </div>
            </div>

            <!-- Product Info (Right) -->
            <div class="w-full lg:w-1/2">
                <div class="flex items-center mb-2">
                    <h2 id="title" class="text-3xl font-bold text-gray-800">NF</h2>
                    <span id="tag" class="ml-4 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">NF</span>
                </div>

                <div class="mb-6">
                    <p id="descrizione" class="text-gray-800 text-lg">NF</p>
                </div>

                <div class="bg-nekopink/20 rounded-xl p-4 mb-6">
                    <div class="flex items-center mb-2">
                        <span id="prezzo+" class="text-gray-400 line-through text-lg mr-3">NF</span>
                        <span id="prezzo" class="text-nekopeach font-bold text-2xl">€NF</span>
                        <span class="ml-3 bg-nekopeach text-white px-2 py-1 rounded-md text-xs font-bold">5%</span>
                    </div>
                    <p id="risparmio" class="text-nekopeach font-bold text-sm">NF</p>
                </div>

                <div class="mb-6">
                    <div class="flex items-center mb-2">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-gray-800">Disponibilità: <span id="disponibilità" class="font-bold text-nekopeach">NF</span></span>
                    </div>
                    <div class="flex items-center mb-2">
                        <i class="fas fa-truck text-nekopeach mr-2"></i>
                        <span class="text-gray-800">Consegna stimata: <span class="font-bold">2-3 giorni lavorativi</span></span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-shield-alt text-nekopeach mr-2"></i>
                        <span class="text-gray-800">Garanzia: <span class="font-bold">Reso gratuito entro 30 giorni</span></span>
                    </div>
                </div>

                <!-- Quantity Selector -->
                <div class="flex items-center mb-6">
                    <span class="text-gray-800 font-bold mr-4">Quantità:</span>
                    <div class="flex items-center border-2 border-nekopink rounded-full overflow-hidden">
                        <button class="bg-nekopink text-white px-3 py-1 hover:bg-nekopeach transition" onclick="decreaseQuantity()">
                            <i class="fas fa-minus"></i>
                        </button>
                        <input type="number" id="quantity" value="1" min="1" max="10"
                               class="w-12 text-center border-none focus:outline-none">
                        <button class="bg-nekopink text-white px-3 py-1 hover:bg-nekopeach transition" onclick="increaseQuantity()">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex flex-col sm:flex-row gap-4 mb-6">
                    <button class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center justify-center transition flex-1"
                            onclick="addToCart()">
                        <i class="fas fa-cart-plus mr-2"></i> Aggiungi al Carrello
                    </button>
                    <button onclick="addToWhisList()" class="bg-white border-2 border-nekopeach text-nekopeach hover:bg-nekopink/20 px-6 py-3 rounded-full font-bold flex items-center justify-center transition flex-1">
                        <i class="fas fa-heart mr-2"></i> Lista Desideri
                    </button>
                </div>

                <!-- Product Details -->
                <div class="border-t border-gray-200 pt-4">
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Dettagli prodotto</h3>
                    <div class="grid grid-cols-2 gap-2 text-sm">
                        <div class="text-gray-600">Autore:</div>
                        <div id="autore" class="font-medium">NF</div>

                        <div class="text-gray-600">Lingua:</div>
                        <div class="font-medium">Italiano</div>

                        <div class="text-gray-600">Data pubblicazione:</div>
                        <div id="dataPub" class="font-medium">NF</div>
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
    </footer>

</body>
</html>