<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - Metodi di Pagamento</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/pagamenti.css">
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
          <i class="fas fa-wallet text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-credit-card text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">Pagamenti</span></h1>
        <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Gestisci i tuoi pagamenti preferiti</p>
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
        <a href="metodipagamento.jsp" class="folder-tab active"><i class="fas fa-credit-card mr-2"></i> Pagamenti</a>
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
          <button onclick="window.location.href='indirizzi.jsp'" class="w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition">
            <i class="fas fa-map-marker-alt mr-3"></i> I miei indirizzi
          </button>
          <button onclick="window.location.href='metodipagamento.jsp'" class="w-full text-left px-6 py-3 flex items-center font-bold text-nekopeach border-l-4 border-nekopeach">
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
            <i class="fas fa-credit-card mr-3"></i> I tuoi Metodi di Pagamento
          </h2>
        </div>

        <div class="p-6">
          <!-- Tabs Navigation -->
          <div class="flex mb-6">
            <div class="form-tab active" onclick="openFormTab('metodi-salvati')">
              <i class="fas fa-heart mr-2"></i> Metodi Salvati
            </div>
            <div class="form-tab ml-2" onclick="openFormTab('aggiungi-carta')">
              <i class="far fa-credit-card mr-2"></i> Aggiungi Carta
            </div>
            <div class="form-tab ml-2" onclick="openFormTab('aggiungi-paypal')">
              <i class="fab fa-paypal mr-2"></i> Aggiungi PayPal
            </div>
          </div>

          <!-- Saved Payment Methods -->
          <div id="metodi-salvati" class="form-tab-content active">
            <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
              <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-info-circle mr-2"></i> Salva i tuoi metodi di pagamento preferiti</h4>
              <p class="text-sm text-gray-700">
                Qui puoi gestire tutti i metodi di pagamento che hai salvato. Puoi aggiungere nuove carte,
                modificare quelle esistenti o impostarne una come predefinita per acquisti pi&ugrave rapidi.
              </p>
            </div>

            <!-- Payment Methods List -->
            <div class="space-y-4">
              <!-- Default Payment Method -->
              <div class="payment-method-item flex items-center relative bg-white">
                <span class="payment-method-default-badge"><i class="fas fa-check mr-1"></i> Predefinito</span>
                <div class="payment-icon">
                  <i class="fab fa-cc-visa"></i>
                </div>
                <div class="flex-grow">
                  <h4 class="font-bold text-gray-800">Carta Visa</h4>
                  <p class="text-gray-600 text-sm">Termina con &#8226&#8226&#8226&#8226 4242 - Scadenza 05/2025</p>
                </div>
                <div class="flex space-x-3">
                  <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                    <i class="fas fa-pencil-alt"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </div>

              <!-- Other Payment Methods -->
              <div class="payment-method-item flex items-center relative bg-white">
                <div class="payment-icon">
                  <i class="fab fa-cc-mastercard"></i>
                </div>
                <div class="flex-grow">
                  <h4 class="font-bold text-gray-800">Carta Mastercard</h4>
                  <p class="text-gray-600 text-sm">Termina con &#8226&#8226&#8226&#8226 5555 - Scadenza 12/2024</p>
                </div>
                <div class="flex space-x-3">
                  <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                    <i class="fas fa-star"></i>
                  </button>
                  <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                    <i class="fas fa-pencil-alt"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </div>

              <div class="payment-method-item flex items-center relative bg-white">
                <div class="payment-icon">
                  <i class="fab fa-paypal"></i>
                </div>
                <div class="flex-grow">
                  <h4 class="font-bold text-gray-800">PayPal</h4>
                  <p class="text-gray-600 text-sm">neko.fan@example.com</p>
                </div>
                <div class="flex space-x-3">
                  <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                    <i class="fas fa-star"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </div>

              <div class="payment-method-item flex items-center relative bg-white">
                <div class="payment-icon">
                  <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="flex-grow">
                  <h4 class="font-bold text-gray-800">Contrassegno</h4>
                  <p class="text-gray-600 text-sm">Paga alla consegna</p>
                </div>
                <div class="flex space-x-3">
                  <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                    <i class="fas fa-star"></i>
                  </button>
                  <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </div>

              <!-- Empty State -->
              <!-- <div class="text-center py-8">
                  <i class="fas fa-credit-card text-4xl text-gray-300 mb-4"></i>
                  <h4 class="text-xl font-bold text-gray-500">Nessun metodo di pagamento salvato</h4>
                  <p class="text-gray-500">Aggiungi il tuo primo metodo di pagamento per un checkout più veloce!</p>
                  <button class="mt-4 px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                      <i class="fas fa-plus mr-2"></i> Aggiungi Pagamento
                  </button>
              </div> -->
            </div>
          </div>

          <!-- Add Credit Card Form -->
          <div id="aggiungi-carta" class="form-tab-content">
            <form id="addCreditCardForm" method="post" action="AddPaymentMethodServlet">
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <!-- Credit Card Preview -->
                <div class="credit-card">
                  <div class="card-type">
                    <i class="fab fa-cc-mastercard"></i>
                  </div>
                  <div class="card-number" id="card-preview-number">•••• •••• •••• ••••</div>
                  <div class="card-expiry" id="card-preview-expiry">Scadenza: MM/AA</div>
                  <div class="card-name" id="card-preview-name">NOME COGNOME</div>
                </div>

                <!-- Credit Card Form -->
                <div>
                  <div class="input-group">
                    <label for="card-number">Numero Carta</label>
                    <div class="relative">
                      <input type="text" id="card-number" name="card-number" placeholder="1234 5678 9012 3456" maxlength="19" oninput="formatCardNumber(this); updateCardPreview()">
                      <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                        <div id="card-brand-icon" class="text-gray-400">
                          <i class="fas fa-credit-card"></i>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="input-group">
                    <label for="card-name">Nome sulla Carta</label>
                    <input type="text" id="card-name" name="card-name" placeholder="Nome Cognome" oninput="updateCardPreview()">
                  </div>

                  <div class="grid grid-cols-2 gap-4">
                    <div class="input-group">
                      <label for="card-expiry">Scadenza</label>
                      <input type="text" id="card-expiry" name="card-expiry" placeholder="MM/AA" maxlength="5" oninput="formatExpiry(this); updateCardPreview()">
                    </div>
                    <div class="input-group">
                      <label for="card-cvv">CVV</label>
                      <div class="relative">
                        <input type="text" id="card-cvv" name="card-cvv" placeholder="•••" maxlength="4">
                        <div class="absolute inset-y-0 right-0 flex items-center pr-3">
                          <i class="fas fa-question-circle text-gray-400 cursor-pointer" title="3 o 4 cifre sul retro della carta"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="flex items-center mb-6">
                <input type="checkbox" id="save-payment" name="save-payment" class="rounded border-nekopeach text-nekopeach focus:ring-nekopeach" checked>
                <label for="save-payment" class="ml-2 block text-sm text-gray-700">
                  Salva questo metodo di pagamento per acquisti futuri
                </label>
              </div>

              <div class="flex items-center mb-6">
                <input type="checkbox" id="default-payment" name="default-payment" class="rounded border-nekopeach text-nekopeach focus:ring-nekopeach">
                <label for="default-payment" class="ml-2 block text-sm text-gray-700">
                  Imposta come metodo di pagamento predefinito
                </label>
              </div>

              <div class="flex justify-end mt-6">
                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                  Annulla
                </button>
                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                  <i class="fas fa-plus mr-2"></i> Aggiungi Carta
                </button>
              </div>
            </form>
          </div>

          <!-- Add PayPal Form -->
          <div id="aggiungi-paypal" class="form-tab-content">
            <form id="addPayPalForm" method="post" action="AddPayPalMethodServlet">
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <!-- PayPal Preview -->
                <div class="credit-card credit-card-paypal">
                  <div class="card-type">
                    <i class="fab fa-paypal"></i>
                  </div>
                  <div class="card-number"><i class="fas fa-user mr-2"></i> <span id="paypal-preview-email">email@esempio.com</span></div>
                  <div class="card-name">Il tuo account PayPal</div>
                  <div class="absolute bottom-5 left-5">
                    <img src="https://www.paypalobjects.com/webstatic/mktg/logo/pp_cc_mark_37x23.jpg" alt="PayPal Logo" width="74" height="46">
                  </div>
                </div>

                <!-- PayPal Form -->
                <div>
                  <div class="input-group">
                    <label for="paypal-email">Email PayPal</label>
                    <input type="email" id="paypal-email" name="paypal-email" placeholder="tua@email.com" oninput="updatePayPalPreview()">
                  </div>

                  <div class="input-group">
                    <label for="paypal-password">Password PayPal</label>
                    <div class="relative">
                      <input type="password" id="paypal-password" name="paypal-password" placeholder="••••••••">
                    </div>
                  </div>

                  <p class="text-xs text-gray-500 mt-3 mb-6">
                    Collegando il tuo account PayPal, autorizzi NekoPopShop a effettuare pagamenti utilizzando questo
                    metodo in base alle <a href="#" class="text-nekopeach hover:underline">Condizioni d'uso di PayPal</a>.
                  </p>
                </div>
              </div>

              <div class="flex items-center mb-6">
                <input type="checkbox" id="save-paypal" name="save-paypal" class="rounded border-nekopeach text-nekopeach focus:ring-nekopeach" checked>
                <label for="save-paypal" class="ml-2 block text-sm text-gray-700">
                  Salva questo metodo di pagamento per acquisti futuri
                </label>
              </div>

              <div class="flex items-center mb-6">
                <input type="checkbox" id="default-paypal" name="default-paypal" class="rounded border-nekopeach text-nekopeach focus:ring-nekopeach">
                <label for="default-paypal" class="ml-2 block text-sm text-gray-700">
                  Imposta come metodo di pagamento predefinito
                </label>
              </div>

              <div class="flex justify-end mt-6">
                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                  Annulla
                </button>
                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                  <i class="fab fa-paypal mr-2"></i> Collega PayPal
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
  }

  // Format card number with spaces
  function formatCardNumber(input) {
    // Remove all non-digit characters
    let value = input.value.replace(/\D/g, '');

    // Add spaces after every 4 digits
    let formattedValue = value.replace(/(\d{4})(?=\d)/g, '$1 ');

    // Limit to 16 digits (4 groups of 4)
    if (formattedValue.length > 19) {
      formattedValue = formattedValue.substring(0, 19);
    }

    input.value = formattedValue;

    // Detect card brand and update icon
    detectCardBrand(value);
  }

  // Format expiry date with slash
  function formatExpiry(input) {
    let value = input.value.replace(/\D/g, '');

    if (value.length > 2) {
      value = value.substring(0, 2) + '/' + value.substring(2, 4);
    }

    if (value.length > 5) {
      value = value.substring(0, 5);
    }

    input.value = value;
  }

  // Detect card brand based on first digits
  function detectCardBrand(number) {
    const cardBrandIcon = document.getElementById('card-brand-icon');

    // Reset to generic icon
    cardBrandIcon.innerHTML = '<i class="fas fa-credit-card"></i>';
    cardBrandIcon.className = 'absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-gray-400';

    if (/^4/.test(number)) {
      // Visa
      cardBrandIcon.innerHTML = '<i class="fab fa-cc-visa"></i>';
      cardBrandIcon.className = 'absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-blue-500';
    } else if (/^5[1-5]/.test(number)) {
      // Mastercard
      cardBrandIcon.innerHTML = '<i class="fab fa-cc-mastercard"></i>';
      cardBrandIcon.className = 'absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-red-500';
    } else if (/^3[47]/.test(number)) {
      // American Express
      cardBrandIcon.innerHTML = '<i class="fab fa-cc-amex"></i>';
      cardBrandIcon.className = 'absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-blue-400';
    } else if (/^6(?:011|5)/.test(number)) {
      // Discover
      cardBrandIcon.innerHTML = '<i class="fab fa-cc-discover"></i>';
      cardBrandIcon.className = 'absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-orange-500';
    } else if (/^(?:2131|1800|35)/.test(number)) {
      // JCB
      cardBrandIcon.innerHTML = '<i class="fab fa-cc-jcb"></i>';
      cardBrandIcon.className = 'absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-red-500';
    }
  }

  // Update card preview with entered values
  function updateCardPreview() {
    const cardNumber = document.getElementById('card-number').value;
    const cardName = document.getElementById('card-name').value;
    const cardExpiry = document.getElementById('card-expiry').value;

    // Update card number preview
    if (cardNumber) {
      const lastFour = cardNumber.replace(/\D/g, '').slice(-4);
      if (lastFour.length > 0) {
        document.getElementById('card-preview-number').textContent = '•••• •••• •••• ' + lastFour;
      } else {
        document.getElementById('card-preview-number').textContent = '•••• •••• •••• ••••';
      }
    } else {
      document.getElementById('card-preview-number').textContent = '•••• •••• •••• ••••';
    }

    // Update card name preview
    if (cardName) {
      document.getElementById('card-preview-name').textContent = cardName.toUpperCase();
    } else {
      document.getElementById('card-preview-name').textContent = 'NOME COGNOME';
    }

    // Update card expiry preview
    if (cardExpiry) {
      document.getElementById('card-preview-expiry').textContent = 'Scadenza: ' + cardExpiry;
    } else {
      document.getElementById('card-preview-expiry').textContent = 'Scadenza: MM/AA';
    }
  }

  // Update PayPal preview with entered email
  function updatePayPalPreview() {
    const email = document.getElementById('paypal-email').value;
    const preview = document.getElementById('paypal-preview-email');

    if (email) {
      preview.textContent = email;
    } else {
      preview.textContent = 'email@esempio.com';
    }
  }

  // Form validation
  document.getElementById('addCreditCardForm').addEventListener('submit', function(e) {
    const cardNumber = document.getElementById('card-number').value.replace(/\D/g, '');
    const cardName = document.getElementById('card-name').value;
    const cardExpiry = document.getElementById('card-expiry').value;
    const cardCvv = document.getElementById('card-cvv').value;

    // Basic validation
    if (cardNumber.length < 16) {
      alert('Inserisci un numero di carta valido');
      e.preventDefault();
      return;
    }

    if (!cardName) {
      alert('Inserisci il nome sulla carta');
      e.preventDefault();
      return;
    }

    if (cardExpiry.length < 5) {
      alert('Inserisci una data di scadenza valida (MM/AA)');
      e.preventDefault();
      return;
    }

    if (cardCvv.length < 3) {
      alert('Inserisri un CVV valido (3 o 4 cifre)');
      e.preventDefault();
      return;
    }
  });

  document.getElementById('addPayPalForm').addEventListener('submit', function(e) {
    const email = document.getElementById('paypal-email').value;
    const password = document.getElementById('paypal-password').value;

    if (!email || !/^\S+@\S+\.\S+$/.test(email)) {
      alert('Inserisci un indirizzo email PayPal valido');
      e.preventDefault();
      return;
    }

    if (!password) {
      alert('Inserisci la password del tuo account PayPal');
      e.preventDefault();
      return;
    }
  });

  // Initialize the page
  document.addEventListener('DOMContentLoaded', function() {
    createBlossoms();

    // Set up event listeners for all input fields to update previews
    document.getElementById('card-number').addEventListener('input', updateCardPreview);
    document.getElementById('card-name').addEventListener('input', updateCardPreview);
    document.getElementById('card-expiry').addEventListener('input', updateCardPreview);
    document.getElementById('paypal-email').addEventListener('input', updatePayPalPreview);
  });
</script>
</body>
</html>
