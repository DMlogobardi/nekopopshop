

document.addEventListener('DOMContentLoaded', function() {
    initDashboardTab();
});

function initDashboardTab() {
    const dashboardTabBtn = document.getElementById('dashboard-tab-btn');
    if (!dashboardTabBtn) {
        console.warn("Elemento 'dashboard-tab-btn' non trovato. La dashboard potrebbe non essere caricabile tramite click.");
        return;
    }


    dashboardTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadDashboardContent();
    });


    const mainContent = document.querySelector('.lg\\:col-span-3');
    const dashboardTab = document.getElementById('dashboard-tab');

    // Controlla se la dashboard è il tab attivo all'avvio della pagina
    // e se non ha ancora contenuto (un semplice check sull'innerHTML)
    if (dashboardTab && dashboardTab.classList.contains('active') && dashboardTab.innerHTML.trim() === '') {
        loadDashboardContent();
    }
}


function loadDashboardContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) {
        console.error("Contenitore principale per la dashboard non trovato.");
        return;
    }

    // Usiamo un attributo data-loaded sul contenitore del tab per gestire il caricamento
    const dashboardTab = document.getElementById('dashboard-tab');
    if (dashboardTab && dashboardTab.dataset.loaded === 'true') {
        console.log("Dashboard già caricata. Aggiornamento dati...");
        // Se il contenuto HTML è già presente, aggiorna solo i dati
        loadDashboardData();
        setupDashboardEventHandlers(); // Riapplica i listener per sicurezza
        return;
    }

    showDashboardLoading(mainContent);

    // Simula chiamata AJAX (sostituisci con chiamata reale)
    setTimeout(() => {
        renderDashboardContent(mainContent);
        if (dashboardTab) {
            dashboardTab.dataset.loaded = 'true'; // Segna il tab come caricato
        }
    }, 800);
}

