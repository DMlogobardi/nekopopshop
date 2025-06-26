<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - Indirizzi di Spedizione</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/indirizzi.css">
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
          <i class="fas fa-map-marked-alt text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-home text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">Indirizzi</span></h1>
        <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Gestisci dove ricevi i tuoi ordini</p>
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
        <a href="impostazioniutente.jsp" class="folder-tab"><i class="fas fa-cog mr-2"></i> Impostazioni</a>
        <a href="metodipagamento.jsp" class="folder-tab"><i class="fas fa-credit-card mr-2"></i> Pagamenti</a>
        <a href="indirizzi.jsp" class="folder-tab active"><i class="fas fa-map-marker-alt mr-2"></i> Indirizzi</a>
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
          <button onclick="window.location.href='indirizzi.jsp'" class="w-full text-left px-6 py-3 flex items-center font-bold text-nekopeach border-l-4 border-nekopeach">
            <i class="fas fa-map-marker-alt mr-3"></i> I miei indirizzi
          </button>
          <button onclick="window.location.href='metodipagamento.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-credit-card mr-3"></i> Metodi di pagamento
          </button>
          <button onclick="window.location.href='impostazioniutente.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
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
            <i class="fas fa-map-marked-alt mr-3"></i> I tuoi Indirizzi di Spedizione
          </h2>
        </div>

        <div class="p-6">
          <!-- Tabs Navigation -->
          <div class="flex mb-6">
            <div class="form-tab active" onclick="openFormTab('indirizzi-salvati')">
              <i class="fas fa-heart mr-2"></i> Indirizzi Salvati
            </div>
            <div class="form-tab ml-2" onclick="openFormTab('aggiungi-indirizzo')">
              <i class="fas fa-plus mr-2"></i> Aggiungi Indirizzo
            </div>
          </div>

          <!-- Saved Addresses -->
          <div id="indirizzi-salvati" class="form-tab-content active">
            <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
              <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-info-circle mr-2"></i> Gestisci i tuoi indirizzi di spedizione</h4>
              <p class="text-sm text-gray-700">
                Qui puoi gestire tutti gli indirizzi dove desideri ricevere i tuoi acquisti. Puoi aggiungere nuovi indirizzi,
                modificare quelli esistenti o impostarne uno come predefinito per un checkout pi&ugrave rapido.
              </p>
            </div>

            <!-- Address List -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <!-- Default Address -->
              <div class="address-card bg-white p-6 default">
                <div class="flex items-start mb-4">
                  <div class="bg-nekopink w-10 h-10 rounded-full flex items-center justify-center mr-4">
                    <i class="fas fa-home text-nekopeach"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-lg text-gray-800 flex items-center">
                      Casa <span class="address-badge ml-2">Predefinito</span>
                    </h4>
                    <p class="text-sm text-gray-600">Davide Rossi</p>
                  </div>
                </div>
                <div class="mb-4">
                  <p class="text-gray-800">
                    Via del Colosseo 12<br>
                    00184 Roma RM<br>
                    Italia
                  </p>
                </div>
                <div class="text-sm">
                  <p class="text-gray-600 mb-2">
                    <i class="fas fa-phone-alt mr-2"></i> +39 123 4567890
                  </p>
                  <p class="text-gray-600">
                    <i class="fas fa-envelope mr-2"></i> davide.rossi@example.com
                  </p>
                </div>
                <div class="flex justify-end mt-4 space-x-2">
                  <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                    <i class="fas fa-pencil-alt"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </div>

              <!-- Office Address -->
              <div class="address-card bg-white p-6">
                <div class="flex items-start mb-4">
                  <div class="bg-nekopink w-10 h-10 rounded-full flex items-center justify-center mr-4">
                    <i class="fas fa-building text-nekopeach"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-lg text-gray-800">Ufficio</h4>
                    <p class="text-sm text-gray-600">Davide Rossi</p>
                  </div>
                </div>
                <div class="mb-4">
                  <p class="text-gray-800">
                    Via del Corso 123<br>
                    00186 Roma RM<br>
                    Italia
                  </p>
                </div>
                <div class="text-sm">
                  <p class="text-gray-600 mb-2">
                    <i class="fas fa-phone-alt mr-2"></i> +39 123 4567891
                  </p>
                  <p class="text-gray-600">
                    <i class="fas fa-envelope mr-2"></i> davide.rossi@azienda.com
                  </p>
                </div>
                <div class="flex justify-end mt-4 space-x-2">
                  <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                    <i class="fas fa-pencil-alt"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                  <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                    <i class="fas fa-star"></i>
                  </button>
                </div>
              </div>

              <!-- Parent's Address -->
              <div class="address-card bg-white p-6">
                <div class="flex items-start mb-4">
                  <div class="bg-nekopink w-10 h-10 rounded-full flex items-center justify-center mr-4">
                    <i class="fas fa-users text-nekopeach"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-lg text-gray-800">Casa dei Genitori</h4>
                    <p class="text-sm text-gray-600">Famiglia Rossi</p>
                  </div>
                </div>
                <div class="mb-4">
                  <p class="text-gray-800">
                    Viale Europa 42<br>
                    00144 Roma RM<br>
                    Italia
                  </p>
                </div>
                <div class="text-sm">
                  <p class="text-gray-600 mb-2">
                    <i class="fas fa-phone-alt mr-2"></i> +39 123 4567892
                  </p>
                  <p class="text-gray-600">
                    <i class="fas fa-envelope mr-2"></i> rossi.famiglia@example.com
                  </p>
                </div>
                <div class="flex justify-end mt-4 space-x-2">
                  <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                    <i class="fas fa-pencil-alt"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                  <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                    <i class="fas fa-star"></i>
                  </button>
                </div>
              </div>

              <!-- Add New Address -->
              <div class="address-card bg-nekopink/20 border-dashed border-2 border-nekopeach flex items-center justify-center min-h-full cursor-pointer hover:bg-nekopink/30 transition" onclick="openFormTab('aggiungi-indirizzo')">
                <div class="text-center p-6">
                  <div class="w-12 h-12 rounded-full bg-nekopeach flex items-center justify-center mx-auto mb-4">
                    <i class="fas fa-plus text-white text-xl"></i>
                  </div>
                  <h4 class="font-bold text-nekopeach">Aggiungi Nuovo Indirizzo</h4>
                  <p class="text-sm text-gray-600 mt-1">Crea un nuovo indirizzo di spedizione</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Add Address Form -->
          <div id="aggiungi-indirizzo" class="form-tab-content">
            <form id="addAddressForm" method="post" action="AddAddressServlet">
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <!-- Map Preview -->
                <div class="map-container">
                  <i class="fas fa-map-marked-alt text-3xl text-gray-300"></i>
                  <p class="ml-3">Anteprima mappa</p>
                  <div class="map-overlay"></div>
                </div>

                <!-- Address Form -->
                <div>
                  <div class="mb-4">
                    <h4 class="font-bold text-lg text-gray-800 mb-2">Etichetta Indirizzo</h4>
                    <p class="text-sm text-gray-600 mb-3">Assegna un nome a questo indirizzo per riconoscerlo facilmente (es. Casa, Ufficio)</p>
                    <div class="flex flex-wrap gap-2">
                      <button type="button" class="address-label-btn px-4 py-2 rounded-full border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white transition" data-label="Casa">Casa</button>
                      <button type="button" class="address-label-btn px-4 py-2 rounded-full border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white transition" data-label="Ufficio">Ufficio</button>
                      <button type="button" class="address-label-btn px-4 py-2 rounded-full border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white transition" data-label="Genitori">Genitori</button>
                    </div>
                  </div>

                  <div class="input-group">
                    <label for="address-label">Etichetta Personalizzata</label>
                    <input type="text" id="address-label" name="address-label" placeholder="Come vuoi chiamare questo indirizzo?">
                  </div>
                </div>
              </div>

              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="input-group">
                  <label for="full-name">Nome Completo</label>
                  <input type="text" id="full-name" name="full-name" placeholder="Nome e Cognome">
                </div>

                <div class="input-group">
                  <label for="phone">Telefono</label>
                  <input type="tel" id="phone" name="phone" placeholder="+39 123 4567890">
                </div>

                <div class="input-group">
                  <label for="email">Email</label>
                  <input type="email" id="email" name="email" placeholder="tua@email.com">
                </div>

                <div class="input-group">
                  <label for="company">Società (opzionale)</label>
                  <input type="text" id="company" name="company" placeholder="Nome azienda">
                </div>

                <div class="input-group">
                  <label for="address">Indirizzo</label>
                  <input type="text" id="address" name="address" placeholder="Via e numero civico">
                </div>

                <div class="input-group">
                  <label for="address2">Indirizzo 2 (opzionale)</label>
                  <input type="text" id="address2" name="address2" placeholder="Appartamento, piano, etc.">
                </div>

                <div class="input-group">
                  <label for="city">Città</label>
                  <input type="text" id="city" name="city" placeholder="Città">
                </div>

                <div class="input-group">
                  <label for="zip-code">CAP</label>
                  <input type="text" id="zip-code" name="zip-code" placeholder="Codice Postale">
                </div>

                <div class="input-group">
                  <label for="province">Provincia</label>
                  <input type="text" id="province" name="province" placeholder="Sigla Provincia">
                </div>

                <div class="input-group-select">
                  <label for="country">Nazione</label>
                  <select id="country" name="country">
                    <option value="">Seleziona Nazione</option>
                    <option value="IT" selected>Italia</option>
                    <option value="DE">Germania</option>
                    <option value="FR">Francia</option>
                    <option value="ES">Spagna</option>
                    <option value="UK">Regno Unito</option>
                    <option value="US">Stati Uniti</option>
                  </select>
                </div>
              </div>

              <div class="flex items-center mb-6 mt-6">
                <input type="checkbox" id="default-address" name="default-address" class="rounded border-nekopeach text-nekopeach focus:ring-nekopeach">
                <label for="default-address" class="ml-2 block text-sm text-gray-700">
                  Imposta come indirizzo di spedizione predefinito
                </label>
              </div>

              <div class="flex justify-end mt-6">
                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                  Annulla
                </button>
                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                  <i class="fas fa-plus mr-2"></i> Aggiungi Indirizzo
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

  // Switch between form tabs
  function openFormTab(tabName) {
    const tabs = document.querySelectorAll('.form-tab');
    const tabContents = document.querySelectorAll('.form-tab-content');

    tabs.forEach(tab => tab.classList.remove('active'));
    tabContents.forEach(content => content.classList.remove('active'));

    event.currentTarget.classList.add('active');
    document.getElementById(tabName).classList.add('active');

    // Scroll to form
    if (tabName !== 'indirizzi-salvati') {
      document.getElementById(tabName).scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  }

  // Set address label from buttons
  document.querySelectorAll('.address-label-btn').forEach(button => {
    button.addEventListener('click', function() {
      document.getElementById('address-label').value = this.dataset.label;
    });
  });

  // Form validation
  document.getElementById('addAddressForm').addEventListener('submit', function(e) {
    const fullName = document.getElementById('full-name').value;
    const phone = document.getElementById('phone').value;
    const address = document.getElementById('address').value;
    const city = document.getElementById('city').value;
    const zipCode = document.getElementById('zip-code').value;
    const country = document.getElementById('country').value;

    if (!fullName) {
      alert('Inserisci il tuo nome completo');
      e.preventDefault();
      return;
    }

    if (!phone) {
      alert('Inserisci un numero di telefono valido');
      e.preventDefault();
      return;
    }

    if (!address) {
      alert('Inserisci un indirizzo valido');
      e.preventDefault();
      return;
    }

    if (!city) {
      alert('Inserisci una città');
      e.preventDefault();
      return;
    }

    if (!zipCode) {
      alert('Inserisci un codice postale');
      e.preventDefault();
      return;
    }

    if (!country) {
      alert('Seleziona una nazione');
      e.preventDefault();
      return;
    }
  });

  // Initialize the page
  document.addEventListener('DOMContentLoaded', function() {
    createBlossoms();

    // Auto-fill province from zip code (example for Italy)
    document.getElementById('zip-code').addEventListener('blur', function() {
      if (document.getElementById('country').value === 'IT' &&
              this.value.length === 5 &&
              !isNaN(this.value)) {
        // Simple mapping of some Italian CAP to provinces
        const capToProvince = {
          '00100': 'RM', // Rome
          '20100': 'MI', // Milan
          '50100': 'FI', // Florence
          '40100': 'BO', // Bologna
          '16100': 'GE', // Genoa
          '10100': 'TO', // Turin
          '80100': 'NA', // Naples
          '35100': 'PD', // Padua
          '34100': 'TS', // Trieste
          '38100': 'TN'  // Trento
        };

        const province = capToProvince[this.value];
        if (province) {
          document.getElementById('province').value = province;
        }
      }
    });
  });
</script>
</body>
</html>
