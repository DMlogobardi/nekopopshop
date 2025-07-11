document.addEventListener('DOMContentLoaded', function() {
    initPaymentsTab();
});

function initPaymentsTab() {
    const paymentsTabBtn = document.getElementById('payments-tab-btn');
    if (!paymentsTabBtn) return;

    paymentsTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadPaymentsContent();
    });
}

function loadPaymentsContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showPaymentsLoading(mainContent);

    // Simula chiamata AJAX (sostituisci con chiamata reale)
    setTimeout(() => {
        renderPaymentsContent(mainContent);
    }, 800);
}

function showPaymentsLoading(container) {
    container.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopink"></div>
            <span class="ml-3 text-nekopeach">Caricamento metodi di pagamento...</span>
        </div>
    `;
}

function renderPaymentsContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="payments-tab">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-credit-card mr-3"></i> I tuoi Metodi di Pagamento
                    </h2>
                </div>

                <div class="p-6">
                    <!-- Tabs Navigation -->
                    <div class="flex mb-6">
                        <div class="form-tab active" onclick="openPaymentsTab('metodi-salvati')">
                            <i class="fas fa-heart mr-2"></i> Metodi Salvati
                        </div>
                        <div class="form-tab ml-2" onclick="openPaymentsTab('aggiungi-carta')">
                            <i class="far fa-credit-card mr-2"></i> Aggiungi Carta
                        </div>
                       
                    </div>

                    <!-- Saved Payment Methods -->
                    <div id="metodi-salvati" class="form-tab-content active">
                        <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                            <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-info-circle mr-2"></i> Salva i tuoi metodi di pagamento preferiti</h4>
                            <p class="text-sm text-gray-700">
                                Qui puoi gestire tutti i metodi di pagamento che hai salvato. Puoi aggiungere nuove carte,
                                modificare quelle esistenti o impostarne una come predefinita per acquisti più rapidi.
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
                                    <p class="text-gray-600 text-sm">Termina con •••• 4242 - Scadenza 05/2025</p>
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
                                    <p class="text-gray-600 text-sm">Termina con •••• 5555 - Scadenza 12/2024</p>
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

                   
                    </div>
                </div>
            </div>
        </div>
    `;

    // Aggiungi gestori eventi
    setupPaymentsEventHandlers();
    addPaymentsStyles();
}

function setupPaymentsEventHandlers() {
    // Switch between payments tabs
    window.openPaymentsTab = function(tabName) {
        const tabs = document.querySelectorAll('.form-tab');
        const tabContents = document.querySelectorAll('.form-tab-content');

        tabs.forEach(tab => tab.classList.remove('active'));
        tabContents.forEach(content => content.classList.remove('active'));

        event.currentTarget.classList.add('active');
        document.getElementById(tabName).classList.add('active');
    }

    // Format card number with spaces
    window.formatCardNumber = function(input) {
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
    window.formatExpiry = function(input) {
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
        }
    }

    // Update card preview with entered values
    window.updateCardPreview = function() {
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
    window.updatePayPalPreview = function() {
        const email = document.getElementById('paypal-email').value;
        const preview = document.getElementById('paypal-preview-email');

        if (email) {
            preview.textContent = email;
        } else {
            preview.textContent = 'email@esempio.com';
        }
    }

    // Form validation
    document.getElementById('addCreditCardForm')?.addEventListener('submit', function(e) {
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
            alert('Inserisci un CVV valido (3 o 4 cifre)');
            e.preventDefault();
            return;
        }
    });

    document.getElementById('addPayPalForm')?.addEventListener('submit', function(e) {
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

    // Set up event listeners for all input fields to update previews
    document.getElementById('card-number')?.addEventListener('input', updateCardPreview);
    document.getElementById('card-name')?.addEventListener('input', updateCardPreview);
    document.getElementById('card-expiry')?.addEventListener('input', updateCardPreview);
    document.getElementById('paypal-email')?.addEventListener('input', updatePayPalPreview);
}

function addPaymentsStyles() {
    if (document.getElementById('payments-styles')) return;

    const style = document.createElement('style');
    style.id = 'payments-styles';
    style.textContent = `
        /* Stili per le carte di credito */
        .credit-card {
            background: linear-gradient(135deg, #4a5568, #2d3748);
            border-radius: 12px;
            padding: 20px;
            color: white;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        
        .credit-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
        }
        
        .credit-card .card-type {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
        }
        
        .credit-card .card-number {
            font-size: 18px;
            letter-spacing: 2px;
            margin: 30px 0 20px;
            font-family: monospace;
        }
        
        .credit-card .card-expiry {
            font-size: 14px;
            margin-bottom: 5px;
        }
        
        .credit-card .card-name {
            font-size: 16px;
            text-transform: uppercase;
        }
        
        .credit-card-paypal {
            background: linear-gradient(135deg, #253b80, #179bd7);
        }
        
        .credit-card-paypal .card-type {
            color: #fff;
        }
        
        /* Stili per i metodi di pagamento */
        .payment-method-item {
            transition: all 0.3s ease;
            border: 2px solid #f2d5bb;
            border-radius: 10px;
            padding: 15px;
            position: relative;
            overflow: hidden;
        }
        
        .payment-method-item:hover {
            border-color: #E55458;
            transform: translateY(-3px);
        }
        
        .payment-method-item .payment-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f2d5bb;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #E55458;
            font-size: 20px;
            margin-right: 15px;
        }
        
        .payment-method-default-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #E55458;
            color: white;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
        }
        
        /* Stili per le tab */
        .form-tab {
            padding: 0.75rem 1.5rem;
            border-radius: 10px 10px 0 0;
            background-color: #f2d5bb;
            color: #E55458;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .form-tab.active {
            background-color: #E55458;
            color: white;
        }
        
        .form-tab-content {
            display: none;
        }
        
        .form-tab-content.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    `;
    document.head.appendChild(style);
}

// Versione con AJAX reale
/*
function loadPaymentsContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showPaymentsLoading(mainContent);

    fetch('/getPaymentMethods')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.text();
        })
        .then(html => {
            mainContent.innerHTML = html;
            setupPaymentsEventHandlers();
            addPaymentsStyles();
        })
        .catch(error => {
            mainContent.innerHTML = `
                <div class="text-center p-8 text-nekopeach">
                    <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                    <p>Si è verificato un errore durante il caricamento dei metodi di pagamento.</p>
                    <button onclick="loadPaymentsContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                        Riprova
                    </button>
                </div>
            `;
            console.error('Error loading payment methods:', error);
        });
}
*/