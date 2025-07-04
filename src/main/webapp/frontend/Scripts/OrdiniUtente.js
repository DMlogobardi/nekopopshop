// frontend/js/userOrders.js

document.addEventListener('DOMContentLoaded', function() {
    // Inizializza la gestione degli ordini
    initOrdersTab();
});

function initOrdersTab() {
    const ordersTabBtn = document.getElementById('orders-tab-btn');
    if (!ordersTabBtn) return;

    ordersTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadOrdersContent();
    });
}

function loadOrdersContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    // Mostra loader
    showLoading(mainContent);

    // Simula chiamata AJAX (sostituisci con chiamata reale)
    setTimeout(() => {
        renderOrdersContent(mainContent);
    }, 800);
}

function showLoading(container) {
    container.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopeach"></div>
        </div>
    `;
}

function renderOrdersContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="orders-tab">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
                    <h2 class="text-xl font-bold text-white flex items-center justify-between" style="font-size: 30px">
                        <span><i class="fas fa-shopping-bag mr-3"></i> I miei ordini</span>
                        <span class="text-sm bg-white/30 px-3 py-1 rounded-full font-normal">
                            2 ordini trovati
                        </span>
                    </h2>
                </div>

                <div class="p-6">
                    <!-- Ordine 1 -->
                    <div class="order-card bg-white p-4 rounded-lg relative mb-4">
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
                            <a href="#" class="text-sm text-nekoblue hover:underline">Dettagli</a>
                        </div>
                    </div>

                    <!-- Ordine 2 -->
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
                            <a href="#" class="text-sm text-nekoblue hover:underline">Dettagli</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;

    addOrdersStyles();
}

function addOrdersStyles() {
    // Verifica se gli stili sono già stati aggiunti
    if (document.getElementById('orders-styles')) return;

    const style = document.createElement('style');
    style.id = 'orders-styles';
    style.textContent = `
        .order-card {
            transition: all 0.3s ease;
            border-left: 4px solid #E55458;
        }
        .order-card:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
        }
        .badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.8rem;
            font-weight: bold;
        }
    `;
    document.head.appendChild(style);
}

// Versione con AJAX reale

function loadOrdersContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showLoading(mainContent);

    fetch('${pageContext.request.contextPath}/getUserOrders')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.text();
        })
        .then(html => {
            mainContent.innerHTML = html;
            addOrdersStyles();
        })
        .catch(error => {
            mainContent.innerHTML = `
                <div class="text-center p-8 text-nekopeach">
                    <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                    <p>Si è verificato un errore durante il caricamento degli ordini.</p>
                    <button onclick="loadOrdersContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                        Riprova
                    </button>
                </div>
            `;
            console.error('Error loading orders:', error);
        });
}
