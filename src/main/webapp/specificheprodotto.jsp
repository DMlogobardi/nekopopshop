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
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>
    </div>

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
                    <img src="https://m.media-amazon.com/images/I/71k9Z7gVzGL._AC_UF1000,1000_QL80_.jpg"
                         alt="Demon Slayer Vol.8"
                         class="w-full h-full object-contain transition-transform duration-300 hover:scale-105">
                    <div class="absolute top-2 right-2 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">-15%</div>
                </div>

                <!-- Thumbnails -->
                <div class="flex gap-2">
                    <div class="w-20 h-20 rounded-md overflow-hidden border-2 border-nekopink cursor-pointer">
                        <img src="https://m.media-amazon.com/images/I/71k9Z7gVzGL._AC_UF1000,1000_QL80_.jpg"
                             alt="Demon Slayer Vol.8"
                             class="w-full h-full object-cover">
                    </div>
                    <div class="w-20 h-20 rounded-md overflow-hidden border-2 border-gray-200 cursor-pointer hover:border-nekopink">
                        <img src="https://m.media-amazon.com/images/I/81nP5-xT7EL._AC_UF1000,1000_QL80_.jpg"
                             alt="Demon Slayer Back"
                             class="w-full h-full object-cover">
                    </div>
                    <div class="w-20 h-20 rounded-md overflow-hidden border-2 border-gray-200 cursor-pointer hover:border-nekopink">
                        <img src="https://m.media-amazon.com/images/I/91BYoDpJ4kL._AC_UF1000,1000_QL80_.jpg"
                             alt="Demon Slayer Inside"
                             class="w-full h-full object-cover">
                    </div>
                </div>
            </div>

            <!-- Product Info (Right) -->
            <div class="w-full lg:w-1/2">
                <div class="flex items-center mb-2">
                    <h2 class="text-3xl font-bold text-gray-800">Demon Slayer Vol.8</h2>
                    <span class="ml-4 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">Manga</span>
                </div>

                <div class="flex items-center mb-4">
                    <div class="flex text-yellow-400 mr-2">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <span class="text-gray-600 text-sm">(124 recensioni)</span>
                    <a href="#reviews" class="ml-4 text-nekopeach text-sm hover:underline">Vedi tutte</a>
                </div>

                <div class="mb-6">
                    <p class="text-gray-800 text-lg">La battaglia contro i demoni continua con azione mozzafiato in questo ottavo volume della serie Demon Slayer! Tanjiro e i suoi compagni affrontano nuove sfide mentre cercano di sconfiggere i demoni e trovare una cura per Nezuko.</p>
                </div>

                <div class="bg-nekopink/20 rounded-xl p-4 mb-6">
                    <div class="flex items-center mb-2">
                        <span class="text-gray-400 line-through text-lg mr-3">€7.99</span>
                        <span class="text-nekopeach font-bold text-2xl">€6.79</span>
                        <span class="ml-3 bg-nekopeach text-white px-2 py-1 rounded-md text-xs font-bold">-15%</span>
                    </div>
                    <p class="text-nekopeach font-bold text-sm">Risparmi €1.20</p>
                </div>

                <div class="mb-6">
                    <div class="flex items-center mb-2">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-gray-800">Disponibilità: <span class="font-bold text-nekopeach">In magazzino (15+ pezzi)</span></span>
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
                    <button class="bg-white border-2 border-nekopeach text-nekopeach hover:bg-nekopink/20 px-6 py-3 rounded-full font-bold flex items-center justify-center transition flex-1">
                        <i class="fas fa-heart mr-2"></i> Lista Desideri
                    </button>
                </div>

                <!-- Product Details -->
                <div class="border-t border-gray-200 pt-4">
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Dettagli prodotto</h3>
                    <div class="grid grid-cols-2 gap-2 text-sm">
                        <div class="text-gray-600">Autore:</div>
                        <div class="font-medium">Koyoharu Gotouge</div>

                        <div class="text-gray-600">Editore:</div>
                        <div class="font-medium">Star Comics</div>

                        <div class="text-gray-600">Pagine:</div>
                        <div class="font-medium">192</div>

                        <div class="text-gray-600">Lingua:</div>
                        <div class="font-medium">Italiano</div>

                        <div class="text-gray-600">ISBN:</div>
                        <div class="font-medium">978-8822617581</div>

                        <div class="text-gray-600">Data pubblicazione:</div>
                        <div class="font-medium">15 Gennaio 2020</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Description -->
        <div class="mt-8 border-t border-gray-200 pt-6">
            <h3 class="text-2xl font-bold text-nekopeach mb-4">Descrizione</h3>
            <div class="prose max-w-none">
                <p>In questo ottavo volume di Demon Slayer, la battaglia contro i demoni raggiunge nuovi livelli di intensità. Tanjiro continua il suo addestramento per diventare un potente cacciatore di demoni, mentre cerca disperatamente una cura per sua sorella Nezuko, trasformata in un demone.</p>
                <p class="mt-4">La storia si svolge nel Giappone del periodo Taishō, dove Tanjiro Kamado, un giovane ragazzo che si guadagna da vivere vendendo carbone, scopre che la sua famiglia è stata massacrata da un demone. L'unica sopravvissuta è sua sorella Nezuko, che è stata trasformata in un demone.</p>
                <p class="mt-4">Determinato a trovare un modo per riportare Nezuko alla normalità e vendicare la sua famiglia, Tanjiro si unisce ai Cacciatori di Demoni, un'organizzazione segreta dedita a proteggere l'umanità dai demoni.</p>
            </div>
        </div>

        <!-- Reviews Section -->
        <div id="reviews" class="mt-8 border-t border-gray-200 pt-6">
            <h3 class="text-2xl font-bold text-nekopeach mb-4">Recensioni</h3>

            <div class="bg-nekopink/20 rounded-xl p-6 mb-6">
                <div class="flex items-center mb-4">
                    <div class="flex text-yellow-400 mr-4">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <span class="font-bold">4.5 su 5</span>
                    <span class="text-gray-600 ml-2">(124 recensioni)</span>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                    <div class="flex items-center">
                        <span class="w-20 text-sm">5 stelle</span>
                        <div class="flex-1 bg-gray-200 rounded-full h-2 mx-2">
                            <div class="bg-yellow-400 h-2 rounded-full" style="width: 70%"></div>
                        </div>
                        <span class="text-sm w-8 text-right">70%</span>
                    </div>
                    <div class="flex items-center">
                        <span class="w-20 text-sm">4 stelle</span>
                        <div class="flex-1 bg-gray-200 rounded-full h-2 mx-2">
                            <div class="bg-yellow-400 h-2 rounded-full" style="width: 20%"></div>
                        </div>
                        <span class="text-sm w-8 text-right">20%</span>
                    </div>
                    <div class="flex items-center">
                        <span class="w-20 text-sm">3 stelle</span>
                        <div class="flex-1 bg-gray-200 rounded-full h-2 mx-2">
                            <div class="bg-yellow-400 h-2 rounded-full" style="width: 7%"></div>
                        </div>
                        <span class="text-sm w-8 text-right">7%</span>
                    </div>
                </div>

                <button class="bg-nekopeach hover:bg-nekored text-white px-6 py-2 rounded-full font-bold">
                    <i class="fas fa-pen mr-2"></i> Scrivi una recensione
                </button>
            </div>

            <!-- Review List -->
            <div class="space-y-6">
                <div class="border-b border-gray-200 pb-6">
                    <div class="flex items-center mb-2">
                        <div class="flex text-yellow-400 mr-2">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <span class="font-bold ml-2">Eccellente</span>
                    </div>
                    <h4 class="font-bold text-lg">Assolutamente da avere!</h4>
                    <p class="text-gray-600 mb-2">Di <span class="font-bold">Marco Rossi</span> - 15 Gennaio 2023</p>
                    <p class="text-gray-800">La storia continua a sorprendermi con colpi di scena emozionanti e disegni spettacolari. Consigliato a tutti gli appassionati del genere!</p>
                </div>

                <div class="border-b border-gray-200 pb-6">
                    <div class="flex items-center mb-2">
                        <div class="flex text-yellow-400 mr-2">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                        <span class="font-bold ml-2">Molto buono</span>
                    </div>
                    <h4 class="font-bold text-lg">Continua a stupire</h4>
                    <p class="text-gray-600 mb-2">Di <span class="font-bold">Anna Bianchi</span> - 2 Dicembre 2022</p>
                    <p class="text-gray-800">La qualità della stampa è ottima e la storia è avvincente. L'unica pecca è che a volte i combattimenti sono un po' troppo lunghi.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Related Products -->
    <div class="bg-white rounded-2xl border-2 border-nekoorange p-6 mb-8">
        <div class="flex items-center mb-6">
            <div class="w-10 h-10 rounded-full bg-nekopeach flex items-center justify-center mr-3">
                <i class="fas fa-layer-group text-white"></i>
            </div>
            <h2 class="text-2xl font-bold text-nekopeach">Potrebbero piacerti anche</h2>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Related Product 1 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/81nP5-xT7EL._AC_UF1000,1000_QL80_.jpg"
                         alt="Demon Slayer Vol.7"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Demon Slayer Vol.7</h3>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">€7.99</span>
                        <a href="${pageContext.request.contextPath}/specificheprodotto.jsp?id=1"
                           class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </a>
                    </div>
                </div>
            </div>

            <!-- Related Product 2 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/91BYoDpJ4kL._AC_UF1000,1000_QL80_.jpg"
                         alt="Demon Slayer Vol.9"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Demon Slayer Vol.9</h3>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">€7.99</span>
                        <a href="${pageContext.request.contextPath}/specificheprodotto.jsp?id=1"
                           class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </a>
                    </div>
                </div>
            </div>

            <!-- Related Product 3 -->
            <div class="product-card">
                <div class="relative h-64 overflow-hidden">
                    <img src="https://m.media-amazon.com/images/I/71FQ9+Y2KRL._AC_UF1000,1000_QL80_.jpg"
                         alt="Attack on Titan Vol.1"
                         class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-gray-800">Attack on Titan Vol.1</h3>
                    <div class="mt-4 flex justify-between items-center">
                        <span class="text-nekopeach font-bold">€7.99</span>
                        <a href="${pageContext.request.contextPath}/specificheprodotto.jsp?id=1"
                           class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition">
                            <i class="fas fa-eye mr-1"></i> Dettagli
                        </a>
                    </div>
                </div>
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

    // Quantity control functions
    function increaseQuantity() {
        const quantityInput = document.getElementById('quantity');
        let value = parseInt(quantityInput.value);
        if (value < 10) {
            quantityInput.value = value + 1;
        }
    }

    function decreaseQuantity() {
        const quantityInput = document.getElementById('quantity');
        let value = parseInt(quantityInput.value);
        if (value > 1) {
            quantityInput.value = value - 1;
        }
    }

    // Add to cart function
    function addToCart() {
        const quantity = document.getElementById('quantity').value;
        // Here you would typically make an AJAX call to add the item to the cart
        alert(`Aggiunti ${quantity} articolo(i) al carrello!`);

        // Animation feedback
        const cartButton = document.querySelector('.folder-tab[href="cart.jsp"]');
        cartButton.classList.add('animate-bounce');
        setTimeout(() => {
            cartButton.classList.remove('animate-bounce');
        }, 1000);
    }

    // Thumbnail click handler
    document.querySelectorAll('.w-20.h-20').forEach(thumb => {
        thumb.addEventListener('click', function() {
            const mainImage = document.querySelector('.h-96 img');
            const newSrc = this.querySelector('img').src;
            mainImage.src = newSrc;

            // Update active thumbnail
            document.querySelectorAll('.w-20.h-20').forEach(t => {
                t.classList.remove('border-nekopink', 'border-2');
                t.classList.add('border-gray-200');
            });
            this.classList.remove('border-gray-200');
            this.classList.add('border-nekopink', 'border-2');
        });
    });

    // Initialize when page loads
    document.addEventListener('DOMContentLoaded', function() {
        generateDecorations();

        // Set first thumbnail as active
        document.querySelector('.w-20.h-20').classList.add('border-nekopink', 'border-2');
        document.querySelector('.w-20.h-20').classList.remove('border-gray-200');
    });
</script>
</body>
</html>