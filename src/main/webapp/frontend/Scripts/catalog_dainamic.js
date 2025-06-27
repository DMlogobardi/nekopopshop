function mostraErrore(msg) {
    const erroreBox = document.getElementById("messaggioErrore");
    erroreBox.textContent = msg;
    erroreBox.classList.remove("hidden");

    erroreBox.scrollIntoView({ behavior: "smooth", block: "center" });

    setTimeout(() => {
        erroreBox.classList.add("hidden");
    }, 5000);
}

function fetchTotProd(){
    return fetch("getcatalog?tot=tot").then(res => res.json())
        .then(data =>{
            if (data.totale !== undefined) {
                return parseInt(data.totale);
            } else {
                throw new Error("Totale non disponibile");
            }
        })
}

let currentPage = 1;

function aggiornaPaginazione(totalCount, currentPage, perPage, onPageChange) {
    const totalPages = Math.ceil(totalCount / perPage);
    const pagination = document.getElementById('pagination');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');

    pagination.innerHTML = '';

    function createPageButton(label, page, isActive = false, isEllipsis = false) {
        const el = document.createElement(isEllipsis ? 'span' : 'a');
        el.className = isEllipsis
            ? 'text-nekopeach px-2'
            : `w-10 h-10 ${isActive ? 'bg-nekopeach text-white' : 'bg-white text-nekopeach'} rounded-full flex items-center justify-center font-bold hover:bg-nekopink hover:text-white transition`;

        if (isEllipsis) {
            el.textContent = '...';
        } else {
            el.href = '#';
            el.textContent = label;
            el.dataset.page = page;
            el.addEventListener('click', (e) => {
                e.preventDefault();
                if (page !== currentPage) onPageChange(page);
            });
        }

        pagination.appendChild(el);
    }

    // Mostra al massimo 5 pagine + prima/ultima + ellipsis
    const maxVisible = 5;
    const pages = [];

    if (totalPages <= maxVisible + 2) {
        for (let i = 1; i <= totalPages; i++) {
            pages.push(i);
        }
    } else {
        if (currentPage <= 3) {
            pages.push(1, 2, 3, 4, '...', totalPages);
        } else if (currentPage >= totalPages - 2) {
            pages.push(1, '...', totalPages - 3, totalPages - 2, totalPages - 1, totalPages);
        } else {
            pages.push(1, '...', currentPage - 1, currentPage, currentPage + 1, '...', totalPages);
        }
    }

    pages.forEach(p => {
        if (p === '...') {
            createPageButton('...', null, false, true);
        } else {
            createPageButton(p, p, p === currentPage);
        }
    });

    // Gestione pulsanti Prev / Next
    prevBtn.disabled = currentPage === 1;
    nextBtn.disabled = currentPage === totalPages;

    prevBtn.onclick = () => {
        if (currentPage > 1) onPageChange(currentPage - 1);
    };

    nextBtn.onclick = () => {
        if (currentPage < totalPages) onPageChange(currentPage + 1);
    };
}


function generateDecorations() {
    const decorationsContainer = document.getElementById('decorations');
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    // Generate cherry blossom decorations
    for (let i = 0; i < 25; i++) {
        const blossom = document.createElement('div');
        blossom.className = 'cherry-blossom';
        blossom.style.left = `${Math.random() * viewportWidth}px`;
        blossom.style.animationDelay = `${Math.random() * 15}s`;
        blossom.style.opacity = `0.${Math.floor(2 + Math.random() * 7)}`;
        blossom.style.transform = `scale(${0.5 + Math.random()})`;
        decorationsContainer.appendChild(blossom);
    }
}

