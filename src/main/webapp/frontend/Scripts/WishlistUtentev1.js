// frontend/Scripts/WishlistUtentev1.js

document.addEventListener('DOMContentLoaded', function() {
    initWishlistTab();
});

function initWishlistTab() {
    const wishlistTabBtn = document.getElementById('wishlist-tab-btn');
    if (!wishlistTabBtn) return;

    wishlistTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadWishlistContent();
    });
}

function loadWishlistContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showWishlistLoading(mainContent);

    // Simula chiamata AJAX (sostituisci con chiamata reale)
    setTimeout(() => {
        renderWishlistContent(mainContent);
    }, 800);
}

function showWishlistLoading(container) {
    container.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopink"></div>
            <span class="ml-3 text-nekopeach">Caricamento wishlist...</span>
        </div>
    `;
}

function renderWishlistContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="wishlist-tab">
            <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
                <!-- Wishlist Header -->
                 <div class="bg-gradient-to-r from-nekopeach to-nekopink p-6 ">
                    <h2 class="text-3xl font-bold text-white flex items-center">
                        <i class="fas fa-heart mr-3"></i> Lista Preferiti
                    </h2>
                </div>
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div>
                 
                            <div class="bg-1/2 h-auto rounded-md flex items-center justify-center gap-4white">
                            
                        </div>
                        <div class="mt-4 md:mt-0 flex space-x-3">
                            <button class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                                <i class="fas fa-share-alt mr-2"></i> Condividi
                            </button>
                            <button id="sort-wishlist" class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                                <i class="fas fa-sort mr-2"></i> Ordina
                            </button>
                            <button id="search-wishlist" class="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition flex items-center">
                                <i class="fas fa-search mr-2"></i> Cerca
                            </button>
                        </div>
                    </div>
                </div>

    

                <!-- Wishlist Items -->
                <div class="p-6">
                    <!-- Empty State (hidden by default) -->
                    <div id="empty-wishlist" class="empty-wishlist hidden">
                        <i class="fas fa-heart-broken text-5xl text-gray-300 mb-4"></i>
                        <h3 class="text-xl font-bold text-gray-600 mb-2">La tua wishlist è vuota</h3>
                        <p class="text-gray-500 mb-4">Aggiungi articoli che ti interessano cliccando sull'icona del cuore</p>
                        <button class="bg-nekopeach hover:bg-nekored text-white font-bold py-2 px-6 rounded-full transition">
                            Esplora il catalogo
                        </button>
                    </div>

                    <!-- Wishlist Items Grid -->
                    <div id="wishlist-items-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <!-- Items will be loaded here dynamically -->
                    </div>

                    <!-- Pagination -->
                    <div class="mt-8 flex justify-center">
                        <nav class="flex items-center space-x-1">
                            <button class="pagination-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" data-page="prev">
                                <i class="fas fa-chevron-left text-xs"></i>
                            </button>
                            <button class="pagination-btn w-10 h-10 rounded-full border border-nekopeach bg-nekopeach text-white flex items-center justify-center" data-page="1">
                                1
                            </button>
                            <button class="pagination-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" data-page="2">
                                2
                            </button>
                            <button class="pagination-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" data-page="3">
                                3
                            </button>
                            <span class="px-2 text-gray-500">...</span>
                            <button class="pagination-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" data-page="8">
                                8
                            </button>
                            <button class="pagination-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" data-page="next">
                                <i class="fas fa-chevron-right text-xs"></i>
                            </button>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Carica gli elementi della wishlist
    loadWishlistItems();
    setupWishlistEventHandlers();
    addWishlistStyles();
}

function loadWishlistItems() {
    const wishlistGrid = document.getElementById('wishlist-items-grid');
    if (!wishlistGrid) return;

    // Simula dati della wishlist (sostituisci con chiamata AJAX reale)
    const wishlistItems = [
        {
            id: 1,
            title: "Jujutsu Kaisen Vol.15",
            author: "Gege Akutami",
            price: 14.99,
            originalPrice: 19.99,
            image: "https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=500",
            category: "Manga",
            code: "#JKS015",
            stock: "in",
            rating: 4.8
        },
        {
            id: 2,
            title: "Chainsaw Man - Denji Figure",
            author: "Tatsuki Fujimoto",
            price: 59.99,
            image: "https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=500",
            category: "Action Figure",
            code: "#CSM001",
            stock: "low",
            rating: 4.9
        },
        {
            id: 3,
            title: "Attack on Titan - Levi Figurine",
            author: "Hajime Isayama",
            price: 79.99,
            originalPrice: 89.99,
            image: "https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=500",
            category: "Preordine",
            code: "#AOT204",
            stock: "preorder",
            availableDate: "15/12/23",
            rating: 5.0
        }
    ];

    // Genera gli elementi della wishlist
    wishlistGrid.innerHTML = wishlistItems.map(item => `
        <div class="wishlist-item bg-white p-4 rounded-xl border border-gray-200" data-id="${item.id}" data-category="${item.category.toLowerCase()}" data-stock="${item.stock}">
            <div class="relative">
                <div class="wishlist-item-image overflow-hidden rounded-lg mb-3">
                    <img src="${item.image}" alt="${item.title}" class="w-full h-48 object-cover hover:scale-105 transition duration-300">
                </div>

                <button class="wishlist-remove-btn absolute top-2 right-2 w-8 h-8 rounded-full bg-white text-nekopeach flex items-center justify-center shadow-lg hover:text-nekored transition">
                    <i class="fas fa-heart"></i>
                </button>

                <div class="quick-shop-btn absolute bottom-16 right-2">
                    <button class="add-to-cart-btn w-8 h-8 rounded-full bg-nekopeach text-white flex items-center justify-center shadow-lg hover:bg-nekored transition">
                        <i class="fas fa-shopping-cart text-xs"></i>
                    </button>
                </div>

                <div class="flex justify-between items-center mb-2">
                    <span class="text-xs text-white ${getCategoryColorClass(item.category)} px-2 py-1 rounded-full">${item.category}</span>
                    <span class="text-xs text-gray-500">${item.code}</span>
                </div>

                <div class="mb-1">
                    ${renderStockInfo(item)}
                </div>
            </div>

            <h3 class="font-bold text-gray-800 text-sm mb-1 hover:text-nekopeach transition">${item.title}</h3>
            <p class="text-xs text-gray-500 mb-2">${item.author}</p>

            <div class="flex justify-between items-center">
                <div>
                    <span class="font-bold ${item.stock === 'out' ? 'text-gray-400' : 'text-nekopeach'}">€${item.price.toFixed(2)}</span>
                    ${item.originalPrice ? `<span class="text-xs text-gray-500 ml-1 line-through">€${item.originalPrice.toFixed(2)}</span>` : ''}
                </div>
                <div class="flex items-center">
                    <i class="fas fa-star text-yellow-400 text-xs"></i>
                    <span class="text-xs text-gray-600 ml-1">${item.rating}</span>
                </div>
            </div>
        </div>
    `).join('');
}

function renderStockInfo(item) {
    if (item.stock === 'preorder') {
        return `
            <div class="flex justify-between items-center">
                <span class="text-xs font-medium text-gray-500">Disponibile dal:</span>
                <span class="text-xs font-bold text-blue-500">${item.availableDate}</span>
            </div>
            <div class="stock-indicator bg-gray-200 mt-1"></div>
        `;
    } else {
        const stockText = {
            'in': { text: 'In stock', class: 'text-green-600' },
            'low': { text: 'Ultimi 3', class: 'text-yellow-600' },
            'out': { text: 'Esaurito', class: 'text-red-600' }
        };

        return `
            <div class="flex justify-between items-center">
                <span class="text-xs font-medium text-gray-500">Disponibilità:</span>
                <span class="text-xs font-bold ${stockText[item.stock].class}">${stockText[item.stock].text}</span>
            </div>
            <div class="stock-indicator ${getStockIndicatorClass(item.stock)} mt-1"></div>
        `;
    }
}

function getCategoryColorClass(category) {
    const colors = {
        'Manga': 'bg-nekopeach',
        'Action Figure': 'bg-nekoorange',
        'Preordine': 'bg-nekopink',
        'Merchandise': 'bg-purple-500',
        'Poster': 'bg-blue-500'
    };
    return colors[category] || 'bg-gray-500';
}

function getStockIndicatorClass(stock) {
    const classes = {
        'in': 'stock-in',
        'low': 'stock-low',
        'out': 'stock-out'
    };
    return classes[stock] || '';
}

function setupWishlistEventHandlers() {
    // Filtri
    const filterButtons = document.querySelectorAll('.filter-btn');
    filterButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            filterButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const filter = this.getAttribute('data-filter');
            filterWishlistItems(filter);
        });
    });

    // Rimozione elementi
    document.querySelectorAll('.wishlist-remove-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const item = this.closest('.wishlist-item');
            removeWishlistItem(item);
        });
    });

    // Aggiungi al carrello
    document.querySelectorAll('.add-to-cart-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const item = this.closest('.wishlist-item');
            addToCart(item);
        });
    });

    // Paginazione
    document.querySelectorAll('.pagination-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const page = this.getAttribute('data-page');
            handlePagination(page);
        });
    });

    // Ordinamento
    const sortBtn = document.getElementById('sort-wishlist');
    if (sortBtn) {
        sortBtn.addEventListener('click', showSortOptions);
    }

    // Ricerca
    const searchBtn = document.getElementById('search-wishlist');
    if (searchBtn) {
        searchBtn.addEventListener('click', showSearchBar);
    }
}

function filterWishlistItems(filter) {
    const items = document.querySelectorAll('.wishlist-item');

    items.forEach(item => {
        switch(filter) {
            case 'all':
                item.style.display = 'block';
                break;
            case 'available':
                item.style.display = item.getAttribute('data-stock') === 'out' ? 'none' : 'block';
                break;
            case 'preorder':
                item.style.display = item.getAttribute('data-stock') === 'preorder' ? 'block' : 'none';
                break;
            case 'outofstock':
                item.style.display = item.getAttribute('data-stock') === 'out' ? 'block' : 'none';
                break;
            default:
                item.style.display = 'block';
        }
    });
}

function removeWishlistItem(item) {
    // Animazione di rimozione
    item.style.transform = 'scale(0.9)';
    item.style.opacity = '0';
    item.style.transition = 'all 0.3s ease';

    setTimeout(() => {
        item.remove();
        checkEmptyWishlist();
    }, 300);
}

function addToCart(item) {
    const itemId = item.getAttribute('data-id');
    console.log(`Aggiunto al carrello item ID: ${itemId}`);

    // Mostra notifica
    showNotification('Articolo aggiunto al carrello!', 'success');
}

function handlePagination(page) {
    console.log(`Pagina selezionata: ${page}`);
    // Qui implementeresti la logica di paginazione
}

function showSortOptions() {
    // Implementa il menu di ordinamento
    console.log('Mostra opzioni di ordinamento');
}

function showSearchBar() {
    // Implementa la barra di ricerca
    console.log('Mostra barra di ricerca');
}

function checkEmptyWishlist() {
    const wishlistGrid = document.getElementById('wishlist-items-grid');
    const emptyState = document.getElementById('empty-wishlist');

    if (wishlistGrid && emptyState) {
        if (wishlistGrid.children.length === 0) {
            emptyState.classList.remove('hidden');
        } else {
            emptyState.classList.add('hidden');
        }
    }
}

function showNotification(message, type) {
    const notification = document.createElement('div');
    notification.className = `fixed top-4 right-4 z-50 px-6 py-3 rounded-lg shadow-lg text-white ${
        type === 'success' ? 'bg-green-500' : 'bg-red-500'
    }`;
    notification.innerHTML = `
        <div class="flex items-center">
            <i class="fas ${type === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'} mr-2"></i>
            <span>${message}</span>
        </div>
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.classList.add('opacity-0', 'transition-opacity', 'duration-500');
        setTimeout(() => notification.remove(), 500);
    }, 3000);
}

