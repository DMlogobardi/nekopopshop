<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="jakarta.servlet.http.HttpSession, jakarta.servlet.http.Cookie"%>
<%@ page import="java.util.logging.Logger" %>
<%
    // Crea il logger
    Logger logger = Logger.getLogger("MyLogger");

    HttpSession s = request.getSession(false);
    boolean isLoggedIn = false;
    String access = "";

    if (s != null) {
        Object token = s.getAttribute("logToken");
        if (token == null) {
            isLoggedIn = true;
        } else {
            access = token.toString();
        }
    }

    if (isLoggedIn) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("access".equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setMaxAge(1);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                    return;
                }
            }
        }
    } else {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("access".equals(cookie.getName())) {
                    if(!cookie.getValue().equals(access))
                        if(access.equals("A"))
                            cookie.setValue("admin");
                        else
                            cookie.setValue("user");
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Il tuo negozio kawaii di manga e action figure</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/index_Dainamic.js" defer></script>
    <script src="frontend/Scripts/Nav_Bar.js" defer></script>


    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        nekopink: '#fbd8da',
                        nekopeach: '#e55458',
                        nekobeige: '#f2d5bb',
                        nekoorange: '#f29966',
                        nekored: '#f24535'
                    }
                }
            }
        }
    </script>
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
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-kawaililac z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-paw text-white text-2xl"></i>
                </div>
                <img src="${pageContext.request.contextPath}/frontend/images/logo_nekopop.jpg"
                     alt="NekoPop Logo"
                     style="width: 120px; height: 120px;"
                     class="rounded-full border-4 border-white shadow-lg">
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold"><span class="nekotag">NekoPop Shop</span></h1>
                <p class="text-xl text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;">Manga & Action Figure</p>
            </div>
        </div>

        <!-- Navigation -->
        <div id="navbar"></div>
        <jsp:include page="navBar.jsp" />
    </div>

    <jsp:include page="error.jsp" />

    <!-- Sponsor Section -->
    <div class="flex flex-wrap gap-4 mb-8">
        <!-- Sponsor Banner -->
        <div id="dayOffer" class="header-content p-6 w-full md:w-2/3 relative">
            <div class="absolute -top-2 right-4 flex gap-2">
                <div class="w-3 h-3 rounded-full bg-nekopink"></div>
                <div class="w-3 h-3 rounded-full bg-nekopurple"></div>
                <div class="w-3 h-3 rounded-full bg-kawaililac"></div>
            </div>

            <div class="flex flex-col md:flex-row items-center gap-4">
                <div class="bg-kawaililac rounded-xl px-4 py-2 flex items-center">
                    <i class="fas fa-star text-yellow-400 text-2xl mr-3"> </i>
                    <div>
                        <h3 class="font-bold text-white text-xl" style="font-size: 30px"> Offerta del giorno!</h3>
                        <p class="text-white text-xs">Sconti fino al 30%</p>
                    </div>
                </div>

                <div class="md:flex-1 flex flex-col md:flex-row items-center gap-4">
                    <div class="bg-gradient-to-r from-nekopink to-nekopurple w-24 h-24 rounded-xl p-1">
                        <div class="bg-white w-full h-full rounded-lg overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1615800000134-d3a9c1b1a7f0?q=80&w=1000"
                                 alt="Demon Slayer"
                                 class="w-full h-full object-cover">
                        </div>
                    </div>

                    <div class="text-center md:text-left">
                        <h3 class="font-bold text-xl text-nekopurple mb-1">Demon Slayer Vol. 1-10</h3>
                        <div class="flex justify-center md:justify-start items-center gap-1">
                            <p class="text-gray-500 line-through text-sm">&#8364 6,50</p>
                            <p class="text-2xl font-bold text-nekopink">&#8364 5,00</p>
                        </div>
                        <div class="mt-2 flex gap-2 justify-center md:justify-start">
                            <span class="bg-nekoorange px-2 py-1 rounded-lg text-white text-xs">Limited Edition</span>
                            <span class="bg-nekored px-2 py-1 rounded-lg text-white text-xs">-30%</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4 flex justify-between items-center">
                <p class="text-white text-sm">Offerta valida fino al 31/12/2023</p>
                <button id="addCartOfferta" class="bg-nekopeach hover:bg-nekopink text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
                    <i class="fas fa-gift mr-2"></i> Approfitta ora
                </button>
            </div>
        </div>


        <!-- Sponsor Banner -->
        <div id="dayOfferProd" class="header-content p-6 w-full md:w-2/3 relative">
            <div class="absolute -top-2 right-4 flex gap-2">
                <div class="w-3 h-3 rounded-full bg-nekopink"></div>
                <div class="w-3 h-3 rounded-full bg-nekopurple"></div>
                <div class="w-3 h-3 rounded-full bg-kawaililac"></div>
            </div>

            <div class="flex flex-col md:flex-row items-center gap-4">
                <div class="bg-kawaililac rounded-xl px-4 py-2 flex items-center">
                    <i class="fas fa-star text-yellow-400 text-2xl mr-3"> </i>
                    <div>
                        <h3 class="font-bold text-white text-xl" style="font-size: 30px"> Offerta del giorno!</h3>
                        <p class="text-white text-xs">Sconti fino al 30%</p>
                    </div>
                </div>

                <div class="md:flex-1 flex flex-col md:flex-row items-center gap-4">
                    <div class="bg-gradient-to-r from-nekopink to-nekopurple w-24 h-24 rounded-xl p-1">
                        <div class="bg-white w-full h-full rounded-lg overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1615800000134-d3a9c1b1a7f0?q=80&w=1000"
                                 alt="Demon Slayer"
                                 class="w-full h-full object-cover">
                        </div>
                    </div>

                    <div class="text-center md:text-left">
                        <h3 class="font-bold text-xl text-nekopurple mb-1">Demon Slayer Vol. 1-10</h3>
                        <div class="flex justify-center md:justify-start items-center gap-1">
                            <p class="text-gray-500 line-through text-sm">&#8364 6,50</p>
                            <p class="text-2xl font-bold text-nekopink">&#8364 5,00</p>
                        </div>
                        <div class="mt-2 flex gap-2 justify-center md:justify-start">
                            <span class="bg-nekoorange px-2 py-1 rounded-lg text-white text-xs">Limited Edition</span>
                            <span class="bg-nekored px-2 py-1 rounded-lg text-white text-xs">-30%</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4 flex justify-between items-center">
                <p class="text-white text-sm">Offerta valida fino al 31/12/2023</p>
                <button class="bg-nekopeach hover:bg-nekopink text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
                    <i class="fas fa-gift mr-2"></i> Approfitta ora
                </button>
            </div>
        </div>
    </div>

    <div class="sakura-divider my-6"></div>

    <!-- Content Area -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- News Section -->
        <div class="lg:col-span-2">
            <div class= "bg-white rounded-xl border-2 border-nekopeach overflow-hidden">
                <div class="bg-gradient-to-r from-kawaiblue to-nekopurple p-4 flex items-center">
                    <i class="fas fa-newspaper text-white text-2xl mr-3"></i>
                    <h2 class= "text-xl font-bold text-nekopeach" style="font-size: 30px">Ultime Novit&agrave</h2>
                    <div class="ml-auto flex">
                        <i class="fas fa-cat text-white text-xl mr-2 animate-bounce"></i>
                        <i class="fas fa-cat text-white text-xl"></i>
                    </div>
                </div>

                <div class="p-6 space-y-6">
                    <!-- News item -->
                    <div class="flex items-start border-b border-gray-100 pb-6">
                        <div class="mr-4 flex-shrink-0">
                            <div class="bg-nekopeach w-14 h-14 rounded-xl flex items-center justify-center">
                                <i class="fas fa-truck text-white text-2xl"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class= "font-semibold text-lg text-nekopurple mb-2" style="font-size: 25px"> Consegna Espressa!</h3>
                            <p class="text-gray-600">Nuovo servizio di consegna in giornata per tutta la citt&agrave di Milano! Dai un'occhiata alla nostra sezione informazioni.</p>
                            <div class="mt-3 flex items-center">
                                <span class="bg-nekopeach text-white px-2 py-1 rounded-md text-xs">Esclusiva</span>
                                <span class="ml-3 text-xs text-gray-400"><i class="far fa-clock mr-1"></i> 2 giorni fa</span>
                            </div>
                        </div>
                    </div>

                    <!-- News item -->
                    <div class="flex items-start border-b border-gray-100 pb-6">
                        <div class="mr-4 flex-shrink-0">
                            <div class="bg-nekopeach w-14 h-14 rounded-xl flex items-center justify-center">
                                <i class="fas fa-gifts text-white text-2xl"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="font-semibold text-lg text-nekopurple mb-2" style="font-size: 25px">Sconto Compleanno!</h3>
                            <p class="text-gray-600">Registra il tuo compleanno nel tuo profilo e ricevi un coupon del 15% da utilizzare nel tuo mese speciale!</p>
                            <div class="mt-3 flex items-center">
                                <span class="bg-nekopeach text-white px-2 py-1 rounded-md text-xs">Omaggio</span>
                                <span class="ml-3 text-xs text-gray-400"><i class="far fa-clock mr-1"></i> 5 giorni fa</span>
                            </div>
                        </div>
                    </div>

                    <!-- News item -->
                    <div class="flex items-start">
                        <div class="mr-4 flex-shrink-0">
                            <div class="bg-nekopeach w-14 h-14 rounded-xl flex items-center justify-center">
                                <i class="fas fa-calendar-alt text-white text-2xl"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="font-semibold text-lg text-nekopurple mb-2" style="font-size: 25px">Sakura Festival</h3>
                            <p class="text-gray-600">Festeggia con noi il Sakura Festival nel nostro negozio di Milano con sconti esclusivi su manga giapponesi e art book!</p>
                            <div class="mt-3 flex items-center">
                                <span class="bg-nekopeach text-white px-2 py-1 rounded-md text-xs">Evento</span>
                                <span class="ml-3 text-xs text-gray-400"><i class="far fa-clock mr-1"></i> 1 settimana fa</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Weekly Featured -->
            <div class="bg-white rounded-xl border-2 border-nekopeach mt-6 overflow-hidden">
                <div class="bg-gradient-to-r from-nekopink to-nekopeach p-4">
                    <h2 class="text-xl font-bold text-nekopeach flex items-center">
                        <i class="fas fa-crown mr-3" style="font-size: 30px"></i> Selezione della Settimana
                    </h2>
                </div>

                <div id="weeklyFeatured" class="grid grid-cols-1 md:grid-cols-2 gap-4 p-4">
                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaililac relative">
                        <div class="relative h-48 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=1000"
                                 alt="Chainsaw Man"
                                 class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                        </div>
                        <div class="p-4">
                            <h3 class="font-bold text-gray-800">Chainsaw Man Vol.1</h3>
                            <p class="text-gray-600 text-sm mt-1">Denji &egrave un ragazzo semplice con un sogno semplice...</p>
                            <div class="flex justify-between items-center mt-4">
                                <span class="text-nekored font-bold">&#8364 12,99</span>
                                <button class="bg-nekored hover:bg-nekopink text-white py-2 px-4 rounded-lg text-sm transition">
                                    <i class="fas fa-cart-plus mr-1"></i> Aggiungi
                                </button>
                            </div>
                        </div>
                        <div class="absolute top-2 left-2 bg-nekopink text-white px-2 py-1 rounded-md text-xs font-bold">POP!</div>
                    </div>

                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaiblue relative">
                        <div class="relative h-48 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1558494948-4ece8de63a5f?q=80&w=1000"
                                 alt="Berserk"
                                 class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
                        </div>
                        <div class="p-4">
                            <h3 class="font-bold text-gray-800">Berserk Vol.2</h3>
                            <p class="text-gray-600 text-sm mt-1">L'epico dark fantasy che ha ispirato una generazione...</p>
                            <div class="flex justify-between items-center mt-4">
                                <span class="text-nekored font-bold">&#8364 14,99</span>
                                <button class="bg-nekored hover:bg-nekopink text-white py-2 px-4 rounded-lg text-sm transition">
                                    <i class="fas fa-cart-plus mr-1"></i> Aggiungi
                                </button>
                            </div>
                        </div>
                        <div class="absolute top-2 left-2 bg-nekopurple text-white px-2 py-1 rounded-md text-xs font-bold">NEW!</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Featured Manga -->
        <div id="moreBuy" class="lg:col-span-1">
            <div class="bg-white rounded-xl border-2 border-nekoorange overflow-hidden h-full">
                <div class="bg-gradient-to-r from-nekopink to-nekoorange p-4">
                    <h2 class="text-xl font-bold text-nekopeach flex items-center">
                        <i class="fas fa-fire mr-3" style="font-size: 30px"></i> Pi&#249 Acquistati
                    </h2>
                </div>

                <div class="p-4 space-y-4">
                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-nekopink relative">
                        <div class="p-4 flex">
                            <div class="w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
                                <img src="https://images.unsplash.com/photo-1618331835717-801a9767105a?q=80&w=1000"
                                     alt="My Hero Academia"
                                     class="w-full h-full object-cover">
                            </div>

                            <div class="ml-4 flex flex-col justify-center">
                                <h3 class="font-bold text-gray-800">My Hero Academia Vol.30</h3>
                                <p class="text-gray-600 text-xs mt-1">Midoriya continua la sua formazione per diventare...</p>
                                <div class="mt-2 flex justify-between items-center">
                                    <span class="text-nekoorange font-bold">&#8364 10,99</span>
                                    <div class="flex items-center">
                                        <i class="fas fa-star text-yellow-400 text-sm"></i>
                                        <span class="ml-1 text-xs text-gray-600">4.9</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="absolute -bottom-4 -right-4 w-12 h-12 rounded-full bg-nekopink text-white flex items-center justify-center text-xl">
                            <i class="fas fa-1"></i>
                        </div>
                    </div>

                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaiblue relative">
                        <div class="p-4 flex">
                            <div class="w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
                                <img src="https://images.unsplash.com/photo-1619546813926-a0e32086d239?q=80&w=1000"
                                     alt="One Piece"
                                     class="w-full h-full object-cover">
                            </div>

                            <div class="ml-4 flex flex-col justify-center">
                                <h3 class="font-bold text-gray-800">One Piece Vol.102</h3>
                                <p class="text-gray-600 text-xs mt-1">Le nuove avventure di Rufy e la sua ciurma...</p>
                                <div class="mt-2 flex justify-between items-center">
                                    <span class="text-nekoorange font-bold">&#8364 11,49</span>
                                    <div class="flex items-center">
                                        <i class="fas fa-star text-yellow-400 text-sm"></i>
                                        <span class="ml-1 text-xs text-gray-600">4.8</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="absolute -bottom-4 -right-4 w-12 h-12 rounded-full bg-kawaiblue text-white flex items-center justify-center text-xl">
                            <i class="fas fa-2"></i>
                        </div>
                    </div>

                    <!-- Product -->
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-kawaililac relative">
                        <div class="p-4 flex">
                            <div class="w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
                                <img src="https://images.unsplash.com/photo-1592400374401-4f48e6e57b1f?q=80&w=1000"
                                     alt="Jujutsu Kaisen"
                                     class="w-full h-full object-cover">
                            </div>

                            <div class="ml-4 flex flex-col justify-center">
                                <h3 class="font-bold text-gray-800">Jujutsu Kaisen Vol.19</h3>
                                <p class="text-gray-600 text-xs mt-1">La battaglia contro i maledetti continua...</p>
                                <div class="mt-2 flex justify-between items-center">
                                    <span class="text-nekoorange font-bold">&#8364 10,99</span>
                                    <div class="flex items-center">
                                        <i class="fas fa-star text-yellow-400 text-sm"></i>
                                        <span class="ml-1 text-xs text-gray-600">4.7</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="absolute -bottom-4 -right-4 w-12 h-12 rounded-full bg-nekopurple text-white flex items-center justify-center text-xl">
                            <i class="fas fa-3"></i>
                        </div>
                    </div>

                    <a href="#" class="block mt-4 bg-nekoorange hover:bg-nekopink text-white text-center py-3 rounded-lg font-bold transition">
                        <i class="fas fa-arrow-right mr-2"></i> Vedi l'intera classifica
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Category Section -->
    <div class="mt-12">
        <h2 class="text-3xl font-bold text-center mb-8">
            <span class="nekotag">Esplora le Categorie</span>
        </h2>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <!-- Category -->
            <a onclick="event.preventDefault(); category('shonen')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-nekopink rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-user-ninja text-2xl text-nekopurple"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Shonen</h3>
                <p class="text-gray-600 mt-2 text-sm">Action e avventure epiche</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('shojo')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-kawaiblue rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-heart text-2xl text-pink-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Shojo</h3>
                <p class="text-gray-600 mt-2 text-sm">Storie romantiche</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('seinen')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-nekopink rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-brain text-2xl text-blue-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Seinen</h3>
                <p class="text-gray-600 mt-2 text-sm">Per lettori maturi</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('kemono')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-nekopink rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-paw text-2xl text-green-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Kemono</h3>
                <p class="text-gray-600 mt-2 text-sm">Animali antropomorfi</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('kodomo')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-kawaiblue rounded-full flex items-center justify-center mb-4">
                    <i class="fab fa-fort-awesome text-2xl text-red-500"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Kodomo</h3>
                <p class="text-gray-600 mt-2 text-sm">Per piccoli lettori</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('josei')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-kawaiblue rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-venus-double text-2xl text-fuchsia-600"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Josei</h3>
                <p class="text-gray-600 mt-2 text-sm">Intrighi ed emozioni al femminile</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('sci-Fi')" href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-kawaiblue rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-syringe text-2xl text-blue-600"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Sci-Fi</h3>
                <p class="text-gray-600 mt-2 text-sm">Tra realt&agrave e fantascienza</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>

            <!-- Category -->
            <a onclick="event.preventDefault(); category('horror')"  href="#" class="bg-nekopink p-6 rounded-xl border-2 border-nekopeach text-center group hover:shadow-lg transition">
                <div class="mx-auto w-16 h-16 bg-kawaiblue rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-spider text-2xl text-black-600"></i>
                </div>
                <h3 class="font-bold text-nekopeach text-lg" style="font-size: 25px">Horror</h3>
                <p class="text-gray-600 mt-2 text-sm">Brividi e terrore</p>
                <div class="mt-3 flex justify-center">
                    <div class="w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center">
                        <i class="fas fa-plus"></i>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <!-- Special Offer Banner -->
    <div class="mt-12 rounded-2xl overflow-hidden relative">
        <div class="absolute inset-0 bg-gradient-to-r from-nekopink to-nekopeach z-0"></div>
        <div class="relative z-10 p-8 md:p-12 flex flex-col md:flex-row items-center">
            <div class="text-center md:text-left mb-6 md:mb-0">
                <h3 class="text-2xl md: text-3xl font-bold text-white">Action Figure Limited Edition!</h3>
                <p class="text-white mt-2 max-w-md">Collezione esclusiva di figure da collezione con effetti luminosi e dettagli premium!</p>
                <button class="mt-4 bg-white text-nekopeach px-6 py-3 rounded-full font-bold hover:bg-pink-50 transition to_catalog">
                    <i class="fas fa-gifts mr-2"></i> Scopri di pi&ugrave
                </button>
            </div>

            <div class="md:ml-auto">
                <div class="relative">
                    <div class="absolute top-0 right-0 -mt-6 -mr-6 w-12 h-12 rounded-full bg-yellow-400 flex items-center justify-center">
                        <i class="fas fa-certificate text-white"></i>
                    </div>
                    <div id="limitedFigure" class="w-64 h-64 rounded-2xl overflow-hidden border-4 border-white shadow-2xl">
                        <img src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=1000"
                             alt="Limited Edition Figure"
                             class="w-full h-full object-cover">
                    </div>
                    <div class="absolute -bottom-4 -left-4 bg-white text-nekoorange px-4 py-2 rounded-lg font-bold shadow-lg">
                        Exclusive!
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
</footer>

</body>
</html>