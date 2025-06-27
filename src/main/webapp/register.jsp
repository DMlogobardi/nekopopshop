<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Registrazione</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/Register.js" defer></script>
    <script src="frontend/Scripts/MultiStepForm.js" defer></script>

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

        .step.completed {
            border-color: #a3e635;
        }

        .step.completed .step-number {
            background-color: #a3e635;
            color: white;
        }
    </style>
    <style>
        /* Animazione per il banner di successo */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-fade-in {
            animation: fadeIn 0.5s ease-out forwards;
        }

        /* Stile per il banner di successo */
        #registration-message {
            display: none;
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            z-index: 1000;
            text-align: center;
        }

        #registration-message.block {
            display: block;
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
                    <i class="fas fa-user-plus text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-astronaut text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Registrazione</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Unisciti alla nostra community</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="login.jsp" class="folder-tab"><i class="fas fa-sign-in-alt mr-2"></i> Accedi</a>
                <a href="register.jsp" class="folder-tab active"><i class="fas fa-user-plus mr-2"></i> Registrati</a>
            </div>
        </div>
    </div>

    <!-- Registration Form -->
    <div class="max-w-3xl mx-auto">
        <div class="profile-card bg-white border-2 border-nekored">
            <div class="bg-gradient-to-r from-nekopeach to-nekoorange p-4">
                <h2 class="text-xl font-bold text-white flex items-center">
                    <i class="fas fa-user-plus mr-3" style="font-size: 30px"></i>
                    <span style="font-size: 30px">Crea il tuo account</span>
                </h2>
            </div>

            <div class="p-6">
                <!-- Registration Steps -->
                <div class="registration-steps">
                    <div class="step active" id="step1">
                        <div class="step-number">1</div>
                        <div class="step-title">Informazioni base</div>
                    </div>
                    <div class="step" id="step2">
                        <div class="step-number">2</div>
                        <div class="step-title">Dettagli account</div>
                    </div>
                    <div class="step" id="step3">
                        <div class="step-number">3</div>
                        <div class="step-title">Conferma</div>
                    </div>
                </div>

                <!-- Step 1: Basic Information -->
                <div class="step-content active" id="step1-content">
                    <form id="registration-form">
                        <div class="mb-6">
                            <h3 class="font-bold text-lg text-nekopeach mb-4" style="font-size: 25px">Informazioni personali</h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="name">Nome*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="name" placeholder="Nome" type="text" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="cognome">Cognome*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="cognome" placeholder="Cognome" type="text" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-6">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nascita">Data di nascita*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="nascita" placeholder="Data di nascita" type="date" required>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-end">
                            <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition mr-3">Annulla</button>
                            <button type="button" class="bg-nekopeach text-white px-4 py-2 rounded-lg font-bold hover:bg-nekoorange transition next-step" data-next="step2">Avanti</button>
                        </div>
                    </form>
                </div>

                <!-- Step 2: Account Details -->
                <div class="step-content" id="step2-content">
                    <form>
                        <div class="mb-6">
                            <h3 class="font-bold text-lg text-nekopeach mb-4" style="font-size: 25px">Dettagli account</h3>
                            <div class="grid grid-cols-1 gap-4">
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="email">Email*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="email" placeholder="Email" type="email" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="cf">Codice Fiscale*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="cf" placeholder="Codice Fiscale" type="text" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="via">Via*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="via" placeholder="Via" type="text" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="civico">Civico*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="civico" placeholder="Civico" type="text" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="cap">CAP*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="cap" placeholder="CAP" type="text" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="prefisso">Prefisso*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="prefisso" placeholder="Prefisso" type="text" required>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="numero">Numero*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="numero" placeholder="Numero" type="text" required>
                                </div>
                                <div class="relative">
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="password">Password*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="password" placeholder="Password" type="password" required>
                                    <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                                    <div class="mt-2">
                                        <div class="flex items-center mb-1">
                                            <div id="length-check" class="w-4 h-4 rounded-full border border-gray-300 mr-2"></div>
                                            <span class="text-xs text-gray-600">Minimo 8 caratteri</span>
                                        </div>
                                        <div class="flex items-center mb-1">
                                            <div id="uppercase-check" class="w-4 h-4 rounded-full border border-gray-300 mr-2"></div>
                                            <span class="text-xs text-gray-600">Almeno una maiuscola</span>
                                        </div>
                                        <div class="flex items-center">
                                            <div id="number-check" class="w-4 h-4 rounded-full border border-gray-300 mr-2"></div>
                                            <span class="text-xs text-gray-600">Almeno un numero</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="relative">
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="confirm-password">Conferma password*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="confirm-password" type="password" required>
                                    <i class="fas fa-eye password-toggle" id="toggleConfirmPassword"></i>
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nick">Nickname*</label>
                                    <input class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-nekopeach" id="nick" placeholder="Nickname" type="text" required>
                                    <p class="text-xs text-gray-500 mt-1">Scegli un nome utente unico (min. 4 caratteri)</p>
                                </div>
                            </div>
                        </div>

                        <div class="mb-6">
                            <h3 class="font-bold text-lg text-nekopeach mb-4" style="font-size: 25px">Preferenze</h3>
                            <div class="grid grid-cols-1 gap-4">
                                <div class="flex items-center">
                                    <input id="terms" type="checkbox" class="w-4 h-4 text-nekopeach rounded focus:ring-nekopeach" required>
                                    <label for="terms" class="ml-2 text-sm text-gray-700">Accetto i <a href="#" class="text-nekored hover:underline">Termini e condizioni</a> e l'<a href="#" class="text-nekored hover:underline">Informativa sulla privacy</a>*</label>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-between">
                            <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition prev-step" data-prev="step1">Indietro</button>
                            <button type="button" class="bg-nekopeach text-white px-4 py-2 rounded-lg font-bold hover:bg-nekoorange transition next-step" data-next="step3">Avanti</button>
                        </div>
                    </form>
                </div>

                <!-- Step 3: Confirmation -->
                <div class="step-content" id="step3-content">
                    <div class="text-center mb-6">
                        <div class="w-32 h-32 mx-auto rounded-full bg-nekopink flex items-center justify-center mb-4">
                            <i class="fas fa-check text-nekopeach text-2xl"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-800 mb-2" style="font-size: 25px">Conferma i tuoi dati</h3>
                        <p class="text-gray-600 mb-6">Controlla che tutte le informazioni siano corrette prima di completare la registrazione</p>
                    </div>

                    <div class="bg-nekopink/10 p-6 rounded-xl mb-6">
                        <h4 class="font-bold text-nekopeach mb-3">Informazioni personali</h4>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <p class="text-sm text-gray-600">Nome</p>
                                <p class="font-medium" id="confirm-name"></p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600">Cognome</p>
                                <p class="font-medium" id="confirm-cognome"></p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600">Data di nascita</p>
                                <p class="font-medium" id="confirm-nascita"></p>
                            </div>
                        </div>
                    </div>

                    <div class="bg-nekopink/10 p-6 rounded-xl mb-6">
                        <h4 class="font-bold text-nekopeach mb-3">Dettagli account</h4>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <p class="text-sm text-gray-600">Email</p>
                                <p class="font-medium" id="confirm-email"></p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600">Codice Fiscale</p>
                                <p class="font-medium" id="confirm-cf"></p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600">Indirizzo</p>
                                <p class="font-medium" id="confirm-indirizzo"></p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600">Telefono</p>
                                <p class="font-medium" id="confirm-telefono"></p>
                            </div>
                            <div>
                                <p class="text-sm text-gray-600">Nickname</p>
                                <p class="font-medium" id="confirm-nick"></p>
                            </div>
                        </div>
                    </div>

                    <div class="flex justify-between">
                        <button type="button" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-bold hover:bg-gray-300 transition prev-step" data-prev="step2">Indietro</button>
                        <button id="conferma" type="button" class="bg-nekopeach text-white px-4 py-2 rounded-lg font-bold hover:bg-nekoorange transition">Completa registrazione</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-6 text-center">
            <p class="text-gray-600">Hai gi&agrave un account? <a href="login.jsp" class="text-nekored font-bold hover:underline">Accedi qui</a></p>
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

        blossom.style.left = '${startX}px';
        blossom.style.width = '${size}px';
        blossom.style.height = '${size}px';
        blossom.style.animationDuration = '${duration}s';
        blossom.style.animationDelay = '${delay}s';

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

    // Password toggle functionality
    const togglePassword = document.getElementById('togglePassword');
    const password = document.getElementById('password');
    const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
    const confirmPassword = document.getElementById('confirm-password');

    if (togglePassword && password) {
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    }

    if (toggleConfirmPassword && confirmPassword) {
        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    }

    // Password validation
    if (password) {
        password.addEventListener('input', function() {
            const value = this.value;
            const lengthCheck = document.getElementById('length-check');
            const uppercaseCheck = document.getElementById('uppercase-check');
            const numberCheck = document.getElementById('number-check');

            // Length check
            if (value.length >= 8) {
                lengthCheck.classList.add('bg-green-500', 'border-green-500');
                lengthCheck.classList.remove('border-gray-300');
                lengthCheck.innerHTML = '<i class="fas fa-check text-white text-xs"></i>';
            } else {
                lengthCheck.classList.remove('bg-green-500', 'border-green-500');
                lengthCheck.classList.add('border-gray-300');
                lengthCheck.innerHTML = '';
            }

            // Uppercase check
            if (/[A-Z]/.test(value)) {
                uppercaseCheck.classList.add('bg-green-500', 'border-green-500');
                uppercaseCheck.classList.remove('border-gray-300');
                uppercaseCheck.innerHTML = '<i class="fas fa-check text-white text-xs"></i>';
            } else {
                uppercaseCheck.classList.remove('bg-green-500', 'border-green-500');
                uppercaseCheck.classList.add('border-gray-300');
                uppercaseCheck.innerHTML = '';
            }

            // Number check
            if (/\d/.test(value)) {
                numberCheck.classList.add('bg-green-500', 'border-green-500');
                numberCheck.classList.remove('border-gray-300');
                numberCheck.innerHTML = '<i class="fas fa-check text-white text-xs"></i>';
            } else {
                numberCheck.classList.remove('bg-green-500', 'border-green-500');
                numberCheck.classList.add('border-gray-300');
                numberCheck.innerHTML = '';
            }
        });
    }

    // Step navigation
    document.querySelectorAll('.next-step').forEach(button => {
        button.addEventListener('click', function() {
            const nextStep = this.getAttribute('data-next');
            const currentStep = document.querySelector('.step-content.active');
            // Correzione: usa backtick per l'interpolazione di stringhe
            const nextStepContent = document.getElementById(`${nextStep}-content`);

            if (!nextStepContent) {
                console.error(`Elemento con ID ${nextStep}-content non trovato`);
                return;
            }

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

                // Special validation for password match
                if (nextStep === 'step3') {
                    const password = document.getElementById('password');
                    const confirmPassword = document.getElementById('confirm-password');

                    if (password && confirmPassword && password.value !== confirmPassword.value) {
                        isValid = false;
                        confirmPassword.classList.add('border-red-500');
                    } else if (confirmPassword) {
                        confirmPassword.classList.remove('border-red-500');
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

                // Se siamo passati al passo 3, aggiorna i dati di conferma
                if (nextStep === 'step3') {
                    aggiornaStep3Conferma();


                // Update confirmation data
                if (nextStep === 'step3') {
                    document.getElementById('confirm-name').textContent =
                        document.getElementById('name').value;
                    document.getElementById('confirm-cognome').textContent =
                        document.getElementById('cognome').value;
                    document.getElementById('confirm-nascita').textContent =
                        document.getElementById('nascita').value;
                    document.getElementById('confirm-nick').textContent =
                        document.getElementById('nick').value;
                    document.getElementById('confirm-email').textContent =
                        document.getElementById('email').value;
                    document.getElementById('confirm-cf').textContent =
                        document.getElementById('cf').value;
                    document.getElementById('confirm-indirizzo').textContent =
                        '${document.getElementById('via').value}, ${document.getElementById('civico').value}, ${document.getElementById('cap').value}';
                    document.getElementById('confirm-telefono').textContent =
                        '${document.getElementById('prefisso').value} ${document.getElementById('numero').value}';
                }
            }
            }
        });
    });

    document.querySelectorAll('.prev-step').forEach(button => {
        button.addEventListener('click', function() {
            const prevStep = this.getAttribute('data-prev');
            const currentStep = document.querySelector('.step-content.active');
            const prevStepContent = document.getElementById('${prevStep}-content');

            // Update steps
            document.querySelectorAll('.step').forEach(step => {
                step.classList.remove('active');
                if (step.id === prevStep) {
                    step.classList.add('active');
                    step.classList.remove('completed');
                }
            });

            // Update content
            currentStep.classList.remove('active');
            prevStepContent.classList.add('active');
        });
    });
</script>

<div id="registration-message" class="hidden fixed top-4 left-1/2 transform -translate-x-1/2 bg-green-200 text-green-900 font-bold px-6 py-3 rounded-lg shadow-lg z-50 transition duration-300 ease-in-out">
    Registrazione completata con successo! ✨
</div>
</body>
</html>