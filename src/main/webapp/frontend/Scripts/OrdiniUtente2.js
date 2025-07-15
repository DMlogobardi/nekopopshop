// frontend/js/OrdiniUtente2.js
let currentPage = 1; // Variabile per tenere traccia della pagina corrente
document.addEventListener('DOMContentLoaded', function() {
    // Inizializza la gestione degli ordini
    initOrdersTab();
});

function initOrdersTab() {
    const ordersTabBtn = document.getElementById('orders-tab-btn');
    if (!ordersTabBtn) return;

    ordersTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadOrdersContent(currentPage);
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

function renderOrdersContent(container, data) {
    container.innerHTML = `
        <div class="tab-content active" id="orders-tab">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
                    <h2 class="text-xl font-bold text-white flex items-center justify-between" style="font-size: 30px">
                        <span><i class="fas fa-shopping-bag mr-3"></i> I miei ordini</span>
                       
                    </h2>
                </div>

                <div class="p-6" id = "ordiniContainer">
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

                   
                        
                            <!-- Pagination -->
                    <div class="mt-8 flex justify-center">
                        <nav class="flex items-center space-x-1">
                            <button class="pagination-prev-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" 
                            data-page="prev" onclick="backPage()">
                                <i class="fas fa-chevron-left text-xs"></i>
                            </button>
                                
                            <button class="pagination-succ-btn w-10 h-10 rounded-full border border-gray-300 flex items-center justify-center text-gray-500 hover:bg-gray-100" 
                            data-page="next" onclick="succPage()">
                                <i class="fas fa-chevron-right text-xs"></i>
                            </button>
                        </nav>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    `;




    addOrdersStyles();
    initOrdersTab();
}

function riempiContainer(data) {
    let container = document.getElementById("ordiniContainer");
    container.innerHTML = "";
    data.forEach((item) => {
        let orderCard = document.createElement("div");
        orderCard.innerHTML = createOrdersCardHTML(item);
        container.appendChild(orderCard);
    })
    function createOrdersCardHTML(item) {
        return `
                    <div class="order-card bg-white p-4 rounded-lg relative mb-4">
                        <div class="flex justify-between items-start">
                            <div>
                                <h4 class="font-bold text-gray-800">Ordine #NEKO ${item.idOrdine}</h4>
                                <p class="text-sm text-gray-600">${item.dataOrdine}</p>
                            </div>
                            
                        </div>
                        
                        <div class="mt-3 flex justify-between items-center">
                            <span class="font-bold text-nekopeach">${item.tot}&#8364</span>
                            
                        </div>
                    </div>`
    }
    }

function succPage(){

    if(currentPageWishlist > 1){
        currentPageWishlist--;
        loadWishlistContent(currentPageWishlist);
    }

}

function backPage(){
    if(elem){
        currentPageWishlist++;
        loadWishlistContent(currentPageWishlist);
        if(elem === false){
            currentPageWishlist--;
            loadWishlistContent(currentPageWishlist);
        }
    }
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


let element = true;
function loadOrdersContent(page = 1) {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;
    const params = new URLSearchParams();
    params.append("action", "ordini");
    params.append("actionOrdini", "list");
    params.append("page", page.toString()),
        showLoading(mainContent);

    fetch('common/utentdategesture',{
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body:params.toString()
    })

        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })

        .then(data => {
        if(data === undefined || data.length === 0) {
            element = false;
            mainContent.innerHTML = `
                    <div class="p-6">
                      <div class="empty-orders">
                        <i class="fas fa-heart-broken text-5xl text-gray-300 mb-4"></i>
                        <h3 class="text-xl font-bold text-gray-600 mb-2">Non sono ancora stati effettuati ordini</h3>
                        <button class="bg-nekopeach hover:bg-nekored text>white font-bold py-2 px-6 rounded-full transition" id="catalog-ref">
                            Esplora il catalogo
                        </button>
                    </div>
                    </div>
                  
                `;
            document.getElementById("catalog-ref").addEventListener("click",()=>{
                window.location.href="catalog.jsp";
            });
        }else{
            renderOrdersContent(mainContent,data);
            element = true;
            riempiContainer(data);
        }


        addOrdersStyles();
    })  .catch(error => {
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
    })
}