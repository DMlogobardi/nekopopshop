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
  <title>NekoPopShop - Carrello</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/cart.css">
  <script src="frontend/Scripts/Carrello_Dainamic.js" defer></script>
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
          <i class="fas fa-paw text-white text-2xl"></i>
        </div>
        <div class="w-20 h-20 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
          <i class="fas fa-shopping-cart text-2xl text-nekopeach"></i>
        </div>
      </div>
      <div class="ml-4">
        <h1 class="text-3xl font-bold"><span class="nekotag">Il Tuo Carrello</span></h1>
        <p class="text-xl text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Manga & Action Figure</p>
      </div>
    </div>
    <jsp:include page="navBar.jsp" />
  </div>

  <jsp:include page="error.jsp" />

  <!-- Cart Content -->
  <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    <!-- Cart Items -->
    <div id="cartElement" class="lg:col-span-2">
      <div class="bg-white rounded-xl border-2 border-nekopeach overflow-hidden">
        <div class="bg-gradient-to-r from-nekopeach to-nekoorange p-4 flex items-center">
          <i class="fas fa-shopping-basket text-white text-2xl mr-3"></i>
          <h2 class="text-xl font-bold text-white" style="font-size: 30px">I Tuoi Prodotti</h2>
          <div id="numElement" class="ml-auto flex items-center">
            <span class="bg-white text-nekopeach px-3 py-1 rounded-full text-sm font-bold" id="item-count">articoli</span>
          </div>
        </div>

        <div class="p-4" id="cart-items-container">

        </div>

        <!-- Empty Cart State (hidden by default) -->
        <div class="empty-cart p-8 text-center hidden" id="empty-cart">
          <div class="w-32 h-32 bg-nekopink rounded-full flex items-center justify-center mx-auto mb-6">
            <i class="fas fa-shopping-basket text-4xl text-white"></i>
          </div>
          <h3 class="text-xl font-bold text-nekopeach mb-2">Il tuo carrello &egrave vuoto!</h3>
          <p class="text-gray-600 mb-6">Sfoglia il nostro catalogo e aggiungi i tuoi prodotti preferiti</p>
          <a href="catalog.jsp" class="bg-nekopeach hover:bg-nekopink text-white px-6 py-3 rounded-lg font-bold inline-block">
            <i class="fas fa-book mr-2"></i> Vai al Catalogo
          </a>
        </div>
      </div>

      <!-- Pagination -->
      <div class="w-full flex justify-center my-8 items-center gap-4">
        <button id="prev-btn" class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
          <i class="fas fa-arrow-left mr-2"></i> Precedente
        </button>

        <div id="pagination" class="flex items-center gap-2">
          <!-- Bottoni dinamici verranno generati qui -->
        </div>

        <button id="next-btn" class="bg-nekopeach hover:bg-nekored text-white px-6 py-3 rounded-full font-bold flex items-center transition">
          Successivo <i class="fas fa-arrow-right ml-2"></i>
        </button>
      </div>

      <!-- Coupon Section -->
      <div class="bg-white rounded-xl border-2 border-nekopeach mt-6 overflow-hidden">
        <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
          <h2 class="text-xl font-bold text-white flex items-center">
            <i class="fas fa-tag mr-3"></i> Codice Sconto
          </h2>
        </div>

        <div class="p-4">
          <div class="flex">
            <input type="text" id="codiceSconto" placeholder="Inserisci codice sconto"
                   class="flex-1 border-2 border-nekopeach rounded-l-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-nekopeach">
            <button onclick="setSconti()" class="bg-nekopeach hover:bg-nekopink text-white px-6 rounded-r-lg font-bold transition">
              Applica
            </button>
          </div>

          <div class="mt-4 bg-nekopink/20 rounded-lg p-3 hidden" id="coupon-success">
            <div class="flex items-center">
              <div class="w-8 h-8 rounded-full bg-green-500 text-white flex items-center justify-center mr-3">
                <i class="fas fa-check"></i>
              </div>
              <div>
                <p class="font-bold text-green-700">Codice sconto applicato!</p>
                <p class="text-sm text-green-600">Hai ottenuto uno sconto del 30% sul tuo ordine</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Order Summary -->
    <div class="lg:col-span-1">
      <div class="bg-white rounded-xl border-2 border-nekoorange overflow-hidden sticky top-6">
        <div class="bg-gradient-to-r from-nekoorange to-nekopink p-4">
          <h2 class="text-xl font-bold text-white flex items-center">
            <i class="fas fa-receipt mr-3"></i> Riepilogo Ordine
          </h2>
        </div>

        <div id="costo" class="p-4">
          <div class="space-y-3 mb-4">
            <div id="Subtotale" class="flex justify-between">
              <span class="text-gray-600">Subtotale</span>
              <span class="font-bold" id="subtotal">&#8364 68,57</span>
            </div>
            <div id="Spedizione" class="flex justify-between">
              <span class="text-gray-600">Spedizione</span>
              <span class="font-bold" id="shipping">&#8364 4,99</span>
            </div>
            <div class="flex justify-between hidden" id="discount-row">
              <span class="text-gray-600">Sconto</span>
              <span class="font-bold text-green-600" id="discount">-&#8364 6,86</span>
            </div>
          </div>

          <div class="border-t border-gray-200 pt-3 mb-6">
            <div class="flex justify-between">
              <span class="text-2xl font-bold">Totale</span>
              <span class="text-xl font-bold text-nekopeach" id="total">&#8364 66,70</span>
            </div>
          </div>

          <button class= "checkout-btn w-full text-white py-4 rounded-lg font-bold text-lg mb-4">
            <i class= "fas fa-lock mr-2" style="font-size: 20px"></i> Procedi al Checkout
          </button>

          <div class="text-center text-sm text-gray-500">
            <p>Spedizione stimata: 2-4 giorni lavorativi</p>
          </div>



          <!-- Secure Payment Info -->
          <div class="mt-6 bg-nekopink/10 rounded-lg p-3">
            <div class="flex items-center">
              <div class="w-10 h-10 rounded-full bg-green-500 text-white flex items-center justify-center mr-3">
                <i class="fas fa-lock"></i>
              </div>
              <div>
                <p class="text-sm font-bold">Pagamento sicuro</p>
                <p class="text-xs">Tutti i tuoi dati sono protetti</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Continue Shopping -->
      <div class="bg-white rounded-xl border-2 border-nekopeach mt-6 p-4 text-center">
        <a href="catalog.jsp" class="text-nekopeach hover:text-nekopink font-bold inline-flex items-center">
          <i class="fas fa-arrow-left mr-2"></i> Continua lo shopping
        </a>
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

<!-- Fixed chat button -->
<div class="fixed bottom-6 right-6 w-16 h-16 bg-gradient-to-br from-nekopink to-nekopurple rounded-full flex items-center justify-center shadow-xl z-50">
  <i class="fas fa-comment-alt text-white text-2xl"></i>
  <div class="absolute top-0 right-0 w-4 h-4 bg-red-500 rounded-full border-2 border-white animate-pulse"></div>
</div>
</body>
</html>