function showDashboardLoading(container) {
    container.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekored"></div>
            <span class="ml-3 text-nekopeach">Caricamento dashboard...</span>
        </div>
    `;
}

function renderDashboardContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="dashboard-tab">
            <div class="profile-card bg-white border-2 border-nekored">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-tachometer-alt mr-3"></i> La tua dashboard
                    </h2>
                </div>

                <div class="p-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <div class="bg-nekopink/10 p-6 rounded-xl">
                            <h3 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                                <i class="fas fa-shopping-bag mr-2"></i> Ultimi ordini
                            </h3>
                            <div class="space-y-4" id="recent-orders-container">
                                </div>
                            <div class="mt-4 text-center">
                                <a href="${pageContext.request.contextPath}/ordiniutente.jsp" class="text-sm text-nekopeach font-bold hover:underline">Vedi tutti gli ordini</a>
                            </div>
                        </div>

                        <div class="bg-nekored/10 p-6 rounded-xl">
                            <h3 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                                <i class="fas fa-heart mr-2"></i> Lista desideri
                            </h3>
                            <div class="space-y-4" id="wishlist-items-container">
                                </div>
                            <div class="mt-4 text-center">
                                <a href="${pageContext.request.contextPath}/wishlist.jsp" class="text-sm text-nekopeach font-bold hover:underline">Vedi tutta la lista desideri</a>
                            </div>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
                        <div class="bg-white p-4 rounded-lg border border-nekopink">
                            <div class="flex items-center">
                                <div class="bg-nekopink/20 p-3 rounded-full mr-3">
                                    <i class="fas fa-shopping-cart text-nekopink"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500">Ordini totali</p>
                                    <p class="text-xl font-bold text-nekored" id="total-orders">0</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="bg-white p-4 rounded-lg border border-nekoblue">
                            <div class="flex items-center">
                                <div class="bg-nekoblue/20 p-3 rounded-full mr-3">
                                    <i class="fas fa-heart text-nekoblue"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500">Elementi in wishlist</p>
                                    <p class="text-xl font-bold text-nekoblue" id="wishlist-count">0</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="bg-white p-4 rounded-lg border border-nekoorange">
                            <div class="flex items-center">
                                <div class="bg-nekoorange/20 p-3 rounded-full mr-3">
                                    <i class="fas fa-star text-nekoorange"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500">Punti fedeltà</p>
                                    <p class="text-xl font-bold text-nekoorange" id="loyalty-points">0</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="bg-nekoblue/10 p-6 rounded-xl">
                        <h3 class="font-bold text-lg text-nekoblue mb-4 flex items-center">
                            <i class="fas fa-lightbulb mr-2"></i> Potrebbero piacerti
                        </h3>
                        <div class="grid grid-cols-2 md:grid-cols-4 gap-4" id="recommended-products">
                            </div>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Carica i dati
    loadDashboardData();
    setupDashboardEventHandlers();
    addDashboardStyles();
}

function loadDashboardData() {
    // Carica gli ordini recenti
    fetchRecentOrders();

    // Carica gli elementi della wishlist
    fetchWishlistItems();

    // Carica le statistiche
    fetchUserStats();

    // Carica i prodotti consigliati
    fetchRecommendedProducts();
}

function fetchRecentOrders() {
    // Simulazione dati - sostituire con chiamata AJAX reale
    const orders = [
        {
            id: "NEKO-2023-045",
            date: "15 Ottobre 2023",
            status: "Spedito",
            statusClass: "bg-green-100 text-green-800",
            items: [
                { image: "https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=100" },
                { image: "https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" }
            ],
            extraItems: 2,
            total: "42,97",
            link: "#"
        },
        {
            id: "NEKO-2023-044",
            date: "2 Ottobre 2023",
            status: "In elaborazione",
            statusClass: "bg-blue-100 text-blue-800",
            items: [
                { image: "https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" }
            ],
            extraItems: 0,
            total: "39,99",
            link: "#"
        }
    ];

    const container = document.getElementById('recent-orders-container');
    if (!container) return;

    container.innerHTML = orders.map(order => `
        <div class="order-card bg-white p-4 rounded-lg relative hover:shadow-md transition">
            <div class="flex justify-between items-start">
                <div>
                    <h4 class="font-bold text-gray-800">Ordine #${order.id}</h4>
                    <p class="text-sm text-gray-600">${order.date}</p>
                </div>
                <span class="badge ${order.statusClass} px-2 py-1 rounded text-xs">${order.status}</span>
            </div>
            <div class="mt-2 flex items-center">
                ${order.items.map(item => `
                    <div class="w-10 h-10 rounded-full overflow-hidden mr-2">
                        <img src="${item.image}" alt="Prodotto" class="w-full h-full object-cover">
                    </div>
                `).join('')}
                ${order.extraItems > 0 ? `
                    <div class="text-sm text-gray-500">+${order.extraItems} altri</div>
                ` : ''}
            </div>
            <div class="mt-3 flex justify-between items-center">
                <span class="font-bold text-nekopeach">€ ${order.total}</span>
                <a href="${order.link}" class="text-sm text-nekoblue hover:underline">Dettagli</a>
            </div>
        </div>
    `).join('');
}

function fetchWishlistItems() {
    // Simulazione dati - sostituire con chiamata AJAX reale
    const wishlistItems = [
        {
            image: "https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200",
            title: "Jujutsu Kaisen Vol.15",
            availability: "Disponibile dal 15/11",
            price: "14,99"
        },
        {
            image: "https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=200",
            title: "Chainsaw Man - Denji Figure",
            availability: "Disponibile",
            price: "59,99"
        }
    ];

    const container = document.getElementById('wishlist-items-container');
    if (!container) return;

    container.innerHTML = wishlistItems.map(item => `
        <div class="wishlist-item bg-white p-3 rounded-lg flex items-center hover:shadow-md transition">
            <div class="w-16 h-16 rounded-lg overflow-hidden flex-shrink-0">
                <img src="${item.image}" alt="${item.title}" class="w-full h-full object-cover">
            </div>
            <div class="ml-3 flex-1">
                <h4 class="font-bold text-sm text-gray-800">${item.title}</h4>
                <p class="text-xs text-gray-600">${item.availability}</p>
            </div>
            <div class="text-right">
                <span class="block font-bold text-nekopeach">€ ${item.price}</span>
                <button class="text-xs text-nekoblue hover:underline">Aggiungi al carrello</button>
            </div>
        </div>
    `).join('');
}

function fetchUserStats() {
    // Simulazione dati - sostituire con chiamata AJAX reale
    document.getElementById('total-orders').textContent = '12';
    document.getElementById('wishlist-count').textContent = '5';
    document.getElementById('loyalty-points').textContent = '350';
}

function fetchRecommendedProducts() {
    // Simulazione dati - sostituire con chiamata AJAX reale
    const products = [
        {
            image: "https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200",
            title: "Jujutsu Kaisen Vol.16",
            price: "14,99"
        },
        {
            image: "https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=200",
            title: "Chainsaw Man Poster",
            price: "9,99"
        },
        {
            image: "https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=200",
            title: "Attack on Titan Keychain",
            price: "6,99"
        },
        {
            image: "https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=200",
            title: "Demon Slayer T-Shirt",
            price: "19,99"
        }
    ];

    const container = document.getElementById('recommended-products');
    if (!container) return;

    container.innerHTML = products.map(product => `
        <div class="product-card bg-white p-3 rounded-lg hover:shadow-md transition">
            <div class="w-full h-40 rounded-lg overflow-hidden mb-2">
                <img src="${product.image}" alt="${product.title}" class="w-full h-full object-cover">
            </div>
            <h4 class="font-bold text-sm text-gray-800 truncate">${product.title}</h4>
            <p class="font-bold text-nekopeach">€ ${product.price}</p>
            <button class="mt-2 w-full bg-nekoblue text-white py-1 rounded text-sm hover:bg-nekoblue-dark transition">
                Aggiungi al carrello
            </button>
        </div>
    `).join('');
}

function setupDashboardEventHandlers() {
    // Aggiungi gestori eventi per i pulsanti "Aggiungi al carrello"
    document.querySelectorAll('.wishlist-item button').forEach(button => {
        button.addEventListener('click', function() {
            const productName = this.closest('.wishlist-item').querySelector('h4').textContent;
            showNotification(`${productName} aggiunto al carrello!`, 'success');
        });
    });

    document.querySelectorAll('.product-card button').forEach(button => {
        button.addEventListener('click', function() {
            const productName = this.closest('.product-card').querySelector('h4').textContent;
            showNotification(`${productName} aggiunto al carrello!`, 'success');
        });
    });

    // Gestione click sugli ordini
    document.querySelectorAll('.order-card').forEach(card => {
        card.addEventListener('click', function(e) {
            if (!e.target.closest('a')) {
                const orderId = this.querySelector('h4').textContent.replace('Ordine #', '');
                // Potresti navigare alla pagina dell'ordine o mostrare un modal
                console.log(`Visualizza ordine: ${orderId}`);
            }
        });
    });
}

function showNotification(message, type = 'info') {
    const colors = {
        info: 'bg-blue-100 text-blue-800',
        success: 'bg-green-100 text-green-800',
        error: 'bg-red-100 text-red-800',
        warning: 'bg-yellow-100 text-yellow-800'
    };

    const notification = document.createElement('div');
    notification.className = `fixed top-4 right-4 px-6 py-3 rounded-lg shadow-lg ${colors[type]} z-50`;
    notification.innerHTML = `
        <div class="flex items-center">
            <i class="fas ${type === 'success' ? 'fa-check-circle' : type === 'error' ? 'fa-times-circle' : 'fa-info-circle'} mr-2"></i>
            <span>${message}</span>
        </div>
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.classList.add('opacity-0', 'transition-opacity', 'duration-500');
        setTimeout(() => notification.remove(), 500);
    }, 3000);
}

