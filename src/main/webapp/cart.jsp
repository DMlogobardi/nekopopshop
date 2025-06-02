<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - Carrello</title>
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
      box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
      overflow: hidden;
    }

    .product-card:hover {
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

    .quantity-selector {
      display: flex;
      align-items: center;
      border: 1px solid #E55458;
      border-radius: 20px;
      overflow: hidden;
    }

    .quantity-btn {
      background-color: #E55458;
      color: white;
      border: none;
      width: 30px;
      height: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .quantity-btn:hover {
      background-color: #c43c40;
    }

    .quantity-input {
      width: 40px;
      text-align: center;
      border: none;
      outline: none;
      font-weight: bold;
    }

    .remove-btn {
      color: #E55458;
      transition: all 0.3s;
    }

    .remove-btn:hover {
      transform: scale(1.2);
      color: #c43c40;
    }

    .checkout-btn {
      background: linear-gradient(145deg, #E55458, #F29966);
      transition: all 0.3s;
    }

    .checkout-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(229, 84, 88, 0.3);
    }

    .empty-cart {
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 20px;
      box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
    }

    .discount-badge {
      position: absolute;
      top: 10px;
      right: 10px;
      background-color: #E55458;
      color: white;
      padding: 3px 8px;
      border-radius: 10px;
      font-size: 0.8rem;
      font-weight: bold;
    }

    .payment-method {
      border: 2px solid #f2d5bb;
      border-radius: 10px;
      transition: all 0.3s;
    }

    .payment-method:hover {
      border-color: #E55458;
      transform: translateY(-3px);
    }

    .payment-method.selected {
      border-color: #E55458;
      background-color: rgba(229, 84, 88, 0.1);
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
    .text-lg{
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
          <i class="fas fa-paw text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-shopping-cart text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">Il Tuo Carrello</span></h1>
        <p class="text-xl text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Manga & Action Figure</p>
      </div>
    </div>

    <!-- Navigation -->
    <div class="w-full lg:w-auto">
      <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
        <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
        <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
        <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
        <a href="cart.jsp" class="folder-tab active"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
        <a href="admin.jsp" class="folder-tab"><i class="fas fa-user-shield mr-2"></i> Admin</a>
        <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
      </div>
    </div>
  </div>

  <!-- Cart Content -->
  <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    <!-- Cart Items -->
    <div class="lg:col-span-2">
      <div class="bg-white rounded-xl border-2 border-nekopeach overflow-hidden">
        <div class="bg-gradient-to-r from-nekopeach to-nekoorange p-4 flex items-center">
          <i class="fas fa-shopping-basket text-white text-2xl mr-3"></i>
          <h2 class="text-xl font-bold text-white" style="font-size: 30px">I Tuoi Prodotti</h2>
          <div class="ml-auto flex items-center">
            <span class="bg-white text-nekopeach px-3 py-1 rounded-full text-sm font-bold" id="item-count">3 articoli</span>
          </div>
        </div>

        <div class="p-4" id="cart-items-container">
          <!-- Cart Item 1 -->
          <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-nekoorange mb-4 relative">
            <div class="p-4 flex flex-col md:flex-row">
              <div class="w-full md:w-1/4 h-40 rounded-xl overflow-hidden flex-shrink-0">
                <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=1000"
                     alt="Chainsaw Man"
                     class="w-full h-full object-cover">
                <div class="discount-badge">-20%</div>
              </div>

              <div class="md:ml-4 mt-4 md:mt-0 flex-1">
                <div class="flex justify-between">
                  <h3 class= "font-bold text-gray-800 text-lg" style="font-size: 20px" >Chainsaw Man Vol.1</h3>
                  <button class="remove-btn text-xl">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
                <p class="text-gray-600 text-sm mt-1">Denji &egrave un ragazzo semplice con un sogno semplice...</p>

                <div class="mt-4 flex flex-col md:flex-row md:items-center justify-between">
                  <div class= "flex items-center mb-3 md:mb-0">
                    <span class= "text-gray-500 line-through mr-2">&#8364 16,99</span>
                    <span class="text-2xl font-bold text-nekopink">&#8364 13,59</span>
                  </div>

                  <div class="quantity-selector">
                    <button class="quantity-btn decrement">
                      <i class="fas fa-minus"></i>
                    </button>
                    <input type="number" value="1" min="1" class="quantity-input">
                    <button class="quantity-btn increment">
                      <i class="fas fa-plus"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Cart Item 2 -->
          <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-nekoorange mb-4 relative">
            <div class="p-4 flex flex-col md:flex-row">
              <div class="w-full md:w-1/4 h-40 rounded-xl overflow-hidden flex-shrink-0">
                <img src="https://images.unsplash.com/photo-1558494948-4ece8de63a5f?q=80&w=1000"
                     alt="Berserk"
                     class="w-full h-full object-cover">
              </div>

              <div class="md:ml-4 mt-4 md:mt-0 flex-1">
                <div class="flex justify-between">
                  <h3 class="font-bold text-gray-800 text-lg" style="font-size: 20px">Berserk Vol.2</h3>
                  <button class="remove-btn text-xl">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
                <p class="text-gray-600 text-sm mt-1">L'epico dark fantasy che ha ispirato una generazione...</p>

                <div class="mt-4 flex flex-col md:flex-row md:items-center justify-between">
                  <div class="flex items-center mb-3 md:mb-0">
                    <span class="text-2xl font-bold text-nekopink">&#8364 14,99</span>
                  </div>

                  <div class="quantity-selector">
                    <button class="quantity-btn decrement">
                      <i class="fas fa-minus"></i>
                    </button>
                    <input type="number" value="1" min="1" class="quantity-input">
                    <button class="quantity-btn increment">
                      <i class="fas fa-plus"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Cart Item 3 -->
          <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-nekoorange relative">
            <div class="p-4 flex flex-col md:flex-row">
              <div class="w-full md:w-1/4 h-40 rounded-xl overflow-hidden flex-shrink-0">
                <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=1000"
                     alt="Action Figure"
                     class="w-full h-full object-cover">
                <div class="discount-badge">Limited</div>
              </div>

              <div class="md:ml-4 mt-4 md:mt-0 flex-1">
                <div class="flex justify-between">
                  <h3 class= "font-bold text-gray-800 text-lg" style="font-size: 20px" >Naruto Uzumaki Figure</h3>
                  <button class="remove-btn text-xl">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
                <p class="text-gray-600 text-sm mt-1">Action figure da collezione alta 25cm con base e accessori</p>

                <div class="mt-4 flex flex-col md:flex-row md:items-center justify-between">
                  <div class="flex items-center mb-3 md:mb-0">
                    <span class="text-gray-500 line-through mr-2">&#8364 49,99</span>
                    <span class="text-2xl font-bold text-nekopink">&#8364 39,99</span>
                  </div>

                  <div class="quantity-selector">
                    <button class="quantity-btn decrement">
                      <i class="fas fa-minus"></i>
                    </button>
                    <input type="number" value="1" min="1" class="quantity-input">
                    <button class="quantity-btn increment">
                      <i class="fas fa-plus"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Empty Cart State (hidden by default) -->
        <div class="empty-cart p-8 text-center hidden" id="empty-cart">
          <div class="w-32 h-32 bg-nekopink rounded-full flex items-center justify-center mx-auto mb-6">
            <i class="fas fa-shopping-basket text-4xl text-white"></i>
          </div>
          <h3 class="text-xl font-bold text-nekopeach mb-2">Il tuo carrello è vuoto!</h3>
          <p class="text-gray-600 mb-6">Sfoglia il nostro catalogo e aggiungi i tuoi prodotti preferiti</p>
          <a href="catalog.html" class="bg-nekopeach hover:bg-nekopink text-white px-6 py-3 rounded-lg font-bold inline-block">
            <i class="fas fa-book mr-2"></i> Vai al Catalogo
          </a>
        </div>
      </div>

      <!-- Coupon Section -->
      <div class="bg-white rounded-xl border-2 border-nekopeach mt-6 overflow-hidden">
        <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
          <h2 class="text-xl font-bold text-white flex items-center">
            <i class="fas fa-tag mr-3"></i> Codice Sconto
          </h2>
        </div>

        <div class="p-4">
          <div class="flex">
            <input type="text" placeholder="Inserisci codice sconto"
                   class="flex-1 border-2 border-nekopeach rounded-l-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-nekopeach">
            <button class="bg-nekopeach hover:bg-nekopink text-white px-6 rounded-r-lg font-bold transition">
              Applica
            </button>
          </div>

          <div class="mt-4 bg-nekopink/20 rounded-lg p-3 hidden" id="coupon-success">
            <div class="flex items-center">
              <div class="w-8 h-8 rounded-full bg-green-500 text-white flex items-center justify-center mr-3">
                <i class="fas fa-check"></i>
              </div>
              <div>
                <p class="font-bold text-green-700">Codice sconto applicato!</p>
                <p class="text-sm text-green-600">Hai ottenuto uno sconto del 10% sul tuo ordine</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Order Summary -->
    <div class="lg:col-span-1">
      <div class="bg-white rounded-xl border-2 border-nekoorange overflow-hidden sticky top-6">
        <div class="bg-gradient-to-r from-nekoorange to-nekopink p-4">
          <h2 class="text-xl font-bold text-white flex items-center">
            <i class="fas fa-receipt mr-3"></i> Riepilogo Ordine
          </h2>
        </div>

        <div class="p-4">
          <div class="space-y-3 mb-4">
            <div class="flex justify-between">
              <span class="text-gray-600">Subtotale</span>
              <span class="font-bold" id="subtotal">&#8364 68,57</span>
            </div>
            <div class="flex justify-between">
              <span class="text-gray-600">Spedizione</span>
              <span class="font-bold" id="shipping">&#8364 4,99</span>
            </div>
            <div class="flex justify-between hidden" id="discount-row">
              <span class="text-gray-600">Sconto</span>
              <span class="font-bold text-green-600" id="discount">-&#8364 6,86</span>
            </div>
          </div>

          <div class="border-t border-gray-200 pt-3 mb-6">
            <div class="flex justify-between">
              <span class="text-2xl font-bold">Totale</span>
              <span class="text-xl font-bold text-nekopeach" id="total">&#8364 66,70</span>
            </div>
          </div>

          <button class= "checkout-btn w-full text-white py-4 rounded-lg font-bold text-lg mb-4">
            <i class= "fas fa-lock mr-2" style="font-size: 20px"></i> Procedi al Checkout
          </button>

          <div class="text-center text-sm text-gray-500">
            <p>Spedizione stimata: 2-4 giorni lavorativi</p>
          </div>

          <!-- Payment Methods -->
          <div class="mt-6">
            <h3 class= "font-bold mb-3">Metodi di pagamento</h3>
            <div class="grid grid-cols-4 gap-2">
              <div class="payment-method p-2 flex items-center justify-center cursor-pointer">
                <i class="fab fa-cc-visa text-2xl text-blue-800"></i>
              </div>
              <div class="payment-method p-2 flex items-center justify-center cursor-pointer">
                <i class= "fab fa-cc-mastercard text-2xl text-red-800"></i>
              </div>
              <div class="payment-method p-2 flex items-center justify-center cursor-pointer">
                <i class="fab fa-cc-paypal text-2xl text-blue-500"></i>
              </div>
              <div class="payment-method p-2 flex items-center justify-center cursor-pointer selected">
                <i class="fas fa-money-bill-wave text-2xl text-green-600"></i>
              </div>
            </div>
          </div>

          <!-- Secure Payment Info -->
          <div class="mt-6 bg-nekopink/10 rounded-lg p-3">
            <div class="flex items-center">
              <div class="w-10 h-10 rounded-full bg-green-500 text-white flex items-center justify-center mr-3">
                <i class="fas fa-lock"></i>
              </div>
              <div>
                <p class="text-sm font-bold">Pagamento sicuro</p>
                <p class="text-xs">Tutti i tuoi dati sono protetti</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Continue Shopping -->
      <div class="bg-white rounded-xl border-2 border-nekopeach mt-6 p-4 text-center">
        <a href="catalog.html" class="text-nekopeach hover:text-nekopink font-bold inline-flex items-center">
          <i class="fas fa-arrow-left mr-2"></i> Continua lo shopping
        </a>
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
    for (let i = 0; i < 10; i++) {
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
    for (let i = 0; i < 15; i++) {
      const blossom = document.createElement('div');
      blossom.className = 'cherry-blossom';
      blossom.style.left = `${Math.random() * viewportWidth}px`;
      blossom.style.animationDelay = `${Math.random() * 15}s`;
      blossom.style.opacity = `0.${Math.floor(2 + Math.random() * 7)}`;
      blossom.style.transform = `scale(${0.5 + Math.random()})`;
      decorationsContainer.appendChild(blossom);
    }
  }

  // Cart functionality
  function setupCart() {
    // Quantity selectors
    document.querySelectorAll('.quantity-btn').forEach(btn => {
      btn.addEventListener('click', function() {
        const input = this.parentElement.querySelector('.quantity-input');
        let value = parseInt(input.value);

        if (this.classList.contains('increment')) {
          value++;
        } else if (this.classList.contains('decrement') && value > 1) {
          value--;
        }

        input.value = value;
        updateCartTotals();
      });
    });

    // Quantity input validation
    document.querySelectorAll('.quantity-input').forEach(input => {
      input.addEventListener('change', function() {
        if (this.value < 1) this.value = 1;
        updateCartTotals();
      });
    });

    // Remove buttons
    document.querySelectorAll('.remove-btn').forEach(btn => {
      btn.addEventListener('click', function() {
        const item = this.closest('.product-card');
        item.style.animation = 'fadeOut 0.3s ease';
        setTimeout(() => {
          item.remove();
          updateCartTotals();
          checkEmptyCart();
        }, 300);
      });
    });

    // Payment method selection
    document.querySelectorAll('.payment-method').forEach(method => {
      method.addEventListener('click', function() {
        document.querySelectorAll('.payment-method').forEach(m => m.classList.remove('selected'));
        this.classList.add('selected');
      });
    });

    // Coupon application
    const couponInput = document.querySelector('input[type="text"][placeholder="Inserisci codice sconto"]');
    const applyCouponBtn = couponInput.nextElementSibling;

    applyCouponBtn.addEventListener('click', function() {
      if (couponInput.value.trim() === 'NEKO10') {
        document.getElementById('coupon-success').classList.remove('hidden');
        document.getElementById('discount-row').classList.remove('hidden');
        updateCartTotals();
      } else {
        alert('Codice sconto non valido! Prova con "NEKO10"');
      }
    });

    // Checkout button
    document.querySelector('.checkout-btn').addEventListener('click', function() {
      alert('Grazie per il tuo ordine! Verrai reindirizzato alla pagina di pagamento.');
    });
  }

  // Update cart totals
  function updateCartTotals() {
    const items = document.querySelectorAll('#cart-items-container .product-card');
    let subtotal = 0;

    items.forEach(item => {
      const priceText = item.querySelector('.text-nekopink').textContent;
      const price = parseFloat(priceText.replace('€', '').replace(',', '.'));
      const quantity = parseInt(item.querySelector('.quantity-input').value);
      subtotal += price * quantity;
    });

    const shipping = 4.99;
    let discount = 0;

    if (!document.getElementById('discount-row').classList.contains('hidden')) {
      discount = subtotal * 0.1; // 10% discount
    }

    const total = subtotal + shipping - discount;

    document.getElementById('subtotal').textContent = `€${subtotal.toFixed(2).replace('.', ',')}`;
    document.getElementById('shipping').textContent = `€${shipping.toFixed(2).replace('.', ',')}`;
    document.getElementById('discount').textContent = `-€${discount.toFixed(2).replace('.', ',')}`;
    document.getElementById('total').textContent = `€${total.toFixed(2).replace('.', ',')}`;
    document.getElementById('item-count').textContent = `${items.length} articol${items.length != 1 ? 'i' : 'o'}`;
  }

  // Check if cart is empty
  function checkEmptyCart() {
    const items = document.querySelectorAll('#cart-items-container .product-card');
    if (items.length === 0) {
      document.getElementById('cart-items-container').classList.add('hidden');
      document.getElementById('empty-cart').classList.remove('hidden');
    }
  }

  // Initialize
  document.addEventListener('DOMContentLoaded', function() {
    generateDecorations();
    setupCart();
  });
</script>
</body>
</html>
