// frontend/Scripts/WishlistUtentev2.js

let currentPageWishlist = 1;
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

function renderWishlistContent(container, data) {
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
                

                    <!-- Wishlist Items Grid -->
                    <div id="wishlist-items-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <!-- Items will be loaded here dynamically -->
                    </div>

                    <!-- Pagination -->
                    <div class="mt-8 flex justify-center">
                        <nav class="flex items-center space-x-1">
                            <button class="pagination-prev-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" 
                            data-page="prev" onclick="indietroPage()">
                                <i class="fas fa-chevron-left text-xs"></i>
                            </button>
                                
                            <button class="pagination-succ-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" 
                            data-page="next" onclick="avantiPage()">
                                <i class="fas fa-chevron-right text-xs"></i>
                            </button>
                        </nav>
                    </div>
                    
                </div>
            </div>
        </div>
    `;



    setupWishlistEventHandlers();
    addWishlistStyles();
}


function avantiPage(){

        if(currentPageWishlist > 1){
            currentPageWishlist--;
            loadWishlistContent(currentPageWishlist);
        }

}

function indietroPage(){
    if(elem){
        currentPageWishlist++;
        loadWishlistContent(currentPageWishlist);
        if(elem === false){
            currentPageWishlist--;
            loadWishlistContent(currentPageWishlist);
        }
    }
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
let elem = true;

function loadWishlistContent(page = 1) {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;
    const params = new URLSearchParams();
    params.append("action", "wishlist");
    params.append("actionWishList", "list");
    params.append("page", page.toString()),

        showWishlistLoading(mainContent);

    fetch('common/utentdategesture',{
        method:'POST',
        headers:{
            'Content-type':'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body:params.toString(),
    })
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            if(data === undefined || data.length === 0) {
                elem = false;
                mainContent.innerHTML = `
                    <div class="empty-wishlist">
                        <i class="fas fa-heart-broken text-5xl text-gray-300 mb-4"></i>
                        <h3 class="text-xl font-bold text-gray-600 mb-2">La tua wishlist è vuota</h3>
                        <button class="bg-nekopeach hover:bg-nekored text>white font-bold py-2 px-6 rounded-full transition" id="catalog-ref">
                            Esplora il catalogo
                        </button>
                    </div>
                `;
                document.getElementById("catalog-ref").addEventListener("click",()=>{
                    window.location.href="catalog.jsp";
                });
            }else{
                renderWishlistContent(mainContent,data);
                specificheWishlistItem(data);
                riempiWishlistContainer(data);
                elem = true;
            }


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
function specificheWishlistItem(item){
    const params = new URLSearchParams();
    params.append("action", "wishlist");
    params.append("actionWishList","specifiche");
    params.append("id",item.idWishlist);


    fetch('common/utentdategesture', {
        method: 'POST',
        headers:{
            'Content-type':'application/x-www-form-urlencode; charset=UTF-8',
        },
        body: params.toString()
    })  .then(response => {
        if (!response.ok) throw new Error('Visualizzazione specifiche fallita');
        return response.json();

    }).then(data => {
        const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti
        const volumi = data.filter(item => item.idVolume !== undefined);// volumi


        const wishlistTable = document.getElementById("wishlist-items-grid");
        wishlistTable.innerHTML = "";

        item.forEach(e => {
            if (e.idVolume === undefined || e === 0) {
                prodotti.forEach(prod => {
                    if (prod.idProdotto == e.idProdotto) {
                        const imgSrc = item.imgProd
                            ? (item.imgProd.startsWith("data:")
                                ? item.imgProd
                                : `data:image/jpeg;base64,${item.imgProd}`)
                            : "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                        wishlistTable.innerHTML += `
                            <div class="order-card bg-white p-4 rounded-lg relative mb-4">
                                <img src="${imgSrc}" alt="" class="w-full h-48 object-cover rounded-lg mb-4">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h4 class="font-bold text-gray-800">${prod.nome}</h4>
                                        <p class="text-sm text-gray-600">${prod.descrizione}</p>`
                    }
                })
            } else {
                volumi.forEach(vol => {
                    if (vol.idVolume == e.idVolume) {
                        const prod = data.filter(item => item.idProdotto === vol.idProdotto);  // prodotti
                        const imgSrc = item.imgVol
                            ? (item.imgVol.startsWith("data:")
                                ? item.imgVol
                                : `data:image/jpeg;base64,${item.imgVol}`)
                            : "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                        wishlistTable.innerHTML += `
                                <div class="order-card bg-white p-4 rounded-lg relative mb-4">
                                    <img src="${imgSrc}" alt="" class="w-full h-48 object-cover rounded-lg mb-4">
                                    <div class="flex justify-between items-start">
                                        <div>
                                            <h4 class="font-bold text-gray-800">${prod.nome}</h4>
                                            <p class="text-sm text-gray-600">${prod.descrizione}</p>`
                    }


                })
            }


        })
    }).catch(error => {console.error('Error:', error)})
}
function riempiWishlistContainer(data) {
    let container = document.getElementById("wishlist-items-grid");
    container.innerHTML = "";
    data.forEach((item) => {
        let wishlistCard = document.createElement("div");
        wishlistCard.innerHTML = createWishlistCardHTML(item);
        container.appendChild(wishlistCard);
    })
    function createWishlistCardHTML(item) {
        return `
                    <div class="order-card bg-white p-4 rounded-lg relative mb-4">
                        <div class="flex justify-between items-start">
                            <div>
                                <h4 class="font-bold text-gray-800"> #NEKO ${item.idWishlist}</h4>
                              
                            </div>
                            
                        </div>
                        
                        <button onclick="specificheWishlistItem(\`${item.idWishlist}\`)" class="action-btn view-btn">
                                        <i class="fas fa-eye mr-1"></i> specifiche
                                    </button>
                        <button onclick="removeWishlistItem(\`${item.idWishlist}\`)" class="action-btn cancel-btn">
                                        <i class="fas fa-times mr-1"></i> elimina
                                    </button>
                    </div>`
    }

}

function removeWishlistItem(idWishlist) {
    const params = new URLSearchParams();
    params.append("action", "wishlist");
    params.append("actionWishList", "remove");
    const data={
        idWishlist: idWishlist,
        idProdotto: 0,
        idCliente: 0,
        idVolume:0,
    }
    params.append("json", JSON.stringify(data))

    fetch('common/utentdategesture', {
        method: 'POST',
        headers:{
            'Content-type':'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: params.toString()
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
