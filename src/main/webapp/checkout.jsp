<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Checkout</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/checkout.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/checkout_dainamic.js" defer></script>

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
<body class="bg-gray-50">

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-nekopeach z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-paw text-white text-lg"></i>
                </div>
                <img src="frontend/images/logo_nekopop.jpg"
                     alt="NekoPop Logo"
                     style="width: 120px; height: 120px;"
                     class="rounded-full border-4 border-white shadow-lg">
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold "> <span class="nekotag">NekoPop Shop</span></h1>
                <p class= "text-sm text-nekopeach font-bold" style="font-size: 20px; background: linear-gradient(90deg, #E55458, #F29966);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;"> Manga & Action Figure</p>
            </div>
        </div>

        <!-- Navigation -->
        <jsp:include page="navBar.jsp" />
    </div>
    <jsp:include page="error.jsp" />

    <div class="container mx-auto px-4 py-8">

        <!-- Header -->
        <div class="flex items-center mb-8">
            <div class="w-16 h-16 rounded-full bg-nekopeach flex items-center justify-center mr-4">
                <i class="fas fa-shopping-bag text-white text-2xl"></i>
            </div>
            <div>
                <h1 class="text-3xl font-bold text-gray-1000">Checkout</h1>
                <p class="text-nekopeach font-semibold">Completa il tuo acquisto</p>
            </div>
        </div>
        <div class="container mx-auto px-4 py-8">
            <!-- Pulsante Torna Indietro -->
            <div class="mb-6">
                <button onclick="window.history.back()" class="back-button">
                    <i class="fas fa-arrow-left mr-2"></i> Torna Indietro
                </button>
            </div>
        <div class="flex flex-col lg:flex-row gap-8">
            <!-- Left Column - Form -->
            <div class="lg:w-2/3">
                <!-- Shipping Address -->
                <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                    <h2 class="text-xl font-bold mb-4 text-gray-700">
                        <i class="fas fa-map-marker-alt text-nekopeach mr-2"></i> Indirizzo di spedizione
                    </h2>

                    <!-- Address Selection -->
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Seleziona un indirizzo:</label>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4" id="shipping-address-list">


                        </div>
                    </div>

                    <!-- Add New Address Button -->
                    <button id="add-new-address" class="text-nekopeach font-medium text-sm hover:text-nekored">
                        <i class="fas fa-plus mr-1"></i> Aggiungi nuovo indirizzo
                    </button>

                    <!-- New Address Form (hidden by default) -->
                    <div id="new-address-form" class="mt-4 hidden">
                        <h3 class="font-bold mb-3">Nuovo indirizzo</h3>
                        <form class="space-y-3">




                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">Via</label>
                                    <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="via" name="via">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">N civico</label>
                                    <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="civico" name="civico">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">CAP</label>
                                    <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="cap" name="cap">
                                </div>


                            </div>


                            <div class="flex justify-end space-x-3 pt-2">
                                <button type="button" id="cancel-new-address" class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-100">
                                    Annulla
                                </button>
                                <button type="button" class="bg-nekopeach hover:bg-nekopink text-white px-4 py-2 rounded-lg font-medium" onclick="addIndirizzo();">
                                    Salva indirizzo
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Payment Method -->
                <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                    <h2 class="text-xl font-bold mb-4 text-gray-700">
                        <i class="far fa-credit-card text-nekopeach mr-2"></i> Metodo di pagamento
                    </h2>

                    <!-- Payment Selection -->
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Seleziona un metodo di pagamento:</label>
                        <div class="space-y-3" id="payment-method-list">

                        </div>
                        <div class="text-nekopeach font-medium text-sm hover:text-nekored" id="add-new-card-btn">
                            <div class="flex items-center text-nekopeach">
                                <i class="fas fa-plus-circle text-xl mr-3"></i>
                                <h3 class="font-bold">Aggiungi nuova carta</h3>
                            </div>
                        </div>


                    </div>

                    <!-- New Card Form (hidden by default) -->
                    <div id="new-card-form" class="mt-4 hidden">
                        <h3 class="font-bold mb-3">Dettagli carta</h3>
                        <form class="space-y-3">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Nome</label>
                                <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="nome" name="nome">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Cognome</label>
                                <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="cognome" name="cognome">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Numero carta</label>
                                <input type="text" placeholder="1234 5678 9012 3456" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="nCarta" name="nCarta">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Tipo</label>
                                <input type="text" placeholder="Visa" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="tipo" name="tipo">
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">Mese scadenza</label>
                                    <select class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="mese" name="mese">
                                        <option>MM</option>
                                        <% for(int i=1; i<=12; i++) { %>
                                        <option value="<%= i %>"><%= String.format("%02d", i) %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">Anno scadenza</label>
                                    <select class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach" id="anno" name="anno">
                                        <option>YYYY</option>
                                        <% int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
                                            for(int i=0; i<10; i++) { %>
                                        <option value="<%= currentYear + i %>"><%= currentYear + i %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">CVV</label>
                                    <input type="text" placeholder="123" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-nekopeach focus:border-nekopeach">
                                </div>
                            </div>

                            <div class="flex justify-end space-x-3 pt-2">
                                <button type="button" id="cancel-new-card" class="px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-100">
                                    Annulla
                                </button>
                                <button type="button" class="bg-nekopeach hover:bg-nekopink text-white px-4 py-2 rounded-lg font-medium" onclick="addCarta()">
                                    Aggiungi carta
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Right Column - Order Summary -->
            <div class="lg:w-1/3">
                <div class="bg-white rounded-lg shadow-md p-6 sticky top-4">
                    <h2 class="text-xl font-bold mb-4 text-gray-700 border-b pb-2">
                        <i class="fas fa-shopping-cart text-nekopeach mr-2"></i> Riepilogo ordine
                    </h2>

                    <!-- Order Items -->
                    <div class="space-y-4 mb-4" id="items">
                        <div class="flex justify-between">
                            <div class="flex">
                                <div class="w-16 h-16 rounded-md overflow-hidden mr-3">
                                    <img src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=1000"
                                         alt="Chainsaw Man" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="font-medium">Chainsaw Man Vol.1</h3>
                                    <p class="text-sm text-gray-600">Quantità: 1</p>
                                </div>
                            </div>
                            <p class="font-medium">€13,59</p>
                        </div>

                        <div class="flex justify-between">
                            <div class="flex">
                                <div class="w-16 h-16 rounded-md overflow-hidden mr-3">
                                    <img src="https://images.unsplash.com/photo-1558494948-4ece8de63a5f?q=80&w=1000"
                                         alt="Berserk" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="font-medium">Berserk Vol.2</h3>
                                    <p class="text-sm text-gray-600">Quantità: 2</p>
                                </div>
                            </div>
                            <p class="font-medium">€29,98</p>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="border-t border-gray-200 pt-3 space-y-2 mb-4">
                        <div class="flex justify-between">
                            <span class="text-gray-600">Subtotale</span>
                            <span class="font-medium">€43,57</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-gray-600">Spedizione</span>
                            <span class="font-medium">€4,99</span>
                        </div>
                        <div class="flex justify-between text-lg font-bold pt-2">
                            <span>Totale</span>
                            <span class="text-nekopeach">€48,56</span>
                        </div>
                    </div>

                    <!-- Promo Code -->
                    <div class="mb-6">
                        <label for="promo-code" class="block text-sm font-medium text-gray-700 mb-1">Codice promozionale</label>
                        <div class="flex">
                            <input type="text" id="promo-code" class="flex-1 px-4 py-2 border border-gray-300 rounded-l-lg focus:ring-nekopeach focus:border-nekopeach">
                            <button class="bg-nekopeach hover:bg-nekopink text-white px-4 py-2 rounded-r-lg font-medium">
                                Applica
                            </button>
                        </div>
                    </div>

                    <!-- Checkout Button -->
                    <button id="complete-order" class="w-full bg-nekopeach hover:bg-nekopink text-white py-3 rounded-lg font-bold text-lg shadow-md hover:shadow-lg transition">
                        Completa ordine
                    </button>

                    <!-- Security Info -->
                    <div class="mt-4 text-center text-xs text-gray-500">
                        <p class="flex items-center justify-center">
                            <i class="fas fa-lock mr-1"></i> Pagamento sicuro crittografato
                        </p>
                        <div class="flex justify-center space-x-4 mt-2">
                            <i class="fab fa-cc-visa text-2xl text-gray-400"></i>
                            <i class="fab fa-cc-mastercard text-2xl text-gray-400"></i>
                            <i class="fab fa-cc-paypal text-2xl text-gray-400"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script>
        // Address selection
        document.getElementById("shipping-address-list").addEventListener("click", function (e) {
            const target = e.target.closest(".address-option");
            if (!target) return;

            document.querySelectorAll(".address-option").forEach(opt => {
                opt.classList.remove("selected-address");
                const checkIcon = opt.querySelector(".fa-check");
                if (checkIcon) checkIcon.classList.add("invisible");
            });

            target.classList.add("selected-address");
            const checkIcon = target.querySelector(".fa-check");
            if (checkIcon) checkIcon.classList.remove("invisible");
        });

        // Payment method selection
        document.getElementById("payment-method-list").addEventListener("click", function (e) {
            const target = e.target.closest(".payment-option");
            if (!target || target.id === "add-new-card-btn") return;

            document.querySelectorAll(".payment-option").forEach(opt => {
                opt.classList.remove("selected-payment");
                const checkIcon = opt.querySelector(".fa-check");
                if (checkIcon) checkIcon.classList.add("invisible");
            });

            target.classList.add("selected-payment");
            const checkIcon = target.querySelector(".fa-check");
            if (checkIcon) checkIcon.classList.remove("invisible");
        });

        // Add new address
        document.getElementById('add-new-address').addEventListener('click', function() {
            document.getElementById('new-address-form').classList.remove('hidden');
            this.classList.add('hidden');
        });

        document.getElementById('cancel-new-address').addEventListener('click', function() {
            document.getElementById('new-address-form').classList.add('hidden');
            document.getElementById('add-new-address').classList.remove('hidden');
        });

        // Add new card
        document.getElementById('add-new-card-btn').addEventListener('click', function() {
            document.getElementById('new-card-form').classList.remove('hidden');
            this.classList.add('hidden');
        });

        document.getElementById('cancel-new-card').addEventListener('click', function() {
            document.getElementById('new-card-form').classList.add('hidden');
            document.getElementById('add-new-card-btn').classList.remove('hidden');
        });

        // Complete order
        document.getElementById('complete-order').addEventListener('click', function() {
            // Validate selections
            const addressSelected = document.querySelector('.address-option.selected-address');
            const paymentSelected = document.querySelector('.payment-option.selected-payment');

            if(!addressSelected) {
                alert('Per favore seleziona un indirizzo di spedizione');
                return;
            }

            if(!paymentSelected || paymentSelected.id === 'add-new-card-btn') {
                alert('Per favore seleziona un metodo di pagamento valido');
                return;
            }

            // In a real app, you would submit the form to the server
            alert('Ordine completato con successo! Grazie per il tuo acquisto.');
            // window.location.href = 'order-confirmation.jsp';
        });
    </script>
</body>
</html>
