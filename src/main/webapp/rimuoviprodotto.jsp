<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Rimuovi Prodotto</title>
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
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48ZyBmaWxsPSIjZmY3ZWI4Ij48cGF0aCBkPSJNNTAgMTBjLTIyIDAtNDAgMTgtNDAgNDBzMTggNDAgNDAgNDAgNDAtMTggNDAtNDAtMTgtNDAtNDAtNDB6bTAgODFhOSA5IDAgMCAxIDAgMCAwIDkgOSAwIDAgMCAwIDB6Ii8+PHBhdGggZD0iTTIwIDEwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDE4IDAgMiAyIDAgMCAwLTIgMiA5IDkgMCAwIDEtMTggMHoiLz48cGF0aCBkPSJNNjAgMTBhMiAyIDAgMCAwLTItMmE5IDkgMCAwIDEgMCAxOCAyIDIgMCAwIDAgMiAyIDkgOSAwIDAgMSAwLTE4eiIvPjxwYXRoIGQ9Ik0yMCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAxOCAwIDIgMiAwIDAgMC0yIDIgOSA9IDAgMS0xOCAweiIvPjxwYXRoIGQ9Ik02MCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAwIDE4IDIgMiAwIDAgMCAyIDIgOSA5IDAgMCAxIDAtMTh6Ii8+PC9nPjwvc3ZnPg==');
            background-size: cover;
            animation: blossom-fall 15s linear infinite;
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

        .search-input:focus {
            border-color: #e55458;
            box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.3);
        }

        .product-card {
            transition: all 0.3s ease;
            border: 2px solid #f2d5bb;
            border-radius: 15px;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(229, 84, 88, 0.2);
            border-color: #e55458;
        }

        .product-image {
            height: 180px;
            object-fit: contain;
            background-color: #fbd8da50;
        }

        .delete-btn {
            transition: all 0.3s ease;
            background-color: #f24535;
            color: white;
        }

        .delete-btn:hover {
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

        .no-products {
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
                    <i class="fas fa-trash-alt text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-boxes text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Rimuovi Prodotto</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Pannello di amministrazione</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="admin.jsp" class="folder-tab"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a>
                <a href="gestioneprodotti.jsp" class="folder-tab"><i class="fas fa-boxes mr-2"></i> Prodotti</a>
                <a href="ordini.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Ordini</a>
                <a href="gestioneutenti.jsp" class="folder-tab"><i class="fas fa-users mr-2"></i> Utenti</a>
                <a href="aggiungiprodotto.jsp" class="folder-tab"><i class="fas fa-plus-circle mr-2"></i> Aggiungi</a>
                <a href="modificaprodotto.jsp" class="folder-tab"><i class="fas fa-edit mr-2"></i> Modifica</a>
                <a href="rimuoviprodotto.jsp" class="folder-tab active"><i class="fas fa-minus-circle mr-2"></i> Rimuovi</a>
                <a href="logout.jsp" class="folder-tab"><i class="fas fa-sign-out-alt mr-2"></i> Esci</a>
            </div>
        </div>
    </div>

    <!-- Search and Filter Section -->
    <div class="max-w-4xl mx-auto mb-8">
        <div class="profile-card bg-white border-2 border-nekored">
            <div class="bg-gradient-to-r from-nekopeach to-nekoorange p-4">
                <h2 class="text-xl font-bold text-white flex items-center">
                    <i class="fas fa-search mr-3" style="font-size: 30px"></i>
                    <span style="font-size: 30px">Cerca Prodotti</span>
                </h2>
            </div>

            <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="search" class="block text-gray-700 text-sm font-bold mb-2">Cerca per nome</label>
                    <div class="relative">
                        <input type="text" id="search" placeholder="Inserisci nome prodotto..."
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none search-input">
                        <button class="absolute right-0 top-0 h-full px-4 text-nekopeach">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <div>
                    <label for="category" class="block text-gray-700 text-sm font-bold mb-2">Filtra per categoria</label>
                    <select id="category" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach">
                        <option value="">Tutte le categorie</option>
                        <option value="action_figure">Action Figure</option>
                        <option value="funko_pop">Funko Pop</option>
                        <option value="nendoroid">Nendoroid</option>
                        <option value="scale_figure">Scale Figure</option>
                        <option value="model_kit">Model Kit</option>
                        <option value="plush">Peluche</option>
                        <option value="poster">Poster</option>
                        <option value="keychain">Keychain</option>
                        <option value="other">Altro</option>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <!-- Products List -->
    <div class="max-w-4xl mx-auto">
        <div class="profile-card bg-white border-2 border-nekored mb-6">
            <div class="bg-gradient-to-r from-nekopeach to-nekoorange p-4">
                <h2 class="text-xl font-bold text-white flex items-center justify-between">
          <span>
            <i class="fas fa-box-open mr-3" style="font-size: 30px"></i>
            <span style="font-size: 30px">Prodotti Disponibili</span>
          </span>
                    <span class="text-sm bg-white/30 px-3 py-1 rounded-full font-normal">
            <span id="products-count">12</span> prodotti
          </span>
                </h2>
            </div>

            <div class="p-6">
                <!-- Loading state -->
                <div id="loading" class="flex justify-center items-center py-12">
                    <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopeach"></div>
                </div>

                <!-- Products grid -->
                <div id="products-grid" class="grid grid-cols-1 md:grid-cols-2 gap-4 hidden">
                    <!-- Product card 1 (sample) -->
                    <div class="product-card bg-white p-4">
                        <div class="flex gap-4">
                            <div class="w-24 h-24 flex-shrink-0">
                                <img src="https://via.placeholder.com/200" alt="Product Image" class="w-full h-full object-cover product-image rounded-lg">
                            </div>
                            <div class="flex-grow">
                                <h3 class="font-bold text-md text-gray-800 truncate">Nendoroid Hatsune Miku: Sakura Version</h3>
                                <p class="text-sm text-gray-600">Good Smile Company</p>
                                <div class="flex flex-wrap gap-1 mt-1 mb-2">
                                    <span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">Nendoroid</span>
                                    <span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">Vocaloid</span>
                                </div>
                                <div class="flex items-center justify-between">
                                    <p class="font-bold text-nekopeach">€49.99</p>
                                    <button class="delete-btn px-3 py-1 rounded-lg text-sm flex items-center gap-1">
                                        <i class="fas fa-trash"></i> Elimina
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product card 2 (sample) -->
                    <div class="product-card bg-white p-4">
                        <div class="flex gap-4">
                            <div class="w-24 h-24 flex-shrink-0">
                                <img src="https://via.placeholder.com/200" alt="Product Image" class="w-full h-full object-cover product-image rounded-lg">
                            </div>
                            <div class="flex-grow">
                                <h3 class="font-bold text-md text-gray-800 truncate">Luffy (Gear 5) Figure - One Piece</h3>
                                <p class="text-sm text-gray-600">Banpresto</p>
                                <div class="flex flex-wrap gap-1 mt-1 mb-2">
                                    <span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">Action Figure</span>
                                    <span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">One Piece</span>
                                    <span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">Ed. Limitata</span>
                                </div>
                                <div class="flex items-center justify-between">
                                    <p class="font-bold text-nekopeach">€89.99</p>
                                    <button class="delete-btn px-3 py-1 rounded-lg text-sm flex items-center gap-1">
                                        <i class="fas fa-trash"></i> Elimina
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- No products found -->
                <div id="no-products" class="hidden">
                    <div class="no-products text-center p-8 rounded-lg">
                        <div class="w-16 h-16 mx-auto mb-4 bg-white/80 rounded-full flex items-center justify-center">
                            <i class="fas fa-search text-2xl text-nekopeach"></i>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-2">Nessun prodotto trovato</h3>
                        <p class="text-gray-600 mb-4">Prova a modificare i filtri di ricerca o aggiungi nuovi prodotti</p>
                        <a href="aggiungiprodotto.jsp" class="inline-block bg-nekopeach text-white px-4 py-2 rounded-lg hover:bg-nekoorange transition">
                            <i class="fas fa-plus mr-2"></i> Aggiungi Prodotto
                        </a>
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
                        <button class="pagination-btn w-8 h-8 rounded-full">3</button>
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
        <div class="confirmation-box bg-white rounded-lg shadow-xl max-w-md w-full mx-4">
            <div class="p-6">
                <div class="flex justify-center">
                    <div class="w-16 h-16 rounded-full bg-red-100 flex items-center justify-center mb-4">
                        <i class="fas fa-exclamation-triangle text-2xl text-nekored"></i>
                    </div>
                </div>
                <h3 class="text-center font-bold text-xl text-gray-800 mb-2">Conferma eliminazione</h3>
                <p class="text-center text-gray-600 mb-6" id="modal-text">Sei sicuro di voler eliminare permanentemente questo prodotto? Questa azione non può essere annullata.</p>
                <div class="flex justify-center gap-4">
                    <button id="cancel-delete" class="bg-gray-200 text-gray-700 px-6 py-2 rounded-lg font-medium hover:bg-gray-300 transition">
                        Annulla
                    </button>
                    <button id="confirm-delete" class="delete-btn px-6 py-2 rounded-lg font-medium flex items-center gap-1">
                        <i class="fas fa-trash"></i> Elimina
                    </button>
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
    // Cherry blossom animation
    function createCherryBlossom() {
        const blossom = document.createElement('div');
        blossom.className = 'cherry-blossom';

        // Random position and animation duration
        const startX = Math.random() * window.innerWidth;
        const duration = 15 + Math.random() * 10;
        const delay = Math.random() * 5;
        const size = 20 + Math.random() * 20;

        blossom.style.left = `${startX}px`;
        blossom.style.width = `${size}px`;
        blossom.style.height = `${size}px`;
        blossom.style.animationDuration = `${duration}s`;
        blossom.style.animationDelay = `${delay}s`;

        document.getElementById('decorations').appendChild(blossom);

        // Remove after animation completes
        setTimeout(() => {
            blossom.remove();
        }, (duration + delay) * 1000);
    }

    // Create multiple blossoms
    for (let i = 0; i < 15; i++) {
        setTimeout(createCherryBlossom, i * 1000);
    }

    // Sample product data
    const sampleProducts = [
        {
            id: 1,
            name: "Nendoroid Hatsune Miku: Sakura Version",
            brand: "Good Smile Company",
            price: 49.99,
            type: "Nendoroid",
            categories: ["Vocaloid", "Femminile"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 2,
            name: "Luffy (Gear 5) Figure - One Piece",
            brand: "Banpresto",
            price: 89.99,
            type: "Action Figure",
            categories: ["One Piece", "Ed. Limitata"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 3,
            name: "Funko Pop! Naruto (Six Paths Sage Mode)",
            brand: "Funko",
            price: 29.99,
            type: "Funko Pop",
            categories: ["Naruto", "Novità"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 4,
            name: "Saber Alter - Fate/Grand Order",
            brand: "Max Factory",
            price: 129.99,
            type: "Scale Figure",
            categories: ["Fate", "Figura Premium"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 5,
            name: "Rengoku Kyojuro Nendoroid",
            brand: "Good Smile Company",
            price: 59.99,
            type: "Nendoroid",
            categories: ["Demon Slayer", "Novità"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 6,
            name: "Tanjiro Kamado - Demon Slayer",
            brand: "Bandai",
            price: 39.99,
            type: "Model Kit",
            categories: ["Demon Slayer", "Action Figure"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 7,
            name: "Zero Two Plush - Darling in the Franxx",
            brand: "Banpresto",
            price: 24.99,
            type: "Peluche",
            categories: ["Darling in the Franxx", "Peluche"],
            image: "https://via.placeholder.com/200"
        },
        {
            id: 8,
            name: "Goku Super Saiyan Blue - Dragon Ball",
            brand: "Banpresto",
            price: 79.99,
            type: "Action Figure",
            categories: ["Dragon Ball", "Novità"],
            image: "https://via.placeholder.com/200"
        }
    ];

    // Current page state
    let currentPage = 1;
    const productsPerPage = 4;

    // Mock API call to get products
    function fetchProducts(searchTerm = '', category = '', page = 1) {
        // Simulate API delay
        document.getElementById('loading').classList.remove('hidden');
        document.getElementById('products-grid').classList.add('hidden');
        document.getElementById('no-products').classList.add('hidden');

        setTimeout(() => {
            // Filter products based on search and category
            let filteredProducts = [...sampleProducts];

            if (searchTerm) {
                filteredProducts = filteredProducts.filter(product =>
                    product.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                    product.brand.toLowerCase().includes(searchTerm.toLowerCase())
                );
            }

            if (category) {
                filteredProducts = filteredProducts.filter(product =>
                    product.type.toLowerCase() === category.toLowerCase()
                );
            }

            // Update product count
            document.getElementById('products-count').textContent = filteredProducts.length;

            // Check if no products found
            if (filteredProducts.length === 0) {
                document.getElementById('no-products').classList.remove('hidden');
                document.getElementById('products-grid').classList.add('hidden');
            } else {
                // Paginate results
                const startIndex = (page - 1) * productsPerPage;
                const paginatedProducts = filteredProducts.slice(startIndex, startIndex + productsPerPage);

                // Render products
                renderProducts(paginatedProducts);
                renderPagination(filteredProducts.length);
            }

            document.getElementById('loading').classList.add('hidden');
        }, 800);
    }

    // Render products to the grid
    function renderProducts(products) {
        const productsGrid = document.getElementById('products-grid');
        productsGrid.innerHTML = '';

        products.forEach(product => {
            const productCard = document.createElement('div');
            productCard.className = 'product-card bg-white p-4';
            productCard.innerHTML = `
        <div class="flex gap-4">
          <div class="w-24 h-24 flex-shrink-0">
            <img src="${product.image}" alt="${product.name}" class="w-full h-full object-cover product-image rounded-lg">
          </div>
          <div class="flex-grow">
            <h3 class="font-bold text-md text-gray-800 truncate">${product.name}</h3>
            <p class="text-sm text-gray-600">${product.brand}</p>
            <div class="flex flex-wrap gap-1 mt-1 mb-2">
              <span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">${product.type}</span>
              ${product.categories.map(cat >=
                '<span class="text-xs bg-nekopink text-nekopeach px-2 py-1 rounded">${cat}</span>'
              ).join('')}
            </div>
            <div class="flex items-center justify-between">
              <p class="font-bold text-nekopeach">€${product.price.toFixed(2)}</p>
              <button class="delete-btn px-3 py-1 rounded-lg text-sm flex items-center gap-1" data-id="${product.id}" data-name="${product.name}">
                <i class="fas fa-trash"></i> Elimina
              </button>
            </div>
          </div>
        </div>
      `;

            productsGrid.appendChild(productCard);
        });

        productsGrid.classList.remove('hidden');

        // Add event listeners to delete buttons
        document.querySelectorAll('.delete-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const productId = this.getAttribute('data-id');
                const productName = this.getAttribute('data-name');
                showDeleteConfirmation(productId, productName);
            });
        });
    }

    // Render pagination
    function renderPagination(totalProducts) {
        const totalPages = Math.ceil(totalProducts / productsPerPage);
        const paginationContainer = document.querySelector('.flex.justify-center.gap-2');

        if (!paginationContainer) return;

        paginationContainer.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const pageBtn = document.createElement('button');
            pageBtn.className = `pagination-btn w-8 h-8 rounded-full ${i == currentPage ? 'active' : ''}`;
            pageBtn.textContent = i;
            pageBtn.addEventListener('click', () => {
                currentPage = i;
                fetchProducts(
                    document.getElementById('search').value,
                    document.getElementById('category').value,
                    currentPage
                );
            });

            paginationContainer.appendChild(pageBtn);
        }

        // Update prev/next buttons
        document.getElementById('prev-page').disabled = currentPage === 1;
        document.getElementById('next-page').disabled = currentPage === totalPages;

        document.getElementById('prev-page').addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                fetchProducts(
                    document.getElementById('search').value,
                    document.getElementById('category').value,
                    currentPage
                );
            }
        });

        document.getElementById('next-page').addEventListener('click', () => {
            if (currentPage < totalPages) {
                currentPage++;
                fetchProducts(
                    document.getElementById('search').value,
                    document.getElementById('category').value,
                    currentPage
                );
            }
        });
    }

    // Show delete confirmation modal
    function showDeleteConfirmation(productId, productName) {
        const modal = document.getElementById('confirmation-modal');
        const modalText = document.getElementById('modal-text');

        modalText.textContent = `Sei sicuro di voler eliminare permanentemente "${productName}"? Questa azione non può essere annullata.`;

        modal.classList.remove('hidden');

        document.getElementById('cancel-delete').addEventListener('click', () => {
            modal.classList.add('hidden');
        });

        document.getElementById('confirm-delete').addEventListener('click', () => {
            // Simulate delete action
            console.log(`Deleting product with ID: ${productId}`);

            // Show success message (in a real app, you would handle errors too)
            alert(`Prodotto "${productName}" eliminato con successo!`);
            modal.classList.add('hidden');

            // Refresh product list
            fetchProducts(
                document.getElementById('search').value,
                document.getElementById('category').value,
                currentPage
            );
        });
    }

    // Event listeners for search and filter
    document.getElementById('search').addEventListener('input', (e) => {
        currentPage = 1;
        fetchProducts(
            e.target.value,
            document.getElementById('category').value,
            currentPage
        );
    });

    document.getElementById('category').addEventListener('change', (e) => {
        currentPage = 1;
        fetchProducts(
            document.getElementById('search').value,
            e.target.value,
            currentPage
        );
    });

    // Close modal when clicking outside
    document.getElementById('confirmation-modal').addEventListener('click', (e) => {
        if (e.target === document.getElementById('confirmation-modal')) {
            document.getElementById('confirmation-modal').classList.add('hidden');
        }
    });

    // Initial load
    fetchProducts();
</script>
</body>
</html>