function addDashboardStyles() {
    if (document.getElementById('dashboard-styles')) return;

    const style = document.createElement('style');
    style.id = 'dashboard-styles';
    style.textContent = `
        /* Stili per le card */
        .profile-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        /* Stili per gli ordini */
        .order-card {
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .order-card:hover {
            transform: translateY(-2px);
        }
        
        .badge {
            font-size: 12px;
            padding: 2px 8px;
            border-radius: 12px;
            font-weight: bold;
        }
        
        /* Stili per la wishlist */
        .wishlist-item {
            transition: all 0.3s ease;
        }
        
        .wishlist-item:hover {
            transform: translateY(-2px);
        }
        
        /* Stili per i prodotti consigliati */
        .product-card {
            transition: all 0.3s ease;
        }
        
        .product-card:hover {
            transform: translateY(-3px);
        }
        
        /* Stili per le statistiche */
        [class*="bg-"]/20 {
            background-color: rgba(var(--color-primary), 0.2);
        }
        
        /* Animazioni */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .tab-content {
            animation: fadeIn 0.5s ease;
        }
    `;
    document.head.appendChild(style);
}

function loadDashboardContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) {
        console.error("Contenitore principale per la dashboard non trovato.");
        return;
    }

    // Usiamo un attributo data-loaded sul contenitore del tab per gestire il caricamento
    const dashboardTab = document.getElementById('dashboard-tab');
    if (dashboardTab && dashboardTab.dataset.loaded === 'true') {
        console.log("Dashboard già caricata. Aggiornamento dati...");
        // Se il contenuto HTML è già presente, aggiorna solo i dati
        loadDashboardData();
        setupDashboardEventHandlers(); // Riapplica i listener per sicurezza
        return;
    }

    showDashboardLoading(mainContent);

    // Chiamata AJAX reale
    fetch('/getUserDashboard')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            renderDashboardContent(mainContent, data);
            if (dashboardTab) {
                dashboardTab.dataset.loaded = 'true'; // Segna il tab come caricato
            }
            setupDashboardEventHandlers();
            addDashboardStyles();
        })
        .catch(error => {
            mainContent.innerHTML = `
                <div class="text-center p-8 text-nekopeach">
                    <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                    <p>Si è verificato un errore durante il caricamento della dashboard.</p>
                    <button onclick="loadDashboardContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                        Riprova
                    </button>
                </div>
            `;
            console.error('Error loading dashboard:', error);
        });
}

