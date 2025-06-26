<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - La tua Wishlist</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/wishlist.css">
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
          <i class="fas fa-heart text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-heart text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">La tua Wishlist</span></h1>
        <p class="text-xl text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Salva i tuoi articoli preferiti</p>
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
        <a href="wishlist.jsp" class="folder-tab active"><i class="fas fa-heart mr-2"></i> Wishlist</a>
        <a href="ordiniutente.jsp" class="folder-tab"><i class="fas fa-box-open mr-2"></i> Ordini</a>

      </div>
    </div>
  </div>

  <!-- Wishlist Content -->
  <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
    <!-- Left Sidebar - Wishlist Navigation -->
    <div class="lg:col-span-1">
      <div class="profile-card bg-white border-2 border-nekored">
        <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
          <h2 class="text-lg font-bold text-white flex items-center" style="font-size: 30px">
            <i class="fas fa-heart mr-3"></i> Le tue liste
          </h2>
        </div>

        <div class="p-4">
          <!-- Create New List Button -->
          <button class="w-full bg-nekopink hover:bg-nekopeach text-nekopeach hover:text-white font-bold py-2 px-4 rounded-lg mb-4 transition flex items-center justify-center">
            <i class="fas fa-plus mr-2"></i> Crea nuova lista
          </button>

          <!-- Wishlist Categories -->
          <div class="space-y-2">
            <button class="wishlist-pill w-full text-left px-4 py-3 rounded-lg flex items-center text-gray-800 hover:text-white border border-nekopeach active">
              <i class="fas fa-heart mr-3 text-nekopeach"></i>
              <span>Lista Preferiti</span>
              <span class="ml-auto bg-nekopink text-nekopeach rounded-full px-2 py-1 text-xs font-bold">47</span>
            </button>

            <button class="wishlist-pill w-full text-left px-4 py-3 rounded-lg flex items-center text-gray-800 hover:text-white border border-gray-200">
              <i class="fas fa-moon mr-3 text-gray-600"></i>
              <span>Anime da vedere</span>
              <span class="ml-auto bg-gray-200 text-gray-600 rounded-full px-2 py-1 text-xs font-bold">12</span>
            </button>

            <button class="wishlist-pill w-full text-left px-4 py-3 rounded-lg flex items-center text-gray-800 hover:text-white border border-gray-200">
              <i class="fas fa-book-open mr-3 text-gray-600"></i>
              <span>Manga Collection</span>
              <span class="ml-auto bg-gray-200 text-gray-600 rounded-full px-2 py-1 text-xs font-bold">21</span>
            </button>

            <button class="wishlist-pill w-full text-left px-4 py-3 rounded-lg flex items-center text-gray-800 hover:text-white border border-gray-200">
              <i class="fas fa-fighter-jet mr-3 text-gray-600"></i>
              <span>Action Figure</span>
              <span class="ml-auto bg-gray-200 text-gray-600 rounded-full px-2 py-1 text-xs font-bold">9</span>
            </button>

            <button class="wishlist-pill w-full text-left px-4 py-3 rounded-lg flex items-center text-gray-800 hover:text-white border border-gray-200">
              <i class="fas fa-gift mr-3 text-gray-600"></i>
              <span>Idee Regalo</span>
              <span class="ml-auto bg-gray-200 text-gray-600 rounded-full px-2 py-1 text-xs font-bold">5</span>
            </button>
          </div>
        </div>

        <!-- Shared Lists -->
        <div class="border-t border-gray-200 p-4">
          <h3 class="font-bold text-gray-800 mb-3 flex items-center">
            <i class="fas fa-users mr-2 text-gray-600"></i> Liste condivise
          </h3>

          <div class="space-y-2">
            <div class="flex items-center px-3 py-2 rounded-lg bg-gray-100">
              <div class="w-8 h-8 rounded-full bg-nekopink flex items-center justify-center text-nekopeach">
                <i class="fas fa-user"></i>
              </div>
              <div class="ml-3">
                <p class="text-sm font-medium text-gray-800">Lista Compleanno di Luca</p>
                <p class="text-xs text-gray-500">Condivisa da: Marika</p>
              </div>
            </div>

            <div class="flex items-center px-3 py-2 rounded-lg bg-gray-100">
              <div class="w-8 h-8 rounded-full bg-nekopink flex items-center justify-center text-nekopeach">
                <i class="fas fa-user"></i>
              </div>
              <div class="ml-3">
                <p class="text-sm font-medium text-gray-800">Collezione Anime Club</p>
                <p class="text-xs text-gray-500">Condivisa da: Paolo</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Wishlist Stats -->
      <div class="profile-card bg-white border-2 border-nekored mt-6">
        <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
          <h3 class="text-lg font-bold text-white flex items-center" style="font-size: 25px">
            <i class="fas fa-chart-pie mr-3"></i> Statistiche Wishlist
          </h3>
        </div>

        <div class="p-4">
          <div class="grid grid-cols-3 gap-2 text-center mb-4">
            <div class="stats-card bg-nekopink/20 p-2 rounded-lg">
              <div class="text-nekopeach font-bold text-lg">47</div>
              <div class="text-xs text-gray-600">Articoli</div>
            </div>
            <div class="stats-card bg-nekored/20 p-2 rounded-lg">
              <div class="text-nekopeach font-bold text-lg">&#8364 1,284</div>
              <div class="text-xs text-gray-600">Valore totale</div>
            </div>
            <div class="stats-card bg-nekoorange/20 p-2 rounded-lg">
              <div class="text-nekored font-bold text-lg">18</div>
              <div class="text-xs text-gray-600">Disponibili</div>
            </div>
          </div>

          <div class="space-y-3">
            <div>
              <div class="flex justify-between text-xs text-gray-600 mb-1">
                <span>Manga</span>
                <span>23 (49%)</span>
              </div>
              <div class="progress-bar">
                <div class="progress-fill" style="width: 49%; background: linear-gradient(90deg, #E55458, #F29966);"></div>
              </div>
            </div>

            <div>
              <div class="flex justify-between text-xs text-gray-600 mb-1">
                <span>Action Figure</span>
                <span>14 (30%)</span>
              </div>
              <div class="progress-bar">
                <div class="progress-fill" style="width: 30%; background: linear-gradient(90deg, #F29966, #FFC107);"></div>
              </div>
            </div>

            <div>
              <div class="flex justify-between text-xs text-gray-600 mb-1">
                <span>Merchandise</span>
                <span>7 (15%)</span>
              </div>
              <div class="progress-bar">
                <div class="progress-fill" style="width: 15%; background: linear-gradient(90deg, #FFC107, #4CAF50);"></div>
              </div>
            </div>

            <div>
              <div class="flex justify-between text-xs text-gray-600 mb-1">
                <span>Altro</span>
                <span>3 (6%)</span>
              </div>
              <div class="progress-bar">
                <div class="progress-fill" style="width: 6%; background: linear-gradient(90deg, #4CAF50, #2196F3);"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Wishlist Content -->
    <div class="lg:col-span-3">
      <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
        <!-- Wishlist Header -->
        <div class="wishlist-header p-6">
          <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
            <div>
              <h2 class="text-xl font-bold text-white" style="font-size: 30px">Lista Preferiti</h2>
              <p class="text-pink-200">47 articoli salvati</p>
            </div>

            <div class="mt-4 md:mt-0 flex space-x-3">
              <button class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                <i class="fas fa-share-alt mr-2"></i> Condividi
              </button>
              <button class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                <i class="fas fa-sort mr-2"></i> Ordina
              </button>
              <button class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                <i class="fas fa-search mr-2"></i> Cerca
              </button>
            </div>
          </div>
        </div>

        <!-- Wishlist Filter -->
        <div class="wishlist-filter border-b border-gray-200 px-6 py-3 flex flex-wrap items-center gap-2">
          <button class="flex items-center text-sm bg-gray-100 hover:bg-gray-200 px-3 py-1 rounded-full transition">
            <span>Tutto</span>
            <span class="ml-2 bg-gray-300 rounded-full px-2 py-0.5 text-xs">47</span>
          </button>

          <button class="flex items-center text-sm bg-gray-100 hover:bg-gray-200 px-3 py-1 rounded-full transition">
            <span>Disponibili</span>
            <span class="ml-2 bg-gray-300 rounded-full px-2 py-0.5 text-xs">18</span>
          </button>

          <button class="flex items-center text-sm bg-gray-100 hover:bg-gray-200 px-3 py-1 rounded-full transition">
            <span>Preordini</span>
            <span class="ml-2 bg-gray-300 rounded-full px-2 py-0.5 text-xs">6</span>
          </button>

          <button class="flex items-center text-sm bg-gray-100 hover:bg-gray-200 px-3 py-1 rounded-full transition">
            <span>Esauriti</span>
            <span class="ml-2 bg-gray-300 rounded-full px-2 py-0.5 text-xs">23</span>
          </button>

          <button class="flex items-center text-sm bg-gray-100 hover:bg-gray-200 px-3 py-1 rounded-full transition">
            <i class="fas fa-tag mr-1 text-nekopeach"></i>
            <span>Scontati</span>
          </button>

          <button class="flex items-center text-sm bg-gray-100 hover:bg-gray-200 px-3 py-1 rounded-full transition">
            <i class="fas fa-fire mr-1 text-red-500"></i>
            <span>Trending</span>
          </button>
        </div>

        <!-- Wishlist Items -->
        <div class="p-6">
          <!-- Empty Wishlist State (hidden by default) -->
          <div class="empty-wishlist hidden">
            <i class="fas fa-heart-broken text-5xl text-gray-300 mb-4"></i>
            <h3 class="text-xl font-bold text-gray-600 mb-2">La tua wishlist &egrave vuota</h3>
            <p class="text-gray-500 mb-4">Aggiungi articoli che ti interessano cliccando sull'icona del cuore</p>
            <button class="bg-nekopeach hover:bg-nekored text-white font-bold py-2 px-6 rounded-full transition">
              Esplora il catalogo
            </button>
          </div>

          <!-- Wishlist Items Grid -->
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Wishlist Item 1 -->
            <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200">
              <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                  <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=500" alt="Jujutsu Kaisen Vol.15" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                  <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                  <button class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                    <i class="fas fa-shopping-cart text-xs"></i>
                  </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                  <span class="text-xs text-white bg-nekopeach px-2 py-1 rounded-full">Manga</span>
                  <span class="text-xs text-gray-500">Codice: #JKS015</span>
                </div>

                <div class="mb-1">
                  <div class="flex justify-between items-center">
                    <span class="text-xs font-medium text-gray-500">Disponibilit&agrave:</span>
                    <span class="text-xs font-bold text-green-600">In stock</span>
                  </div>
                  <div class="stock-indicator stock-in mt-1"></div>
                </div>
              </div>

              <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">Jujutsu Kaisen Vol.15</h3>
              <p class="text-xs text-gray-500 mb-2">Gege Akutami</p>

              <div class="flex justify-between items-center">
                <div>
                  <span class="font-bold text-nekopeach">&#8364 14.99</span>
                  <span class="text-xs text-gray-500 ml-1 line-through">&#8364 19.99</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-star text-yellow-400 text-xs"></i>
                  <span class="text-xs text-gray-600 ml-1">4.8</span>
                </div>
              </div>
            </div>

            <!-- Wishlist Item 2 -->
            <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200">
              <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                  <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=500" alt="Chainsaw Man Figure" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                  <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                  <button class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                    <i class="fas fa-shopping-cart text-xs"></i>
                  </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                  <span class="text-xs text-white bg-nekoorange px-2 py-1 rounded-full">Action Figure</span>
                  <span class="text-xs text-gray-500">Codice: #CSM001</span>
                </div>

                <div class="mb-1">
                  <div class="flex justify-between items-center">
                    <span class="text-xs font-medium text-gray-500">Disponibilit&agrave:</span>
                    <span class="text-xs font-bold text-yellow-600">Ultimi 3</span>
                  </div>
                  <div class="stock-indicator stock-low mt-1" style="width: 20%"></div>
                </div>
              </div>

              <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">Chainsaw Man - Denji Figure</h3>
              <p class="text-xs text-gray-500 mb-2">Tatsuki Fujimoto</p>

              <div class="flex justify-between items-center">
                <div>
                  <span class="font-bold text-nekopeach">&#8364 59.99</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-star text-yellow-400 text-xs"></i>
                  <span class="text-xs text-gray-600 ml-1">4.9</span>
                </div>
              </div>
            </div>

            <!-- Wishlist Item 3 -->
            <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200">
              <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                  <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=500" alt="Attack on Titan Figurine" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                  <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                  <button class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                    <i class="fas fa-shopping-cart text-xs"></i>
                  </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                  <span class="text-xs text-white bg-nekopink px-2 py-1 rounded-full">Preordine</span>
                  <span class="text-xs text-gray-500">Codice: #AOT204</span>
                </div>

                <div class="mb-1">
                  <div class="flex justify-between items-center">
                    <span class="text-xs font-medium text-gray-500">Disponibile dal:</span>
                    <span class="text-xs font-bold text-blue-500">15/12/23</span>
                  </div>
                  <div class="stock-indicator bg-gray-200 mt-1"></div>
                </div>
              </div>

              <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">Attack on Titan - Levi Figurine</h3>
              <p class="text-xs text-gray-500 mb-2">Hajime Isayama</p>

              <div class="flex justify-between items-center">
                <div>
                  <span class="font-bold text-nekopeach">&#8364 79.99</span>
                  <span class="text-xs text-gray-500 ml-1 line-through">&#8364 89.99</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-star text-yellow-400 text-xs"></i>
                  <span class="text-xs text-gray-600 ml-1">5.0</span>
                </div>
              </div>
            </div>

            <!-- Wishlist Item 4 -->
            <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200">
              <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                  <img src="https://images.unsplash.com/photo-1620898854390-d301eb3715a4?q=80&w=500" alt="Demon Slayer T-Shirt" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                  <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                  <button class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                    <i class="fas fa-shopping-cart text-xs"></i>
                  </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                  <span class="text-xs text-white bg-purple-500 px-2 py-1 rounded-full">Merchandise</span>
                  <span class="text-xs text-gray-500">Codice: #DS987</span>
                </div>

                <div class="mb-1">
                  <div class="flex justify-between items-center">
                    <span class="text-xs font-medium text-gray-500">Disponibilit&agrave:</span>
                    <span class="text-xs font-bold text-red-600">Esaurito</span>
                  </div>
                  <div class="stock-indicator stock-out mt-1"></div>
                </div>
              </div>

              <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">Demon Slayer - Zenitsu T-Shirt</h3>
              <p class="text-xs text-gray-500 mb-2">Koyoharu Gotouge</p>

              <div class="flex justify-between items-center">
                <div>
                  <span class="font-bold text-gray-400">&#8364 24.99</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-star text-yellow-400 text-xs"></i>
                  <span class="text-xs text-gray-600 ml-1">4.5</span>
                </div>
              </div>
            </div>

            <!-- Wishlist Item 5 -->
            <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200">
              <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                  <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=500" alt="Tokyo Revengers Vol.1" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                  <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                  <button class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                    <i class="fas fa-shopping-cart text-xs"></i>
                  </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                  <span class="text-xs text-white bg-nekopeach px-2 py-1 rounded-full">Manga</span>
                  <span class="text-xs text-gray-500">Codice: #TR001</span>
                </div>

                <div class="mb-1">
                  <div class="flex justify-between items-center">
                    <span class="text-xs font-medium text-gray-500">Disponibilit&agrave:</span>
                    <span class="text-xs font-bold text-green-600">In stock</span>
                  </div>
                  <div class="stock-indicator stock-in mt-1"></div>
                </div>
              </div>

              <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">Tokyo Revengers Vol.1</h3>
              <p class="text-xs text-gray-500 mb-2">Ken Wakui</p>

              <div class="flex justify-between items-center">
                <div>
                  <span class="font-bold text-nekopeach">&#8364 12.99</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-star text-yellow-400 text-xs"></i>
                  <span class="text-xs text-gray-600 ml-1">4.7</span>
                </div>
              </div>
            </div>

            <!-- Wishlist Item 6 -->
            <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200">
              <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                  <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=500" alt="My Hero Academia Poster" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                  <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                  <button class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                    <i class="fas fa-shopping-cart text-xs"></i>
                  </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                  <span class="text-xs text-white bg-blue-500 px-2 py-1 rounded-full">Poster</span>
                  <span class="text-xs text-gray-500">Codice: #MHA432</span>
                </div>

                <div class="mb-1">
                  <div class="flex justify-between items-center">
                    <span class="text-xs font-medium text-gray-500">Disponibilit&agrave:</span>
                    <span class="text-xs font-bold text-green-600">In stock</span>
                  </div>
                  <div class="stock-indicator stock-in mt-1"></div>
                </div>
              </div>

              <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">My Hero Academia - Poster Deku</h3>
              <p class="text-xs text-gray-500 mb-2">Kohei Horikoshi</p>

              <div class="flex justify-between items-center">
                <div>
                  <span class="font-bold text-nekopeach">&#8364 14.99</span>
                  <span class="text-xs text-gray-500 ml-1 line-through">&#8364 19.99</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-star text-yellow-400 text-xs"></i>
                  <span class="text-xs text-gray-600 ml-1">4.8</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Pagination -->
          <div class="mt-8 flex justify-center">
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

              <span class="px-2 text-gray-500">...</span>

              <button class="w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100">
                8
              </button>

              <button class="w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100">
                <i class="fas fa-chevron-right text-xs"></i>
              </button>
            </nav>
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

  // Function to handle tab switching
  function setupTabs() {
    const tabBtns = document.querySelectorAll('.tab-btn');

    tabBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        const tabId = btn.getAttribute('data-tab');
        const tabContent = document.getElementById(`${tabId}-tab`);

        // Hide all tab contents
        document.querySelectorAll('.tab-content').forEach(content => {
          content.classList.remove('active');
        });

        // Show selected tab content
        if (tabContent) {
          tabContent.classList.add('active');
        }

        // Update active state of buttons
        tabBtns.forEach(b => {
          b.classList.remove('active');
          b.classList.add('text-gray-600');
          b.classList.remove('text-nekopeach');
        });

        btn.classList.add('active', 'text-nekopeach');
        btn.classList.remove('text-gray-600');
      });
    });
  }

  // Function to handle wishlist pills
  function setupWishlistPills() {
    const pills = document.querySelectorAll('.wishlist-pill');

    pills.forEach(pill => {
      pill.addEventListener('click', () => {
        pills.forEach(p => {
          p.classList.remove('active', 'bg-nekopeach', 'text-white');
          p.classList.add('border-gray-200');
        });

        pill.classList.add('active', 'bg-nekopeach', 'text-white');
        pill.classList.remove('border-gray-200');

        // Here you would typically filter the wishlist items
        // based on the selected category
      });
    });
  }

  // Function to handle image upload preview
  function setupImageUpload() {
    const imageUpload = document.getElementById('imageUpload');

    if (imageUpload) {
      imageUpload.addEventListener('change', function(e) {
        if (e.target.files.length > 0) {
          const reader = new FileReader();

          reader.onload = function(e) {
            const preview = document.getElementById('imagePreview');
            preview.style.backgroundImage = `url(${e.target.result})`;
          };

          reader.readAsDataURL(e.target.files[0]);
        }
      });
    }
  }

  // Initialize everything when the DOM is loaded
  document.addEventListener('DOMContentLoaded', () => {
    createCherryBlossoms();
    setupTabs();
    setupWishlistPills();
    setupImageUpload();
  });
</script>
</body>
</html>