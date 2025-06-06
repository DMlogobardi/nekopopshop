<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Chi Siamo</title>
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
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48ZyBmaWxsPSIjZmY3ZWI4Ij48cGF0aCBkPSJNNTAgMTBjLTIyIDAtNDAgMTgtNDAgNDBzMTggNDAgNDAgNDAgNDAtMTggNDAtNDAtMTgtNDAtNDAtNDB6bTAgODFhOSA5IDAgMCAxIDAgMCAwIDkgOSAwIDAgMCAwIDB6Ii8+PHBhdGggZD0iTTIwIDEwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDE4IDAgMiAyIDAgMCAwLTIgMiA5IDkgMCAwIDEtMTggMHoiLz48cGF0aCBkPSJNNjAgMTBhMiAyIDAgMCAwLTItMmE5IDkgMCAwIDEgMCAxOCAyIDIgMCAwIDAgMiAyIDkgOSAwIDAgMSAwLTE4eiIvPjxwYXRoIGQ9Ik0yMCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAxOCAwIDIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxLTE4IDB6Ii8+PHBhdGggZD0iTTYwIDYwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDAgMTggMiAyIDAgMCAwIDIgMiA5IDkgMCAwIDEgMC0xOHoiLz48L2c+PC9zdmc+d');
            background-size: cover;
            animation: blossom-fall 15s linear infinite;
        }

        .team-card {
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            background: white;
            border-radius: 15px;
            border: 2px solid #fbd8da;
        }

        .team-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .team-card::after {
            content: 'NekoPop';
            position: absolute;
            top: 10px;
            right: -35px;
            background: #E55458;
            color: #f2d5bb;
            padding: 3px 35px;
            transform: rotate(45deg);
            font-size: 0.8rem;
            font-weight: bold;
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
            font-weight: 900;
            font-size: 45px;


        }



        .timeline-item {
            position: relative;
            padding-left: 60px;
            margin-bottom: 30px;
        }

        .timeline-item::before {
            content: '';
            position: absolute;
            left: 20px;
            top: 0;
            height: 100%;
            width: 2px;
            background: linear-gradient(to bottom, #E55458, #f2d5bb);
        }

        .timeline-dot {
            position: absolute;
            left: 10px;
            top: 0;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: #E55458;
            border: 4px solid #f2d5bb;
            z-index: 1;
        }

        .mission-icon {
            background: linear-gradient(145deg, #E55458, #f2d5bb);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 3rem;
        }
        .text-3xl{
              font-family: 'Milkyway', sans-serif;
              font-size: 2.5rem;
              color: #333;
          }
        .text-sm{
            font-family: 'Milkyway', sans-serif;
            font-size: 3rem;
            color: #333;
        }
        .text-4xl{
            font-family: 'Milkyway', sans-serif;
            font-size: 3rem;
            color: #333;
        }
        .text-2xl{
            font-family: 'Milkyway', sans-serif;
            font-size: 3rem;
            color: #333;
        }
        .text-xl{
            font-family: 'Milkyway', sans-serif;
            font-size: 3rem;
            color: #333;
        }
        .text-right{
            font-family: 'Milkyway', sans-serif;
            font-size: 3rem;
            color: #333;
        }

    </style>
</head>
<body class="relative overflow-x-hidden">
<!-- Decorative cat elements and cherry blossoms -->
<div id="decorations"></div>

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekopeach z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-paw text-white text-lg"></i>
                </div>
                <img src="${pageContext.request.contextPath}/frontend/images/logo_nekopop.jpg"
                     alt="NekoPop Logo"
                     style="width: 120px; height: 120px;"
                     class="rounded-full border-4 border-white shadow-lg">
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold "><span class="nekotag">NekoPop Shop</span></h1>
                <p class="text-sm text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;">Manga & Action Figure</p>
            </div>
        </div>



        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab active"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>
    </div>

    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-nekoorange to-nekopeach rounded-2xl p-8 md:p-12 mb-12 relative overflow-hidden">
        <div class="absolute top-0 left-0 right-0 bottom-0 opacity-10">
            <div class="absolute top-10 left-10 w-32 h-32 rounded-full bg-white animate-ping"></div>
            <div class="absolute bottom-10 right-10 w-24 h-24 rounded-full bg-white animate-ping"></div>
        </div>
        <div class="relative z-10 text-center">
            <h1 class="text-4xl md:text-5xl font-bold text-white mb-4">Chi Siamo</h1>
            <p class="text-xl text-white/90 max-w-2xl mx-auto">La tua passione per i manga e le action figure, la nostra missione</p>
            <div class="mt-6 flex justify-center">
                <div class="bg-white/20 backdrop-blur-sm rounded-full px-6 py-2 inline-flex items-center">
                    <i class="fas fa-paw text-white mr-2"></i>
                    <span class="text-white font-medium">Dal 2015 con voi</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Our Story Section -->
    <div class="bg-white rounded-2xl border-2 border-nekopeach p-8 mb-12 relative">
        <div class="absolute -top-3 -left-3 w-16 h-16 rounded-full bg-nekopeach flex items-center justify-center">
            <i class="fas fa-book-open text-white text-lg"></i>
        </div>
        <h2 class="text-3xl font-bold text-nekopeach mb-6 ml-12">La Nostra Storia</h2>
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div>
                <p class="text-gray-700 mb-6">NekoPopShop &egrave nato nel 2015 dall'amore per la cultura giapponese e la passione per il design. Tutto &egrave iniziato con una piccola collezione di adesivi per laptop ispirati ai nostri personaggi preferiti e si &egrave rapidamente trasformato in un negozio online con migliaia di prodotti per tutti gli appassionati.</p>
                <p class="text-gray-700 mb-6">Da un piccolo garage a Milano a uno dei negozi di riferimento per gli amanti dei manga e delle action figure in Italia, il nostro viaggio &egrave stato ricco di sfide e soddisfazioni.</p>
                <div class="bg-nekopink/20 p-4 rounded-lg border-l-4 border-nekopeach">
                    <p class="text-gray-700 italic font-bold" style="font-family: 'Bradley Hand ITC'">"Volevamo creare un posto dove gli appassionati come noi potessero trovare prodotti di qualit&agrave con un tocco unico e personale."</p>
                    <p class="text-right text-nekopeach font-bold mt-2" style="font-size: 20px">- Il Team NekoPop</p>
                </div>
            </div>
            <div class="relative">
                <img src="https://images.unsplash.com/photo-1608889825103-eb5c0e8dc9d9?q=80&w=1000"
                     alt="NekoPop Store"
                     class="w-full h-auto rounded-lg shadow-lg border-4 border-white">
                <div class="absolute -bottom-4 -right-4 bg-nekoorange text-white px-4 py-2 rounded-lg font-bold">
                    <i class="fas fa-map-marker-alt mr-2"></i> Milano, 2015
                </div>
            </div>
        </div>

        <!-- Timeline -->
        <div class="mt-12">
            <h3 class="text-2xl font-bold text-nekoorange mb-8 text-center" style="font-size: 35px">La Nostra Crescita</h3>
            <div class="max-w-3xl mx-auto">
                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="bg-nekopink/10 p-6 rounded-xl">
                        <h4 class="text-xl font-bold text-nekoorange mb-2" style="font-size: 25px">2015 - Fondazione</h4>
                        <p class="text-gray-700">Apertura del primo negozio fisico a Milano con una selezione limitata di manga e action figure.</p>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="bg-nekopink/10 p-6 rounded-xl">
                        <h4 class="text-xl font-bold text-nekoorange mb-2"style="font-size: 25px">2017 - Lancio Online</h4>
                        <p class="text-gray-700">Espansione con il negozio online e primi accordi con editori giapponesi per importazioni dirette.</p>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="bg-nekopink/10 p-6 rounded-xl">
                        <h4 class="text-xl font-bold text-nekoorange mb-2"style="font-size: 25px">2019 - Community</h4>
                        <p class="text-gray-700">Superati i 10.000 clienti e creazione del club NekoPop con eventi esclusivi per i membri.</p>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div class="bg-nekopink/10 p-6 rounded-xl">
                        <h4 class="text-xl font-bold text-nekoorange mb-2"style="font-size: 25px">2022 - Premium</h4>
                        <p class="text-gray-700">Lancio del servizio Premium con spedizioni gratuite, sconti esclusivi e box collezionabili mensili.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Our Mission Section -->
    <div class="bg-white rounded-2xl border-2 border-nekoorange p-8 mb-12">
        <h2 class="text-3xl font-bold text-nekopeach mb-8 text-center">La Nostra Missione</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="text-center">
                <div class="mission-icon mb-4">
                    <i class="fas fa-heart"></i>
                </div>
                <h3 class="text-xl font-bold text-nekopeach mb-3">Passione</h3>
                <p class="text-gray-700">Condividiamo la tua stessa passione per i manga e le action figure. Ogni prodotto &egrave selezionato con cura e amore.</p>
            </div>

            <div class="text-center">
                <div class="mission-icon mb-4">
                    <i class="fas fa-star"></i>
                </div>
                <h3 class="text-xl font-bold text-nekopeach mb-3">Qualit&agrave</h3>
                <p class="text-gray-700">Offriamo solo prodotti originali e di alta qualit&agrave, direttamente dai produttori ufficiali e dagli editori.</p>
            </div>

            <div class="text-center">
                <div class="mission-icon mb-4">
                    <i class="fas fa-users"></i>
                </div>
                <h3 class="text-xl font-bold text-nekopeach mb-3">Community</h3>
                <p class="text-gray-700">Creiamo una community dove gli appassionati possono incontrarsi, condividere e celebrare la cultura giapponese.</p>
            </div>
        </div>

        <div class="mt-12 bg-gradient-to-r from-nekoorange/10 to-nekopink/10 p-8 rounded-xl border border-kawaiblue/30">
            <div class="flex flex-col md:flex-row items-center gap-8">
                <div class="flex-shrink-0">
                    <div class="w-32 h-32 rounded-full bg-gradient-to-br from-nekoorange to-nekopink flex items-center justify-center">
                        <i class="fas fa-quote-left text-white text-lg"></i>
                    </div>
                </div>
                <div>
                    <blockquote class="text-xl italic text-gray-700 font-bold mb-4" style="font-family: 'Bradley Hand ITC'">
                        "Non vendiamo semplicemente prodotti, condividiamo emozioni. Ogni manga, ogni action figure racconta una storia che vogliamo far vivere ai nostri clienti."
                    </blockquote>
                    <p class="text-right font-bold text-nekoorange" style="font-size: 20px">- Il Team NekoPop</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Our Team Section -->
    <div class="bg-white rounded-2xl border-2 border-nekopeach p-8 mb-12">
        <h2 class="text-3xl font-bold text-nekopeach mb-8 text-center">Il Nostro Team</h2>
        <p class="text-gray-700 text-center max-w-3xl mx-auto mb-12">Siamo un gruppo di designer, sviluppatori e amanti dei manga che lavorano insieme per creare prodotti che facciano sorridere. Ognuno di noi porta la propria passione e competenza per offrirti la migliore esperienza possibile.</p>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            <!-- Team Member -->
            <div class="team-card p-6 text-center relative">
                <div class="w-32 h-32 mx-auto rounded-full border-4 border-nekopink mb-4 overflow-hidden">
                    <img src="${pageContext.request.contextPath}/frontend/images/mia_icona_git.png"
                         alt="Marta Rossi"
                         class="w-full h-full object-cover">
                </div>
                <h3 class="text-xl font-bold text-nekoorange mb-1">Ilaria Lastra</h3>
                <p class="text-nekopeach font-medium mb-3">Fondatrice & CEO</p>
                <p class="text-gray-600 text-sm mb-4">Appassionata di manga fin da bambina, ha trasformato la sua passione in un lavoro.</p>
                <div class="flex justify-center space-x-3">
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple hover:text-white transition">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple hover:text-white transition">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple hover:text-white transition">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
                <div class="absolute top-4 right-4 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">
                    <i class="fas fa-crown"></i>
                </div>
            </div>

            <!-- Team Member -->
            <div class="team-card p-6 text-center relative">
                <div class="w-32 h-32 mx-auto rounded-full border-4 border-nekoorange mb-4 overflow-hidden">
                    <img src="${pageContext.request.contextPath}/frontend/images/davide_icona_git.jpg"
                         alt="Luigi Bianchi"
                         class="w-full h-full object-cover">
                </div>
                <h3 class="text-xl font-bold text-nekoorange mb-1">Davide Nino Longobardi</h3>
                <p class="text-nekopeach font-medium mb-3">Direttore Acquisti</p>
                <p class="text-gray-600 text-sm mb-4">Si assicura che tutti i prodotti siano originali e di alta qualit&agrave direttamente dal Giappone.</p>
                <div class="flex justify-center space-x-3">
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple transition">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple transition">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
                <div class="absolute top-4 right-4 bg-nekoorange text-white px-2 py-1 rounded-md text-xs font-bold">
                    JP
                </div>
            </div>

            <!-- Team Member -->
            <div class="team-card p-6 text-center relative">
                <div class="w-32 h-32 mx-auto rounded-full border-4 border-nekopeach mb-4 overflow-hidden">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg"
                         alt="Luigi Bianchi"
                         class="w-full h-full object-cover">
                </div>
                <h3 class="text-xl font-bold text-nekoorange mb-1">Alessia Palmigiano</h3>
                <p class="text-nekopeach font-medium mb-3">Collaboratrice Shop</p>
                <p class="text-gray-600 text-sm mb-4">Si assicura che il lavoro sia efficiente e che la manutenzione del sito sia attuata.</p>
                <div class="flex justify-center space-x-3">
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple transition">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="w-8 h-8 rounded-full bg-nekoorange text-white flex items-center justify-center hover:bg-nekopurple transition">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
                <div class="absolute top-4 right-4 bg-nekoorange text-white px-2 py-1 rounded-md text-xs font-bold">
                    JP
                </div>


</div>
        </div>
    </div>
</div>

</body>
</html>
