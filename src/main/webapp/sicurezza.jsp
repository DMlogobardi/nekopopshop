<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - Modifica Profilo</title>
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
      font-family: 'Milkyway';
      src: url('frontend/fonts/Milkyway_DEMO.ttf') format('woff2'),
      url('frontend/fonts/Milkyway_DEMO.ttf') format('woff');
      font-weight: normal;
      font-style: normal;
      font-display: swap;
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
      background-image: url('frontend/images/sfondo.png');
      background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
      min-height: 100vh;
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

    .progress-bar {
      height: 8px;
      border-radius: 4px;
      background-color: #f2d5bb;
      overflow: hidden;
    }

    .progress-fill {
      height: 100%;
      background: linear-gradient(90deg, #E55458, #F29966);
      border-radius: 4px;
    }

    .avatar-upload {
      position: relative;
      width: 120px;
      height: 120px;
      margin: 0 auto;
    }

    .avatar-upload .avatar-preview {
      width: 100%;
      height: 100%;
      border-radius: 50%;
      border: 3px solid #E55458;
      background-color: #fbd8da;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .avatar-upload .avatar-edit input {
      display: none;
    }

    .avatar-upload .avatar-edit label {
      display: inline-block;
      width: 40px;
      height: 40px;
      margin-bottom: 0;
      border-radius: 50%;
      background: linear-gradient(145deg, #E55458, #F29966);
      border: 2px solid white;
      cursor: pointer;
      font-weight: normal;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
    }

    .input-group {
      position: relative;
      margin-bottom: 1.5rem;
    }

    .input-group input {
      width: 100%;
      padding: 0.75rem;
      border: 2px solid #f2d5bb;
      border-radius: 10px;
      background-color: #fff;
      transition: all 0.3s ease;
    }

    .input-group input:focus {
      border-color: #E55458;
      box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.2);
      outline: none;
    }

    .input-group label {
      position: absolute;
      left: 0.75rem;
      top: -0.75rem;
      padding: 0 0.25rem;
      background-color: white;
      color: #E55458;
      font-size: 0.8rem;
      font-weight: bold;
    }

    .toggle-password {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #999;
    }

    .toggle-password:hover {
      color: #E55458;
    }

    .form-tab {
      padding: 0.75rem 1.5rem;
      border-radius: 10px 10px 0 0;
      background-color: #f2d5bb;
      color: #E55458;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .form-tab.active {
      background-color: #E55458;
      color: white;
    }

    .form-tab-content {
      display: none;
    }

    .form-tab-content.active {
      display: block;
      animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .text-3xl {
      font-family: 'Milkyway', sans-serif;
      font-size: 2.5rem;
      color: #333;
    }
    .text-xl{
      font-family: 'Milkyway', sans-serif;
      font-size: 2.5rem;
      color: #333;
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
          <i class="fas fa-cog text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-user-cog text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">Sicurezza</span></h1>
        <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Modifica i tuoi dati personali</p>
      </div>
    </div>

    <!-- Navigation -->
    <div class="w-full lg:w-auto">
      <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
        <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
        <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
        <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
        <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
        <a href="admin.jsp" class="folder-tab"><i class="fas fa-user-shield mr-2"></i> Admin</a>
        <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
        <a href="impostazioniutente.jsp" class="folder-tab active"><i class="fas fa-cog mr-2"></i> Impostazioni</a>
      </div>
    </div>
  </div>

  <!-- Main Content -->
  <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
    <!-- Left Sidebar -->
    <div class="lg:col-span-1">
      <div class="profile-card bg-white border-2 border-nekopeach">
        <!-- Avatar Section -->
        <div class="p-6 text-center">
          <div class="avatar-upload">
            <div class="avatar-preview">
              <img id="imagePreview" src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400" alt="User Avatar" class="w-full h-full object-cover">
            </div>
          </div>

          <h3 class="text-2xl font-bold mt-4 text-gray-800">NekoFan123</h3>
          <p class="text-gray-600">Membro Premium<br>Membro dal: 15/03/2022</p>
        </div>

        <!-- Navigation -->
        <div class="border-t border-gray-200">
          <button onclick="window.location.href='utente.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-tachometer-alt mr-3"></i> Dashboard
          </button>
          <button onclick="window.location.href='ordiniutente.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-shopping-bag mr-3"></i> I miei ordini
          </button>
          <button onclick="window.location.href='wishlist.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-heart mr-3"></i> Lista desideri
          </button>
          <button onclick="window.location.href='premi.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-trophy mr-3"></i> I miei premi
          </button>
          <button onclick="window.location.href='impostazioniutente.jsp'" class="w-full text-left px-6 py-3 flex items-center font-bold text-nekopeach border-l-4 border-nekopeach">
            <i class="fas fa-cog mr-3"></i> Impostazioni
          </button>
          <button class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-sign-out-alt mr-3"></i> Esci
          </button>
        </div>
      </div>
    </div>

    <!-- Right Content -->
    <div class="lg:col-span-3">
      <div class="profile-card bg-white border-2 border-nekopeach">
        <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
          <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
            <i class="fas fa-user-edit mr-3"></i> Modifica Profilo
          </h2>
        </div>

        <div class="p-6">
          <!-- Tabs Navigation -->
          <div class="flex mb-6">
            <div class="form-tab active" onclick="openFormTab('dati-personali')">
              <i class="fas fa-user mr-2"></i> Dati Personali
            </div>
            <div class="form-tab ml-2" onclick="openFormTab('cambio-email')">
              <i class="fas fa-envelope mr-2"></i> Cambio Email
            </div>
            <div class="form-tab ml-2" onclick="openFormTab('cambio-password')">
              <i class="fas fa-lock mr-2"></i> Cambio Password
            </div>
          </div>

          <!-- Personal Data Form -->
          <div id="dati-personali" class="form-tab-content active">
            <form id="personalDataForm" method="post" action="UpdateUserServlet">
              <div class="input-group">
                <label for="username">Nome Utente</label>
                <input type="text" id="username" name="username" value="NekoFan123" required>
              </div>

              <div class="input-group">
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" value="Mario">
              </div>

              <div class="input-group">
                <label for="cognome">Cognome</label>
                <input type="text" id="cognome" name="cognome" value="Rossi">
              </div>

              <div class="input-group">
                <label for="data-nascita">Data di Nascita</label>
                <input type="date" id="data-nascita" name="data-nascita" value="1990-05-15">
              </div>

              <div class="input-group">
                <label for="indirizzo">Indirizzo</label>
                <input type="text" id="indirizzo" name="indirizzo" value="Via Roma 123, Milano">
              </div>

              <div class="input-group">
                <label for="telefono">Telefono</label>
                <input type="tel" id="telefono" name="telefono" value="+39 1234567890">
              </div>

              <div class="flex justify-end mt-6">
                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                  Annulla
                </button>
                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                  Salva Modifiche
                </button>
              </div>
            </form>
          </div>

          <!-- Email Change Form -->
          <div id="cambio-email" class="form-tab-content">
            <form id="emailChangeForm" method="post" action="UpdateEmailServlet">
              <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-info-circle mr-2"></i> Informazioni importanti</h4>
                <p class="text-sm text-gray-700">
                  Cambiando l'email, dovrai confermare la nuova indirizzo email attraverso un link che ti invieremo.
                  Fino alla conferma, continuerai a utilizzare la tua email attuale per accedere.
                </p>
              </div>

              <div class="input-group">
                <label for="current-email">Email attuale</label>
                <input type="email" id="current-email" value="neko.fan@example.com" readonly>
              </div>

              <div class="input-group">
                <label for="new-email">Nuova Email</label>
                <input type="email" id="new-email" name="new-email" required>
              </div>

              <div class="input-group">
                <label for="confirm-email">Conferma Nuova Email</label>
                <input type="email" id="confirm-email" name="confirm-email" required>
              </div>

              <div class="input-group">
                <label for="password-email">Password Attuale</label>
                <div class="relative">
                  <input type="password" id="password-email" name="password" required>
                  <i class="toggle-password fas fa-eye" onclick="togglePassword('password-email')"></i>
                </div>
              </div>

              <div class="flex justify-end mt-6">
                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                  Annulla
                </button>
                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                  Cambia Email
                </button>
              </div>
            </form>
          </div>

          <!-- Password Change Form -->
          <div id="cambio-password" class="form-tab-content">
            <form id="passwordChangeForm" method="post" action="UpdatePasswordServlet">
              <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-shield-alt mr-2"></i> Sicurezza Password</h4>
                <p class="text-sm text-gray-700">
                  Per la tua sicurezza, assicurati che la nuova password sia lunga almeno 8 caratteri e
                  includa numeri, lettere maiuscole e minuscole e caratteri speciali.
                </p>
              </div>

              <div class="input-group">
                <label for="current-password">Password Attuale</label>
                <div class="relative">
                  <input type="password" id="current-password" name="current-password" required>
                  <i class="toggle-password fas fa-eye" onclick="togglePassword('current-password')"></i>
                </div>
              </div>

              <div class="input-group">
                <label for="new-password">Nuova Password</label>
                <div class="relative">
                  <input type="password" id="new-password" name="new-password" required>
                  <i class="toggle-password fas fa-eye" onclick="togglePassword('new-password')"></i>
                </div>
                <div id="password-strength" class="text-xs mt-1"></div>
              </div>

              <div class="input-group">
                <label for="confirm-password">Conferma Nuova Password</label>
                <div class="relative">
                  <input type="password" id="confirm-password" name="confirm-password" required>
                  <i class="toggle-password fas fa-eye" onclick="togglePassword('confirm-password')"></i>
                </div>
                <div id="password-match" class="text-xs mt-1"></div>
              </div>

              <div class="flex justify-end mt-6">
                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                  Annulla
                </button>
                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                  Cambia Password
                </button>
              </div>
            </form>
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
      <div>
        <div class="flex items-center mb-4">
          <div class="w-10 h-10 rounded-full bg-white flex items-center justify-center">
            <i class="fas fa-paw text-nekopink text-2xl"></i>
          </div>
          <h4 class="font-bold text-xl ml-3 text-white">NekoPop Shop</h4>
        </div>
        <p class="text-pink-100">Il tuo negozio preferito per manga e action figure, fornito da appassionati per appassionati!</p>
      </div>

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
  // Add cherry blossom decorations
  function createBlossoms() {
    const container = document.createElement('div');
    container.id = 'decorations';
    document.body.prepend(container);

    for (let i = 0; i < 15; i++) {
      const blossom = document.createElement('div');
      blossom.className = 'cherry-blossom';
      blossom.style.left = `${Math.random() * 100}%`;
      blossom.style.animationDuration = `${10 + Math.random() * 15}s`;
      blossom.style.animationDelay = `${Math.random() * 5}s`;
      blossom.style.opacity = '0.7';
      container.appendChild(blossom);
    }
  }

  // Toggle password visibility
  function togglePassword(id) {
    const input = document.getElementById(id);
    const icon = input.nextElementSibling;
    if (input.type === 'password') {
      input.type = 'text';
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    } else {
      input.type = 'password';
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    }
  }

  // Switch between form tabs
  function openFormTab(tabName) {
    const tabs = document.querySelectorAll('.form-tab');
    const tabContents = document.querySelectorAll('.form-tab-content');

    tabs.forEach(tab => tab.classList.remove('active'));
    tabContents.forEach(content => content.classList.remove('active'));

    event.currentTarget.classList.add('active');
    document.getElementById(tabName).classList.add('active');
  }

  // Password strength indicator
  document.getElementById('new-password').addEventListener('input', function() {
    const password = this.value;
    const strengthIndicator = document.getElementById('password-strength');

    // Reset
    strengthIndicator.textContent = '';
    strengthIndicator.className = 'text-xs mt-1';

    if (password.length === 0) return;

    // Check password strength
    let strength = 0;
    if (password.length >= 8) strength++;
    if (password.match(/[A-Z]/)) strength++;
    if (password.match(/[a-z]/)) strength++;
    if (password.match(/[0-9]/)) strength++;
    if (password.match(/[^A-Za-z0-9]/)) strength++;

    // Display strength
    if (strength <= 2) {
      strengthIndicator.textContent = 'Debole';
      strengthIndicator.className = 'text-xs mt-1 text-red-500';
    } else if (strength <= 4) {
      strengthIndicator.textContent = 'Media';
      strengthIndicator.className = 'text-xs mt-1 text-yellow-500';
    } else {
      strengthIndicator.textContent = 'Forte';
      strengthIndicator.className = 'text-xs mt-1 text-green-500';
    }
  });

  // Password match validation
  document.getElementById('confirm-password').addEventListener('input', function() {
    const newPassword = document.getElementById('new-password').value;
    const confirmPassword = this.value;
    const matchIndicator = document.getElementById('password-match');

    if (confirmPassword.length === 0) {
      matchIndicator.textContent = '';
      return;
    }

    if (newPassword === confirmPassword) {
      matchIndicator.textContent = 'Le password coincidono';
      matchIndicator.className = 'text-xs mt-1 text-green-500';
    } else {
      matchIndicator.textContent = 'Le password non coincidono';
      matchIndicator.className = 'text-xs mt-1 text-red-500';
    }
  });

  // Form validation
  document.getElementById('emailChangeForm').addEventListener('submit', function(e) {
    const newEmail = document.getElementById('new-email').value;
    const confirmEmail = document.getElementById('confirm-email').value;

    if (newEmail !== confirmEmail) {
      alert('Le email non coincidono!');
      e.preventDefault();
    }
  });

  document.getElementById('passwordChangeForm').addEventListener('submit', function(e) {
    const newPassword = document.getElementById('new-password').value;
    const confirmPassword = document.getElementById('confirm-password').value;

    if (newPassword !== confirmPassword) {
      alert('Le password non coincidono!');
      e.preventDefault();
    }
  });

  // Initialize the page
  document.addEventListener('DOMContentLoaded', function() {
    createBlossoms();
  });
</script>
</body>
</html>