function setFilter(filter) {
    document.getElementById('filterInput').value = filter;
    document.getElementById('pageInput').value = 0;
    document.getElementById('searchForm').submit();

    // Update active state for filter buttons
    document.querySelectorAll('.filter-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    event.target.classList.add('active');
}

function caricaProdotti(pag = 0) {
    fetch(`getcatalog?page=${pag}&limit=6`)
        .then(res => res.json())
        .then(data => {
            const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti
            const volumi = data.filter(item => item.idVolume !== undefined);    // volumi

            const container = document.getElementById("catalogo");
            container.innerHTML = "";  // reset contenuto

            // Cicliamo prodotti validi e creiamo card + volumi associati
            prodotti.forEach(prod => {
                // Creo card prodotto
                if(prod.prezzo > 0) {
                    const prodCard = creaCardProdotto(prod);
                    container.appendChild(prodCard);
                }
            });

            volumi.forEach(vol => {
                const prod = prodotti.filter(item => item.idProdotto === vol.idProdotto);
                if(prod !== undefined){
                    const  volCard = creaCardVolume(vol, prod[0]);
                    container.appendChild(volCard);
                }
            })

        })

// Funzione per creare DOM card prodotto (action figure)
    function creaCardProdotto(prod) {
        const div = document.createElement("div");
        div.className = "product-card";

        const imgSrc = prod.imgProd ? `data:image/jpeg;base64,${prod.imgProd}` : "default-image.jpg";

        div.innerHTML = `
    <div class="relative h-64 overflow-hidden">
      <img src="${imgSrc}" alt="${prod.nome}" class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
    </div>
    <div class="p-4">
      <h3 class="font-bold text-gray-800">${prod.nome}</h3>
      <p class="text-gray-600 text-lg mt-2">${prod.descrizione}</p>
      <div class="mt-4 flex justify-between items-center">
        <span class="text-nekopeach font-bold">&#8364; ${prod.prezzo.toFixed(2)}</span>
        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition" 
                onclick="addToCart(${prod.idProdotto}, 'prodotto')">
          <i class="fas fa-cart-plus mr-1"></i> Aggiungi al carrello
        </button>
      </div>
      <div class="mt-2 flex items-center text-xs">
        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">Action figure</span>
      </div>
    </div>
  `;
        return div;
    }

// Funzione per creare DOM card volume
    function creaCardVolume(vol, prod) {
        const div = document.createElement("div");
        div.className = "product-card";

        const imgSrc = vol.imgVol ? `data:image/jpeg;base64,${vol.imgVol}` : "default-image.jpg";

        div.innerHTML = `
    <div class="relative h-64 overflow-hidden">
      <img src="${imgSrc}" alt="${prod.nome} ${vol.numVolumi}" class="w-full h-full object-cover transition-transform duration-300 hover:scale-105">
    </div>
    <div class="p-4">
      <h3 class="font-bold text-gray-800">${prod.nome} ${vol.numVolumi}</h3>
      <p class="text-gray-600 text-lg mt-2">${prod.descrizione}</p>
      <div class="mt-4 flex justify-between items-center">
        <span class="text-nekopeach font-bold">&#8364; ${vol.prezzo.toFixed(2)}</span>
        <button class="bg-nekopink hover:bg-nekopeach text-white px-4 py-2 rounded-md transition" 
                onclick="addToCart(${vol.idVolume}, 'volume')">
          <i class="fas fa-cart-plus mr-1"></i> Aggiungi al carrello
        </button>
      </div>
      <div class="mt-2 flex items-center text-xs">
        <span class="bg-nekopink text-white px-2 py-1 rounded-md mr-2">${vol.tag}</span>
      </div>
    </div>
  `;
        return div;
    }
}

function addToCart(id, tipo ,quantita = 1) {
    const dati = {
        qCarrello: quantita
    };

    if (tipo === "volume") {
        dati.idVolume = id;
    } else {
        dati.idProdotto = id;
    }

    const params = new URLSearchParams();
    params.append("action", "add");
    params.append("json", JSON.stringify(dati));

    fetch("cartgesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nella risposta dal server");
            }
            return response.json();
        })
        .then(data => {
            if (data.error) {
                mostraErrore(data.error);
            } else if (data.success === "success") {
                window.location.href = "cart.jsp";
            } else {
                mostraErrore("alcuni prodotti sono già nel carrello");
            }
        })
        .catch(err => {
            console.error("Errore:", err);
            mostraErrore("Si è verificato un errore. Riprova più tardi.");
        });
}

document.addEventListener('DOMContentLoaded', function() {
    generateDecorations();
    caricaProdotti();
    //navBar set page
    document.getElementById("catalog").classList.add("active");

    // Filter button active state
    document.querySelectorAll('.folder-tab').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelectorAll('.folder-tab').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Alphabet navigation active state
    document.querySelectorAll('.alphabet-link').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelectorAll('.alphabet-link').forEach(l => l.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Search form submission
    /*document.querySelector('.search-bar').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            document.getElementById('pageInput').value = 0;
            document.getElementById('searchForm').submit();
        }
    });*/

    fetchTotProd().then(total => {
        const prodottiPerPagina = 6;
        aggiornaPaginazione(total, 1, prodottiPerPagina, caricaProdotti);
    });
});