function addWishlistStyles() {
    if (document.getElementById('wishlist-styles')) return;

    const style = document.createElement('style');
    style.id = 'wishlist-styles';
    style.textContent = `
        .wishlist-item {
            transition: all 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
        }
        
        .wishlist-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
        }
        
        .wishlist-item-image {
            transition: all 0.3s ease;
        }
        
        .wishlist-item-image:hover {
            transform: scale(1.05);
        }
        
        .stock-indicator {
            height: 8px;
            border-radius: 4px;
        }
        
        .stock-in {
            background-color: #4CAF50;
        }
        
        .stock-low {
            background-color: #FFC107;
            width: 20%;
        }
        
        .stock-out {
            background-color: #F44336;
        }
        
        .quick-shop-btn {
            transition: all 0.3s ease;
            opacity: 0;
        }
        
        .wishlist-item:hover .quick-shop-btn {
            opacity: 1;
        }
        
        .empty-wishlist {
            min-height: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        
        .filter-btn.active {
            background-color: #E55458 !important;
            color: white !important;
        }
    `;
    document.head.appendChild(style);
}

// Versione con AJAX reale
/*
function loadWishlistContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showWishlistLoading(mainContent);

    fetch('/getUserWishlist')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            renderWishlistContent(mainContent, data);
            setupWishlistEventHandlers();
            addWishlistStyles();
        })
        .catch(error => {
            mainContent.innerHTML = `
                <div class="text-center p-8 text-nekopeach">
                    <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                    <p>Si è verificato un errore durante il caricamento della wishlist.</p>
                    <button onclick="loadWishlistContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                        Riprova
                    </button>
                </div>
            `;
            console.error('Error loading wishlist:', error);
        });
}

function removeWishlistItem(item) {
    const itemId = item.getAttribute('data-id');

    fetch('/removeFromWishlist', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ itemId: itemId })
    })
    .then(response => {
        if (!response.ok) throw new Error('Rimozione fallita');
        return response.json();
    })
    .then(data => {
        // Animazione di rimozione
        item.style.transform = 'scale(0.9)';
        item.style.opacity = '0';
        item.style.transition = 'all 0.3s ease';

        setTimeout(() => {
            item.remove();
            checkEmptyWishlist();
            showNotification('Articolo rimosso dalla wishlist', 'success');
        }, 300);
    })
    .catch(error => {
        showNotification('Errore durante la rimozione', 'error');
        console.error('Error:', error);
    });
}
*/