function fetchRecentOrders() {
    // Prepara i parametri per la richiesta
    const params = new URLSearchParams();
    params.append('action', 'ordini');

    // Effettua la chiamata AJAX al servlet UtentDataGesture
    fetch('/common/utentdategesture', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            // Assumi che `data` sia un array di ordini
            const container = document.getElementById('recent-orders-container');
            if (!container) return;

            // Aggiorna il contenitore con gli ordini ricevuti
            container.innerHTML = data.map(order => `
            <div class="order-card bg-white p-4 rounded-lg relative hover:shadow-md transition">
                <div class="flex justify-between items-start">
                    <div>
                        <h4 class="font-bold text-gray-800">Ordine #${order.id}</h4>
                        <p class="text-sm text-gray-600">${order.date}</p>
                    </div>
                    <span class="badge ${order.statusClass} px-2 py-1 rounded text-xs">${order.status}</span>
                </div>
                <div class="mt-2 flex items-center">
                    ${order.items.map(item => `
                        <div class="w-10 h-10 rounded-full overflow-hidden mr-2">
                            <img src="${item.image}" alt="Prodotto" class="w-full h-full object-cover">
                        </div>
                    `).join('')}
                    ${order.extraItems > 0 ? `<div class="text-sm text-gray-500">+${order.extraItems} altri</div>` : ''}
                </div>
                <div class="mt-3 flex justify-between items-center">
                    <span class="font-bold text-nekopeach">€ ${order.total}</span>
                    <a href="${order.link}" class="text-sm text-nekoblue hover:underline">Dettagli</a>
                </div>
            </div>
        `).join('');
        })
        .catch(error => {
            console.error('Error fetching recent orders:', error);
        });
}
