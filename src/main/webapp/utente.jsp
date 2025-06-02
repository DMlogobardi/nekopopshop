<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Profilo Utente</title>
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
                        nekopurple: '#9c6ade',
                        kawaiblue: '#6a8cde',
                        kawaililac: '#d8b4fe'
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
            min-height: 100vh;
            overflow-x: hidden;
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

        .wishlist-item {
            transition: all 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
        }

        .wishlist-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
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
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-kawaililac z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-user text-white text-2xl"></i>
                </div>
                <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-astronaut text-3xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">Il Tuo Profilo</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Benvenuto nella tua area personale</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.html" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.html" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.html" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.html" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="admin.html" class="folder-tab"><i class="fas fa-user-shield mr-2"></i> Admin</a>
                <a href="profile.html" class="folder-tab active"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>
    </div>

    <!-- Profile Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Profile Info -->
        <div class="lg:col-span-1">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <!-- Avatar Section -->
                <div class="p-6 text-center">
                    <div class="avatar-upload">
                        <div class="avatar-preview">
                            <div id="imagePreview" style="background-image: url('https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400');">
                            </div>
                        </div>
                        <div class="avatar-edit">
                            <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                            <label for="imageUpload"><i class="fas fa-camera"></i></label>
                        </div>
                    </div>

                    <h3 class="text-xl font-bold mt-4 text-gray-800">NekoFan123</h3>
                    <p class="text-gray-600">Membro dal: 15/03/2022</p>

                    <div class="mt-4 flex justify-center space-x-2">
                        <span class="badge bg-nekopink text-nekopeach">Premium</span>
                        <span class="badge bg-kawaiblue text-white">Verified</span>
                    </div>
                </div>

                <!-- Stats -->
                <div class="px-6 pb-6">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-gray-600">Livello</span>
                        <span class="font-bold text-nekopeach">12</span>
                    </div>
                    <div class="progress-bar mb-4">
                        <div class="progress-fill" style="width: 65%"></div>
                    </div>

                    <div class="grid grid-cols-3 gap-2 text-center">
                        <div class="stats-card bg-nekopink/20 p-3 rounded-lg">
                            <div class="text-nekopeach font-bold text-xl">24</div>
                            <div class="text-xs text-gray-600">Ordini</div>
                        </div>
                        <div class="stats-card bg-kawaiblue/20 p-3 rounded-lg">
                            <div class="text-kawaiblue font-bold text-xl">128</div>
                            <div class="text-xs text-gray-600">Punti</div>
                        </div>
                        <div class="stats-card bg-nekopurple/20 p-3 rounded-lg">
                            <div class="text-nekopurple font-bold text-xl">8</div>
                            <div class="text-xs text-gray-600">Liste</div>
                        </div>
                    </div>
                </div>

                <!-- Navigation -->
                <div class="border-t border-gray-200">
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-nekopeach font-bold border-b border-gray-200" data-tab="dashboard">
                        <i class="fas fa-tachometer-alt mr-3"></i> Dashboard
                    </button>
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="orders">
                        <i class="fas fa-shopping-bag mr-3"></i> I miei ordini
                        <div class="notification-badge">3</div>
                    </button>
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="wishlist">
                        <i class="fas fa-heart mr-3"></i> Lista desideri
                    </button>
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="addresses">
                        <i class="fas fa-map-marker-alt mr-3"></i> Indirizzi
                    </button>
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="settings">
                        <i class="fas fa-cog mr-3"></i> Impostazioni
                    </button>
                    <button class="tab-btn w-full text-left px-6 py-3 flex items-center text-gray-600 hover:text-nekopeach transition" data-tab="logout">
                        <i class="fas fa-sign-out-alt mr-3"></i> Esci
                    </button>
                </div>
            </div>

            <!-- Rewards Card -->
            <div class="profile-card bg-white border-2 border-nekoorange mt-6">
                <div class="bg-gradient-to-r from-nekopink to-nekoorange p-4">
                    <h3 class="text-lg font-bold text-white flex items-center">
                        <i class="fas fa-trophy mr-2"></i> I tuoi premi
                    </h3>
                </div>
                <div class="p-4">
                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 rounded-full bg-nekopink flex items-center justify-center mr-3">
                            <i class="fas fa-medal text-nekopeach text-xl"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-800">Collezionista</h4>
                            <p class="text-xs text-gray-600">Hai completato 10 ordini</p>
                        </div>
                    </div>
                    <div class="flex items-center">
                        <div class="w-12 h-12 rounded-full bg-kawaiblue/20 flex items-center justify-center mr-3">
                            <i class="fas fa-star text-kawaiblue text-xl"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-800">Fan accanito</h4>
                            <p class="text-xs text-gray-600">50 articoli nella wishlist</p>
                        </div>
                    </div>
                    <div class="mt-4 text-center">
                        <button class="bg-nekoorange hover:bg-nekopeach text-white px-4 py-2 rounded-lg text-sm font-bold transition">
                            Scopri altri premi
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="lg:col-span-3">
            <!-- Dashboard Tab -->
            <div class="tab-content active" id="dashboard-tab">
                <div class="profile-card bg-white border-2 border-kawaiblue">
                    <div class="bg-gradient-to-r from-kawaiblue to-nekopurple p-4">
                        <h2 class="text-xl font-bold text-white flex items-center">
                            <i class="fas fa-tachometer-alt mr-3"></i> La tua dashboard
                        </h2>
                    </div>

                    <div class="p-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <div class="bg-nekopink/10 p-6 rounded-xl">
                                <h3 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                                    <i class="fas fa-shopping-bag mr-2"></i> Ultimi ordini
                                </h3>
                                <div class="space-y-4">
                                    <div class="order-card bg-white p-4 rounded-lg relative">
                                        <div class="flex justify-between items-start">
                                            <div>
                                                <h4 class="font-bold text-gray-800">Ordine #NEKO-2023-045</h4>
                                                <p class="text-sm text-gray-600">15 Ottobre 2023</p>
                                            </div>
                                            <span class="badge bg-green-100 text-green-800">Spedito</span>
                                        </div>
                                        <div class="mt-2 flex items-center">
                                            <div class="w-10 h-10 rounded-full overflow-hidden mr-2">
                                                <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=100" alt="Chainsaw Man" class="w-full h-full object-cover">
                                            </div>
                                            <div class="w-10 h-10 rounded-full overflow-hidden mr-2">
                                                <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" alt="Jujutsu Kaisen" class="w-full h-full object-cover">
                                            </div>
                                            <div class="text-sm text-gray-500">+2 altri</div>
                                        </div>
                                        <div class="mt-3 flex justify-between items-center">
                                            <span class="font-bold text-nekopeach">€42,97</span>
                                            <a href="#" class="text-sm text-kawaiblue hover:underline">Dettagli</a>
                                        </div>
                                    </div>

                                    <div class="order-card bg-white p-4 rounded-lg relative">
                                        <div class="flex justify-between items-start">
                                            <div>
                                                <h4 class="font-bold text-gray-800">Ordine #NEKO-2023-044</h4>
                                                <p class="text-sm text-gray-600">2 Ottobre 2023</p>
                                            </div>
                                            <span class="badge bg-blue-100 text-blue-800">In elaborazione</span>
                                        </div>
                                        <div class="mt-2">
                                            <div class="w-10 h-10 rounded-full overflow-hidden">
                                                <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" alt="Action Figure" class="w-full h-full object-cover">
                                            </div>
                                        </div>
                                        <div class="mt-3 flex justify-between items-center">
                                            <span class="font-bold text-nekopeach">€39,99</span>
                                            <a href="#" class="text-sm text-kawaiblue hover:underline">Dettagli</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 text-center">
                                    <a href="#" class="text-sm text-nekopeach font-bold hover:underline">Vedi tutti gli ordini</a>
                                </div>
                            </div>

                            <div class="bg-kawaiblue/10 p-6 rounded-xl">
                                <h3 class="font-bold text-lg text-kawaiblue mb-4 flex items-center">
                                    <i class="fas fa-heart mr-2"></i> Lista desideri
                                </h3>
                                <div class="space-y-4">
                                    <div class="wishlist-item bg-white p-3 rounded-lg flex items-center">
                                        <div class="w-16 h-16 rounded-lg overflow-hidden flex-shrink-0">
                                            <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200" alt="Jujutsu Kaisen" class="w-full h-full object-cover">
                                        </div>
                                        <div class="ml-3 flex-1">
                                            <h4 class="font-bold text-sm text-gray-800">Jujutsu Kaisen Vol.15</h4>
                                            <p class="text-xs text-gray-600">Disponibile dal 15/11</p>
                                        </div>
                                        <div class="text-right">
                                            <span class="block font-bold text-nekopeach">€14,99</span>
                                            <button class="text-xs text-kawaiblue hover:underline">Aggiungi al carrello</button>
                                        </div>
                                    </div>

                                    <div class="wishlist-item bg-white p-3 rounded-lg flex items-center">
                                        <div class="w-16 h-16 rounded-lg overflow-hidden flex-shrink-0">
                                            <img src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200" alt="Demon Slayer" class="w-full h-full object-cover">
                                        </div>
                                        <div class="ml-3 flex-1">
                                            <h4 class= "font-bold text-sm text-gray-600"></h4>
                                        </div>

                                        </div>
                                </div>

                            </div>
                        </div>
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

</body>
</html>