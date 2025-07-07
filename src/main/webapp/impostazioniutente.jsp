<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Impostazioni Utente</title>
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
            src: url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff2'),
            url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff');
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

        .order-card {
            transition: all 0.3s ease;
            border-left: 4px solid #E55458;
        }

        .order-card:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
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

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .stats-card {
            transition: all 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(229, 84, 88, 0.2);
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            width: 20px;
            height: 20px;
            background-color: #E55458;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: bold;
        }

        .text-3xl {
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }

        .text-xl {
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }

        .text-lg {
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }

        .fa-star, .fas, .far {
            font-style: normal !important;
        }

        /* Custom styles for settings page */
        .settings-tab {
            transition: all 0.3s ease;
            border-bottom: 3px solid transparent;
        }

        .settings-tab:hover, .settings-tab.active {
            border-bottom-color: #E55458;
            color: #E55458;
        }

        .security-indicator {
            height: 8px;
            border-radius: 4px;
            background-color: #f2d5bb;
        }

        .security-strong {
            background: linear-gradient(90deg, #4CAF50, #8BC34A);
        }

        .security-medium {
            background: linear-gradient(90deg, #FFC107, #FF9800);
        }

        .security-weak {
            background: linear-gradient(90deg, #F44336, #E91E63);
        }

        .payment-card {
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
        }

        .payment-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.1);
        }

        .address-card {
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
        }

        .address-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.1);
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 24px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .toggle-slider {
            background: linear-gradient(90deg, #E55458, #F29966);
        }

        input:checked + .toggle-slider:before {
            transform: translateX(26px);
        }

        .form-input {
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
        }

        .form-input:focus {
            border-color: #E55458;
            box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.2);
        }

        .form-label {
            transition: all 0.3s ease;
        }

        .form-input:focus + .form-label {
            color: #E55458;
        }

        .verification-badge {
            background: linear-gradient(90deg, #4CAF50, #8BC34A);
            color: white;
        }

        .verification-pending {
            background: linear-gradient(90deg, #FFC107, #FF9800);
            color: white;
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
                <h1 class="text-3xl font-bold"><span class="nekotag">Impostazioni Utente</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 25px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Gestisci il tuo account</p>
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
                <a href="wishlist.jsp" class="folder-tab "><i class="fas fa-heart mr-2"></i> Wishlist</a>
                <a href="ordiniutente.jsp" class="folder-tab"><i class="fas fa-box-open mr-2"></i> Ordini</a>
            </div>
        </div>
    </div>

    <!-- Settings Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Settings Navigation -->
        <div class="lg:col-span-1">
            <div class="profile-card bg-white border-2 border-nekored">
                <!-- User Profile Summary -->
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <div class="flex items-center">
                        <div class="avatar-upload">
                            <div class="avatar-preview" id="imagePreview" style="background-image: url('https://randomuser.me/api/portraits/women/44.jpg');">
                            </div>
                            <div class="avatar-edit">
                                <input type="file" id="imageUpload" accept=".png, .jpg, .jpeg">
                                <label for="imageUpload"><i class="fas fa-camera"></i></label>
                            </div>
                        </div>
                        <div class="ml-4">
                            <h2 class="text-xl font-bold text-white" style="font-size: 30px">Marika Rossi</h2>
                            <p class="text-pink-200 text-sm">Membro dal: 15/03/2021</p>
                        </div>
                    </div>
                </div>

                <!-- Settings Navigation -->
                <div class="p-4">
                    <div class="space-y-1">
                        <button data-tab="profile" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800 active">
                            <i class="fas fa-user-circle mr-3 text-nekopeach"></i>
                            <span>Profilo</span>
                        </button>

                        <button onclick="window.location.href='sicurezza.jsp'" data-tab="security" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-lock mr-3 text-gray-600"></i>
                            <span>Sicurezza</span>
                        </button>

                        <button onclick="window.location.href='pagamenti.jsp'" data-tab="payments" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-credit-card mr-3 text-gray-600"></i>
                            <span>Pagamenti</span>
                            <span class="ml-auto bg-nekopink text-nekopeach rounded-full px-2 py-1 text-xs font-bold">2</span>
                        </button>

                        <button onclick="window.location.href='indirizzi.jsp'" data-tab="addresses" class="settings-tab w-full text-left px-4 py-3 flex items-center text-gray-800">
                            <i class="fas fa-map-marker-alt mr-3 text-gray-600"></i>
                            <span>Indirizzi</span>
                            <span class="ml-auto bg-nekopink text-nekopeach rounded-full px-2 py-1 text-xs font-bold">3</span>
                        </button>


                    </div>
                </div>

                <!-- Account Status -->
                <div class="border-t border-gray-200 p-4">
                    <h3 class="font-bold text-gray-800 mb-3 flex items-center">
                        <i class="fas fa-shield-alt mr-2 text-gray-600"></i> Stato Account
                    </h3>
                    <div class="bg-green-50 border border-green-200 text-green-700 px-4 py-3 rounded-lg text-sm">
                        <div class="flex items-center">
                            <i class="fas fa-check-circle mr-2"></i>
                            <span>Verificato</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Security Tips -->
            <div class="profile-card bg-white border-2 border-nekored mt-6">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h3 class="text-xl font-bold text-white flex items-center" style="font-size: 25px">
                        <i class="fas fa-lightbulb mr-3"></i> Consigli di Sicurezza
                    </h3>
                </div>

                <div class="p-4">
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-check-circle text-green-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Usa una password unica e complessa</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-check-circle text-green-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Abilita l'autenticazione a due fattori</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-exclamation-circle text-yellow-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Aggiorna regolarmente i tuoi metodi di pagamento</p>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 mt-1">
                                <i class="fas fa-exclamation-circle text-yellow-500"></i>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-gray-700">Controlla i dispositivi connessi al tuo account</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Settings Content -->
        <div class="lg:col-span-3">
            <!-- Profile Tab Content -->
            <div id="profile-tab" class="tab-content active">
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
                    <!-- Profile Header -->
                    <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                        <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                            <i class="fas fa-user-circle mr-3"></i> Informazioni Profilo
                        </h2>
                    </div>

                    <!-- Profile Form -->
                    <div class="p-6">
                        <form>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                <div class="relative">
                                    <input type="text" id="firstName" class="form-input w-full px-4 py-3 rounded-lg" value="Marika">
                                    <label for="firstName" class="form-label absolute left-4 -top-2 bg-white px-1 text-gray-500 text-sm">Nome</label>
                                </div>

                                <div class="relative">
                                    <input type="text" id="lastName" class="form-input w-full px-4 py-3 rounded-lg" value="Rossi">
                                    <label for="lastName" class="form-label absolute left-4 -top-2 bg-white px-1 text-gray-500 text-sm">Cognome</label>
                                </div>

                                <div class="relative md:col-span-2">
                                    <input type="email" id="email" class="form-input w-full px-4 py-3 rounded-lg" value="marika.rossi@example.com">
                                    <label for="email" class="form-label absolute left-4 -top-2 bg-white px-1 text-gray-500 text-sm">Email</label>
                                    <div class="absolute right-4 top-4">
                                        <span class="verification-badge text-xs px-2 py-1 rounded-full">Verificata</span>
                                    </div>
                                </div>
                            </div>
                        </form>
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
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
