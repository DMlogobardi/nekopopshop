<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - Aggiungi Prodotto</title>
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

    @keyframes pulse {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.05); }
    }

    body {
      font-family: 'Nunito', sans-serif;
      background-color: #f0f0f0;

      /* Immagine di background principale */
      background-image: url('frontend/images/sfondo.png');

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

    .badge {
      display: inline-block;
      padding: 3px 8px;
      border-radius: 10px;
      font-size: 0.8rem;
      font-weight: bold;
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

    .avatar-upload .avatar-edit {
      position: absolute;
      right: 0;
      bottom: 0;
      z-index: 1;
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

    .avatar-upload .avatar-edit label:hover {
      transform: scale(1.1);
    }

    .password-toggle {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #6a8cde;
    }

    .password-toggle:hover {
      color: #e55458;
    }

    .registration-steps {
      display: flex;
      justify-content: space-between;
      margin-bottom: 30px;
      position: relative;
    }

    .registration-steps::before {
      content: '';
      position: absolute;
      top: 15px;
      left: 0;
      right: 0;
      height: 3px;
      background-color: #f2d5bb;
      z-index: 1;
    }

    .step {
      position: relative;
      z-index: 2;
      text-align: center;
      width: 30%;
    }

    .step-number {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      background-color: #f2d5bb;
      color: #e55458;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 10px;
      font-weight: bold;
    }

    .step.active .step-number {
      background-color: #e55458;
      color: white;
    }

    .step.completed .step-number {
      background-color: #6a8cde;
      color: white;
    }

    .step-title {
      font-size: 0.9rem;
      color: #666;
    }

    .step.active .step-title {
      color: #e55458;
      font-weight: bold;
    }

    .step.completed .step-title {
      color: #6a8cde;
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

    .image-preview {
      width: 100%;
      height: 200px;
      border: 2px dashed #E55458;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      background-color: #fbd8da50;
      position: relative;
    }

    .image-preview img {
      max-width: 100%;
      max-height: 100%;
      object-fit: contain;
    }

    .remove-image {
      position: absolute;
      top: 5px;
      right: 5px;
      background-color: rgba(229, 84, 88, 0.8);
      color: white;
      border-radius: 50%;
      width: 25px;
      height: 25px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
    }

    .category-tag {
      display: inline-block;
      padding: 4px 8px;
      background-color: #fbd8da;
      border-radius: 15px;
      margin-right: 5px;
      margin-bottom: 5px;
      color: #E55458;
      font-size: 0.8rem;
      cursor: pointer;
      transition: all 0.3s;
    }

    .category-tag.selected {
      background-color: #E55458;
      color: white;
    }

    .tag-input-container {
      position: relative;
    }

    .tag-suggestions {
      position: absolute;
      z-index: 10;
      width: 100%;
      background: white;
      border: 1px solid #E55458;
      border-radius: 0 0 5px 5px;
      max-height: 150px;
      overflow-y: auto;
      display: none;
    }

    .tag-suggestion {
      padding: 5px 10px;
      cursor: pointer;
    }

    .tag-suggestion:hover {
      background-color: #fbd8da;
    }

    .character-counter {
      font-size: 0.8rem;
      text-align: right;
      color: #666;
    }

    .character-counter.warning {
      color: #E55458;
    }

    .character-counter.error {
      color: #f24535;
      font-weight: bold;
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
          <i class="fas fa-plus text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-boxes text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">Aggiungi Prodotto</span></h1>
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
        <a href="aggiungiprodotto.jsp" class="folder-tab active"><i class="fas fa-plus-circle mr-2"></i> Aggiungi</a>
        <a href="modificaprodotto.jsp" class="folder-tab"><i class="fas fa-edit mr-2"></i> Modifica</a>
        <a href="rimuoviprodotto.jsp" class="folder-tab"><i class="fas fa-minus-circle mr-2"></i> Rimuovi</a>
        <a href="logout.jsp" class="folder-tab"><i class="fas fa-sign-out-alt mr-2"></i> Esci</a>
      </div>
    </div>
  </div>

  <!-- Product Form -->
  <div class="max-w-4xl mx-auto">
    <div class="profile-card bg-white border-2 border-nekored">
      <div class="bg-gradient-to-r from-nekopeach to-nekoorange p-4">
        <h2 class="text-xl font-bold text-white flex items-center">
          <i class="fas fa-box-open mr-3" style="font-size: 30px"></i>
          <span style="font-size: 30px">Nuovo Prodotto</span>
        </h2>
      </div>

      <div class="p-6">
        <!-- Product Form Steps -->
        <div class="registration-steps">
          <div class="step active" id="step1">
            <div class="step-number">1</div>
            <div class="step-title">Informazioni base</div>
          </div>
          <div class="step" id="step2">
            <div class="step-number">2</div>
            <div class="step-title">Dettagli prodotto</div>
          </div>
          <div class="step" id="step3">
            <div class="step-number">3</div>
            <div class="step-title">Immagini & Stock</div>
          </div>
          <div class="step" id="step4">
            <div class="step-number">4</div>
            <div class="step-title">Conferma</div>
          </div>
        </div>

        <!-- Step 1: Basic Information -->
        <div class="step-content active" id="step1-content">
          <form id="product-form">
            <div class="mb-6">
              <h3 class="font-bold text-lg text-nekopeach mb-4" style="font-size: 25px">Informazioni base del prodotto</h3>
              <div class="grid grid-cols-1 gap-4">
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-name">Nome prodotto*</label>
                  <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-name" type="text" required>
                  <div class="character-counter" id="name-counter"><span id="name-count">0</span>/100 caratteri</div>
                </div>
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-brand">Marca/Produttore*</label>
                  <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-brand" type="text" required>
                </div>
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-series">Serie/Collezione</label>
                  <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-series" type="text">
                </div>
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-type">Tipo di prodotto*</label>
                  <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-type" required>
                    <option value="">Seleziona un tipo</option>
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

            <div class="flex justify-end">
              <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition next-step" data-next="step2">Avanti</button>
            </div>
          </form>
        </div>

        <!-- Step 2: Product Details -->
        <div class="step-content" id="step2-content">
          <form>
            <div class="mb-6">
              <h3 class="font-bold text-lg text-nekopeach mb-4" style="font-size: 25px">Dettagli del prodotto</h3>
              <div class="grid grid-cols-1 gap-4">
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-description">Descrizione*</label>
                  <textarea class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-description" rows="5" required></textarea>
                  <div class="character-counter" id="desc-counter"><span id="desc-count">0</span>/2000 caratteri</div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="product-anime">Anime/Serie associata*</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-anime" type="text" required>
                  </div>
                  <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="product-character">Personaggio (se applicabile)</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-character" type="text">
                  </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="product-price">Prezzo (&#8364)*</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-price" type="number" min="0" step="0.01" required>
                  </div>
                  <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="product-discount">Sconto (%)</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-discount" type="number" min="0" max="100" value="0">
                  </div>
                </div>
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2">Categorie*</label>
                  <div class="tags-container mb-2">
                    <div class="flex flex-wrap">
                      <span class="category-tag" data-value="anime">Anime</span>
                      <span class="category-tag" data-value="manga">Manga</span>
                      <span class="category-tag" data-value="limited">Edizione Limitata</span>
                      <span class="category-tag" data-value="preorder">Preordine</span>
                      <span class="category-tag" data-value="exclusive">Esclusiva</span>
                      <span class="category-tag" data-value="new">Novit&agrave</span>
                      <span class="category-tag" data-value="sale">In Sconto</span>
                    </div>
                  </div>
                  <div class="tag-input-container">
                    <input type="text" id="category-input" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" placeholder="Aggiungi altre categorie...">
                    <div class="tag-suggestions" id="tag-suggestions"></div>
                    <input type="hidden" id="selected-categories" name="categories" value="">
                  </div>
                </div>
              </div>
            </div>

            <div class="flex justify-between">
              <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition prev-step" data-prev="step1">Indietro</button>
              <button type="button" class="bg-nekopeach text-white px-4 py-2 rounded-lg font-bold hover:bg-nekoorange transition next-step" data-next="step3">Avanti</button>
            </div>
          </form>
        </div>

        <!-- Step 3: Images & Stock -->
        <div class="step-content" id="step3-content">
          <div class="mb-6">
            <h3 class="font-bold text-lg text-nekopeach mb-4" style="font-size: 25px">Immagini & Disponibilit&agrave</h3>
            <div class="grid grid-cols-1 gap-6">
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2">Immagini del prodotto*</label>
                <div class="image-preview" id="image-preview">
                  <div class="text-center p-4">
                    <i class="fas fa-image text-4xl text-nekopeach mb-2"></i>
                    <p>Trascina qui le immagini o clicca per selezionare</p>
                    <p class="text-sm text-gray-500 mt-1">Max. 5 immagini (JPG/PNG, max 5MB ciascuna)</p>
                  </div>
                </div>
                <input type="file" id="product-images" class="hidden" accept="image/*" multiple>
                <div class="mt-2 grid grid-cols-2 md:grid-cols-5 gap-2" id="thumbnail-container"></div>
                <div class="mt-2 flex justify-center">
                  <button type="button" id="upload-btn" class="bg-nekopeach text-white px-4 py-2 rounded-lg font-bold hover:bg-nekoorange transition">
                    <i class="fas fa-upload mr-2"></i> Seleziona immagini
                  </button>
                </div>
              </div>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-stock">Quantit&agrave disponibile*</label>
                  <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-stock" type="number" min="0" required>
                </div>
                <div>
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="product-availability">Disponibilit&agrave*</label>
                  <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-availability" required>
                    <option value="in_stock">Disponibile</option>
                    <option value="preorder">Preordine</option>
                    <option value="out_of_stock">Esaurito</option>
                    <option value="coming_soon">Prossimamente</option>
                  </select>
                </div>
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="product-release">Data di uscita</label>
                <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-release" type="date">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-bold mb-2">Dimensioni (cm)</label>
                <div class="grid grid-cols-3 gap-2">
                  <div>
                    <label class="block text-xs text-gray-500 mb-1">Larghezza</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-width" type="number" min="0" step="0.1">
                  </div>
                  <div>
                    <label class="block text-xs text-gray-500 mb-1">Altezza</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-height" type="number" min="0" step="0.1">
                  </div>
                  <div>
                    <label class="block text-xs text-gray-500 mb-1">Profondit&agrave</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="product-depth" type="number" min="0" step="0.1">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="flex justify-between">
            <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition prev-step" data-prev="step2">Indietro</button>
            <button type="button" class="bg-nekopeach text-white px-4 py-2 rounded-lg font-bold hover:bg-nekoorange transition next-step" data-next="step4">Avanti</button>
          </div>
        </div>

        <!-- Step 4: Confirmation -->
        <div class="step-content" id="step4-content">
          <div class="text-center mb-6">
            <div class="w-24 h-24 mx-auto rounded-full bg-nekopink flex items-center justify-center mb-4">
              <i class="fas fa-check text-nekopeach text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2" style="font-size: 25px">Riepilogo prodotto</h3>
            <p class="text-gray-600 mb-6">Controlla che tutte le informazioni siano corrette prima di aggiungere il prodotto</p>
          </div>

          <div class="bg-nekopink/10 p-6 rounded-xl mb-6">
            <h4 class="font-bold text-nekopeach mb-3">Informazioni base</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <p class="text-sm text-gray-600">Nome prodotto</p>
                <p class="font-medium" id="confirm-name">Nendoroid Hatsune Miku: Sakura Version</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Marca/Produttore</p>
                <p class="font-medium" id="confirm-brand">Good Smile Company</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Tipo prodotto</p>
                <p class="font-medium" id="confirm-type">Nendoroid</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Serie/Collezione</p>
                <p class="font-medium" id="confirm-series">Hatsune Miku - Sakura</p>
              </div>
            </div>
          </div>

          <div class="bg-nekopink/10 p-6 rounded-xl mb-6">
            <h4 class="font-bold text-nekopeach mb-3">Dettagli prodotto</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <p class="text-sm text-gray-600">Anime/Serie</p>
                <p class="font-medium" id="confirm-anime">Vocaloid</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Personaggio</p>
                <p class="font-medium" id="confirm-character">Hatsune Miku</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Prezzo</p>
                <p class="font-medium" id="confirm-price">&#8364 49.99</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Sconto</p>
                <p class="font-medium" id="confirm-discount">10%</p>
              </div>
            </div>
            <div class="mb-4">
              <p class="text-sm text-gray-600">Descrizione</p>
              <p class="font-medium" id="confirm-description">Nendoroid Hatsune Miku nella versione Sakura, con vari accessori e basi a tema primavera...</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Categorie</p>
              <p class="font-medium" id="confirm-categories">Anime, Nendoroid, Novit&agrave, Edizione Limitata</p>
            </div>
          </div>

          <div class="bg-nekopink/10 p-6 rounded-xl mb-6">
            <h4 class="font-bold text-nekopeach mb-3">Disponibilit&agrave & Immagini</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <p class="text-sm text-gray-600">Disponibilit&agrave</p>
                <p class="font-medium" id="confirm-availability">Disponibile</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Quantit&agrave</p>
                <p class="font-medium" id="confirm-stock">15</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Data uscita</p>
                <p class="font-medium" id="confirm-release">15/05/2023</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Dimensioni</p>
                <p class="font-medium" id="confirm-dimensions">10 &times 15 &times 8 cm</p>
              </div>
            </div>
            <div>
              <p class="text-sm text-gray-600">Anteprima immagini</p>
              <div class="flex space-x-2 mt-2" id="confirm-images">
                <div class="w-20 h-20 bg-gray-200 rounded flex items-center justify-center">
                  <i class="fas fa-image text-gray-400"></i>
                </div>
                <div class="w-20 h-20 bg-gray-200 rounded flex items-center justify-center">
                  <i class="fas fa-image text-gray-400"></i>
                </div>
              </div>
            </div>
          </div>

          <div class="flex justify-between">
            <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition prev-step" data-prev="step3">Indietro</button>
            <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg font-bold hover:bg-green-600 transition flex items-center">
              <i class="fas fa-check-circle mr-2"></i> Conferma e aggiungi
            </button>
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

  // Character counters
  const nameInput = document.getElementById('product-name');
  const descInput = document.getElementById('product-description');
  const nameCounter = document.getElementById('name-counter');
  const descCounter = document.getElementById('desc-counter');
  const nameCount = document.getElementById('name-count');
  const descCount = document.getElementById('desc-count');

  nameInput.addEventListener('input', function() {
    const count = this.value.length;
    nameCount.textContent = count;

    if (count > 90 && count <= 100) {
      nameCounter.classList.add('warning');
      nameCounter.classList.remove('error');
    } else if (count > 100) {
      nameCounter.classList.remove('warning');
      nameCounter.classList.add('error');
    } else {
      nameCounter.classList.remove('warning', 'error');
    }
  });

  descInput.addEventListener('input', function() {
    const count = this.value.length;
    descCount.textContent = count;

    if (count > 1900 && count <= 2000) {
      descCounter.classList.add('warning');
      descCounter.classList.remove('error');
    } else if (count > 2000) {
      descCounter.classList.remove('warning');
      descCounter.classList.add('error');
    } else {
      descCounter.classList.remove('warning', 'error');
    }
  });

  // Category tags functionality
  const categoryTags = document.querySelectorAll('.category-tag');
  const categoryInput = document.getElementById('category-input');
  const selectedCategories = document.getElementById('selected-categories');
  const tagSuggestions = document.getElementById('tag-suggestions');

  const availableTags = [
    "Action",
    "Adventure",
    "Comedy",
    "Drama",
    "Fantasy",
    "Horror",
    "Mystery",
    "Romance",
    "Sci-Fi",
    "Slice of Life",
    "Supernatural",
    "Shounen",
    "Shoujo",
    "Seinen",
    "Josei",
    "Mecha",
    "Isekai",
    "Ecchi",
    "Harem",
    "Music",
    "Sports",
    "Game"
  ];

  categoryTags.forEach(tag => {
    tag.addEventListener('click', function() {
      this.classList.toggle('selected');
      updateSelectedCategories();
    });
  });

  categoryInput.addEventListener('input', function() {
    const input = this.value.toLowerCase();
    if (input.length > 0) {
      const filtered = availableTags.filter(tag =>
              tag.toLowerCase().includes(input)
      );

      tagSuggestions.innerHTML = '';
      if (filtered.length > 0) {
        filtered.forEach(tag => {
          const suggestion = document.createElement('div');
          suggestion.className = 'tag-suggestion';
          suggestion.textContent = tag;
          suggestion.addEventListener('click', function() {
            // Check if the suggested tag is already in the predefined tags
            let existingTag = null;
            categoryTags.forEach(t => {
              if (t.textContent.toLowerCase() === tag.toLowerCase()) {
                existingTag = t;
              }
            });

            if (existingTag) {
              existingTag.classList.add('selected');
            } else {
              // Create a new tag if it's not in the predefined ones
              const newTag = document.createElement('span');
              newTag.className = 'category-tag selected';
              newTag.textContent = tag;
              newTag.setAttribute('data-value', tag.toLowerCase().replace(' ', '_'));
              newTag.addEventListener('click', function() {
                this.classList.toggle('selected');
                updateSelectedCategories();
              });

              const tagsContainer = document.querySelector('.tags-container .flex');
              tagsContainer.appendChild(newTag);
            }

            updateSelectedCategories();
            categoryInput.value = '';
            tagSuggestions.style.display = 'none';
          });

          tagSuggestions.appendChild(suggestion);
        });

        tagSuggestions.style.display = 'block';
      } else {
        tagSuggestions.style.display = 'none';
      }
    } else {
      tagSuggestions.style.display = 'none';
    }
  });

  // Close suggestions when clicking outside
  document.addEventListener('click', function(e) {
    if (!categoryInput.contains(e.target) && !tagSuggestions.contains(e.target)) {
      tagSuggestions.style.display = 'none';
    }
  });

  // Add new category when pressing Enter
  categoryInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      const value = this.value.trim();

      if (value.length > 0) {
        // Check if tag already exists
        let exists = false;
        document.querySelectorAll('.category-tag').forEach(tag => {
          if (tag.textContent.toLowerCase() === value.toLowerCase()) {
            exists = true;
            tag.classList.add('selected');
          }
        });

        if (!exists) {
          const newTag = document.createElement('span');
          newTag.className = 'category-tag selected';
          newTag.textContent = value;
          newTag.setAttribute('data-value', value.toLowerCase().replace(' ', '_'));
          newTag.addEventListener('click', function() {
            this.classList.toggle('selected');
            updateSelectedCategories();
          });

          const tagsContainer = document.querySelector('.tags-container .flex');
          tagsContainer.appendChild(newTag);
        }

        updateSelectedCategories();
        this.value = '';
        tagSuggestions.style.display = 'none';
      }
    }
  });

  function updateSelectedCategories() {
    const selected = [];
    document.querySelectorAll('.category-tag.selected').forEach(tag => {
      selected.push(tag.getAttribute('data-value'));
    });

    selectedCategories.value = selected.join(',');
  }

  // Image upload functionality
  const imageUpload = document.getElementById('product-images');
  const uploadBtn = document.getElementById('upload-btn');
  const previewContainer = document.getElementById('image-preview');
  const thumbnailContainer = document.getElementById('thumbnail-container');
  const images = [];

  uploadBtn.addEventListener('click', function() {
    imageUpload.click();
  });

  previewContainer.addEventListener('click', function() {
    imageUpload.click();
  });

  previewContainer.addEventListener('dragover', function(e) {
    e.preventDefault();
    this.classList.add('border-2', 'border-nekopeach', 'bg-nekopink');
  });

  previewContainer.addEventListener('dragleave', function() {
    this.classList.remove('border-2', 'border-nekopeach', 'bg-nekopink');
  });

  previewContainer.addEventListener('drop', function(e) {
    e.preventDefault();
    this.classList.remove('border-2', 'border-nekopeach', 'bg-nekopink');

    if (e.dataTransfer.files.length > 0) {
      handleFiles(e.dataTransfer.files);
    }
  });

  imageUpload.addEventListener('change', function() {
    if (this.files.length > 0) {
      handleFiles(this.files);
    }
  });

  function handleFiles(files) {
    for (let i = 0; i < files.length; i++) {
      const file = files[i];

      if (!file.type.startsWith('image/')) {
        continue;
      }

      if (images.length >= 5) {
        alert('Puoi caricare al massimo 5 immagini per prodotto.');
        break;
      }

      const reader = new FileReader();

      reader.onload = function(e) {
        const img = document.createElement('img');
        img.src = e.target.result;

        // Add to main preview if it's the first image
        if (images.length === 0) {
          previewContainer.innerHTML = '';
          previewContainer.appendChild(img);

          const removeBtn = document.createElement('div');
          removeBtn.className = 'remove-image';
          removeBtn.innerHTML = '<i class="fas fa-times"></i>';
          removeBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            images.splice(0, 1);
            updateThumbnails();

            if (images.length === 0) {
              defaultPreview();
            } else {
              previewContainer.innerHTML = '';
              const newMainImg = document.createElement('img');
              newMainImg.src = images[0].src;
              previewContainer.appendChild(newMainImg);

              const newRemoveBtn = document.createElement('div');
              newRemoveBtn.className = 'remove-image';
              newRemoveBtn.innerHTML = '<i class="fas fa-times"></i>';
              newRemoveBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                images.splice(0, 1);
                updateThumbnails();

                if (images.length === 0) {
                  defaultPreview();
                } else {
                  previewContainer.innerHTML = '';
                  const newMainImg = document.createElement('img');
                  newMainImg.src = images[0].src;
                  previewContainer.appendChild(newMainImg);

                  const newRemoveBtn = document.createElement('div');
                  newRemoveBtn.className = 'remove-image';
                  newRemoveBtn.innerHTML = '<i class="fas fa-times"></i>';
                  newRemoveBtn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    images.splice(0, 1);
                    updateThumbnails();

                    if (images.length === 0) {
                      defaultPreview();
                    }
                  });

                  previewContainer.appendChild(newRemoveBtn);
                }
              });

              previewContainer.appendChild(newRemoveBtn);
            }
          });

          previewContainer.appendChild(removeBtn);
        }

        // Add to thumbnails and images array
        images.push({
          src: e.target.result,
          file: file
        });

        updateThumbnails();
      };

      reader.readAsDataURL(file);
    }
  }

  function updateThumbnails() {
    thumbnailContainer.innerHTML = '';

    for (let i = 0; i < images.length; i++) {
      if (i === 0) continue; // Skip the first image as it's in main preview

      const thumbWrapper = document.createElement('div');
      thumbWrapper.className = 'relative';

      const thumb = document.createElement('img');
      thumb.src = images[i].src;
      thumb.className = 'w-full h-full object-cover rounded cursor-pointer border border-gray-200';
      thumb.addEventListener('click', function() {
        // Swap with main image
        const temp = images[0].src;
        images[0].src = images[i].src;
        images[i].src = temp;

        updateThumbnails();

        previewContainer.innerHTML = '';
        const newMainImg = document.createElement('img');
        newMainImg.src = images[0].src;
        previewContainer.appendChild(newMainImg);

        const removeBtn = document.createElement('div');
        removeBtn.className = 'remove-image';
        removeBtn.innerHTML = '<i class="fas fa-times"></i>';
        removeBtn.addEventListener('click', function(e) {
          e.stopPropagation();
          images.splice(0, 1);
          updateThumbnails();

          if (images.length === 0) {
            defaultPreview();
          } else {
            previewContainer.innerHTML = '';
            const newMainImg = document.createElement('img');
            newMainImg.src = images[0].src;
            previewContainer.appendChild(newMainImg);

            const newRemoveBtn = document.createElement('div');
            newRemoveBtn.className = 'remove-image';
            newRemoveBtn.innerHTML = '<i class="fas fa-times"></i>';
            newRemoveBtn.addEventListener('click', function(e) {
              e.stopPropagation();
              images.splice(0, 1);
              updateThumbnails();

              if (images.length === 0) {
                defaultPreview();
              }
            });

            previewContainer.appendChild(newRemoveBtn);
          }
        });

        previewContainer.appendChild(removeBtn);
      });

      const removeBtn = document.createElement('div');
      removeBtn.className = 'absolute top-0 right-0 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs cursor-pointer';
      removeBtn.innerHTML = '<i class="fas fa-times"></i>';
      removeBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        images.splice(i, 1);
        updateThumbnails();
      });

      thumbWrapper.appendChild(thumb);
      thumbWrapper.appendChild(removeBtn);
      thumbnailContainer.appendChild(thumbWrapper);
    }
  }

  function defaultPreview() {
    previewContainer.innerHTML = `
            <div class="text-center p-4">
                <i class="fas fa-image text-4xl text-nekopeach mb-2"></i>
                <p>Trascina qui le immagini o clicca per selezionare</p>
                <p class="text-sm text-gray-500 mt-1">Max. 5 immagini (JPG/PNG, max 5MB ciascuna)</p>
            </div>
        `;
    thumbnailContainer.innerHTML = '';
  }

  // Step navigation
  document.querySelectorAll('.next-step').forEach(button => {
    button.addEventListener('click', function() {
      const nextStep = this.getAttribute('data-next');
      const currentStep = document.querySelector('.step-content.active');
      const nextStepContent = document.getElementById(`${nextStep}-content`);

      // Validate form before proceeding
      let isValid = true;
      const form = currentStep.querySelector('form');
      if (form) {
        const inputs = form.querySelectorAll('[required]');
        inputs.forEach(input => {
          if (!input.value) {
            isValid = false;
            input.classList.add('border-red-500');
          } else {
            input.classList.remove('border-red-500');
          }
        });
      }

      // Special validation for step 3 (images)
      if (nextStep === 'step4') {
        if (images.length === 0) {
          isValid = false;
          alert('Devi caricare almeno un\'immagine per il prodotto.');
        }

        if (isValid) {
          // Update confirmation data
          document.getElementById('confirm-name').textContent =
                  document.getElementById('product-name').value;
          document.getElementById('confirm-brand').textContent =
                  document.getElementById('product-brand').value;
          document.getElementById('confirm-type').textContent =
                  document.getElementById('product-type').options[document.getElementById('product-type').selectedIndex].text;
          document.getElementById('confirm-series').textContent =
                  document.getElementById('product-series').value || 'N/D';
          document.getElementById('confirm-anime').textContent =
                  document.getElementById('product-anime').value;
          document.getElementById('confirm-character').textContent =
                  document.getElementById('product-character').value || 'N/D';
          document.getElementById('confirm-price').textContent =
                  '€ ' + parseFloat(document.getElementById('product-price').value).toFixed(2);
          document.getElementById('confirm-discount').textContent =
                  document.getElementById('product-discount').value + '%';
          document.getElementById('confirm-description').textContent =
                  document.getElementById('product-description').value.substring(0, 100) + '...';

          // Categories
          const selected = [];
          document.querySelectorAll('.category-tag.selected').forEach(tag => {
            selected.push(tag.textContent);
          });
          document.getElementById('confirm-categories').textContent =
                  selected.join(', ') || 'Nessuna';

          // Availability
          document.getElementById('confirm-availability').textContent =
                  document.getElementById('product-availability').options[document.getElementById('product-availability').selectedIndex].text;
          document.getElementById('confirm-stock').textContent =
                  document.getElementById('product-stock').value;

          // Release date
          const releaseDate = document.getElementById('product-release').value;
          if (releaseDate) {
            const date = new Date(releaseDate);
            document.getElementById('confirm-release').textContent =
                    date.toLocaleDateString('it-IT');
          } else {
            document.getElementById('confirm-release').textContent = 'N/D';
          }

          // Dimensions
          const width = document.getElementById('product-width').value;
          const height = document.getElementById('product-height').value;
          const depth = document.getElementById('product-depth').value;
          if (width || height || depth) {
            document.getElementById('confirm-dimensions').textContent =
                    `${width || '?'} × ${height || '?'} × ${depth || '?'} cm`;
          } else {
            document.getElementById('confirm-dimensions').textContent = 'N/D';
          }

          // Images
          const confirmImages = document.getElementById('confirm-images');
          confirmImages.innerHTML = '';
          for (let i = 0; i < Math.min(images.length, 2); i++) {
            const imgWrapper = document.createElement('div');
            imgWrapper.className = 'w-20 h-20 bg-gray-200 rounded overflow-hidden';

            const img = document.createElement('img');
            img.src = images[i].src;
            img.className = 'w-full h-full object-cover';

            imgWrapper.appendChild(img);
            confirmImages.appendChild(imgWrapper);
          }
        }
      }

      if (isValid) {
        // Update steps
        document.querySelectorAll('.step').forEach(step => {
          step.classList.remove('active');
          if (step.id === nextStep) {
            step.classList.add('active');
          } else if (step.id === currentStep.id.replace('-content', '')) {
            step.classList.add('completed');
          }
        });

        // Update content
        currentStep.classList.remove('active');
        nextStepContent.classList.add('active');
      }
    });
  });

  document.querySelectorAll('.prev-step').forEach(button => {
    button.addEventListener('click', function() {
      const prevStep = this.getAttribute('data-prev');
      const currentStep = document.querySelector('.step-content.active');
      const prevStepContent = document.getElementById(`${prevStep}-content`);

      // Update steps
      document.querySelectorAll('.step').forEach(step => {
        step.classList.remove('active');
        if (step.id === prevStep) {
          step.classList.add('active');
        } else if (step.id === currentStep.id.replace('-content', '')) {
          step.classList.remove('completed');
        }
      });

      // Update content
      currentStep.classList.remove('active');
      prevStepContent.classList.add('active');
    });
  });

  // Form submission
  document.querySelector('#step4-content button[type="submit"]').addEventListener('click', function(e) {
    e.preventDefault();

    // Here you would typically send the data to your server
    // Collect all form data
    const formData = {
      name: document.getElementById('product-name').value,
      brand: document.getElementById('product-brand').value,
      series: document.getElementById('product-series').value,
      type: document.getElementById('product-type').value,
      description: document.getElementById('product-description').value,
      anime: document.getElementById('product-anime').value,
      character: document.getElementById('product-character').value,
      price: document.getElementById('product-price').value,
      discount: document.getElementById('product-discount').value,
      categories: document.getElementById('selected-categories').value,
      stock: document.getElementById('product-stock').value,
      availability: document.getElementById('product-availability').value,
      release: document.getElementById('product-release').value,
      width: document.getElementById('product-width').value,
      height: document.getElementById('product-height').value,
      depth: document.getElementById('product-depth').value,
      images: images
    };

    // Simulate form submission
    console.log('Submitting product data:', formData);
    alert('Prodotto aggiunto con successo!');

    // Reset form after submission (optional)
    document.getElementById('product-form').reset();
    document.querySelectorAll('.category-tag').forEach(tag => {
      tag.classList.remove('selected');
    });
    defaultPreview();
    images.length = 0;

    // Redirect to products list or stay (depending on your needs)
    // window.location.href = 'admin_products.jsp';
  });
</script>
</body>
</html>
