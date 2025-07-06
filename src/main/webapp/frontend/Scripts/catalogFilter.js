function caricaVolumiSerch(pag = 0, serch = null) {
    fetch(`getcatalog?page=${pag}&limit=3&productType=vol&serch=${serch}`)
        .then(res => res.json())
        .then(data => {
            const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti
            const volumi = data.filter(item => item.idVolume !== undefined);    // volumi

            const container = document.getElementById("catalogo1");
            container.innerHTML = "";  // reset contenuto

            volumi.forEach(vol => {
                const prod = prodotti.filter(item => item.idProdotto === vol.idProdotto);
                if(prod !== undefined){
                    const  volCard = creaCardVolume(vol, prod[0]);
                    container.appendChild(volCard);
                }
            })

        })

// Funzione per creare DOM card volume
    function creaCardVolume(vol, prod) {
        const div = document.createElement("div");
        div.className = "product-card cursor-pointer";

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

        div.addEventListener("click", (e) => {
            if (e.target.closest("button[data-no-propagation]")) return;

            window.location.href = `specificheprodotto.jsp?id=${vol.idVolume}&type=vol`;
        });

        return div;
    }
}

function caricaProdottiSerch(pag = 0, serch = null) {
    fetch(`getcatalog?page=${pag}&limit=3&productType=prod&serch=${serch}`)
        .then(res => res.json())
        .then(data => {
            const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti

            const container = document.getElementById("catalogo2");
            container.innerHTML = "";  // reset contenuto


            prodotti.forEach(prod => {
                const prodCard = creaCardProdotto(prod);
                container.appendChild(prodCard);
            });

        })

// Funzione per creare DOM card prodotto (action figure)
    function creaCardProdotto(prod) {
        const div = document.createElement("div");
        div.className = "product-card cursor-pointer";

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

        div.addEventListener("click", (e) => {
            if (e.target.closest("button[data-no-propagation]")) return;

            window.location.href = `specificheprodotto.jsp?id=${prod.idProdotto}&type=prod`;
        });

        return div;
    }
}

function fetchTotProdFilter(tot){
    return fetch(`getcatalog?tot=${tot}&productType=prod`).then(res => res.json())
        .then(data =>{
            if (data.totale !== undefined) {
                return parseInt(data.totale);
            } else {
                throw new Error("Totale non disponibile");
            }
        })
}

function fetchTotVolFilter(tot){
    return fetch(`getcatalog?tot=${tot}&productType=Vol`).then(res => res.json())
        .then(data =>{
            if (data.totale !== undefined) {
                return parseInt(data.totale);
            } else {
                throw new Error("Totale non disponibile");
            }
        })
}

function aggiornaPaginazioneProd(totalCount, currentPage, perPage, onPageChange, serch) {
    const totalPages = Math.ceil(totalCount / perPage);
    const pagination = document.getElementById('pagination2');
    const prevBtn = document.getElementById('prev-btn2');
    const nextBtn = document.getElementById('next-btn2');

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
                if (page !== currentPage) onPageChange(page, serch);
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
        if (currentPage > 1) onPageChange(currentPage - 1, serch);
    };

    nextBtn.onclick = () => {
        if (currentPage < totalPages) onPageChange(currentPage + 1, serch);
    };
}

function aggiornaPaginazioneVol(totalCount, currentPage, perPage, onPageChange, serch) {
    const totalPages = Math.ceil(totalCount / perPage);
    const pagination = document.getElementById('pagination1');
    const prevBtn = document.getElementById('prev-btn1');
    const nextBtn = document.getElementById('next-btn1');

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
                if (page !== currentPage) onPageChange(page, serch);
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
        if (currentPage > 1) onPageChange(currentPage - 1, serch);
    };

    nextBtn.onclick = () => {
        if (currentPage < totalPages) onPageChange(currentPage + 1, serch);
    };
}

function serch(serch = ""){
    if(serch.trim() === ""){
        mostraErrore("ricerca non valida");
        return;
    }
    caricaProdottiSerch(1, serch.trim());
    caricaVolumiSerch(1, serch.trim());

    fetchTotProdFilter("serch").then(total => {
        const prodottiPerPagina = 3;
        aggiornaPaginazioneProd(total, 1, prodottiPerPagina, caricaProdottiSerch, serch.trim());
    });

    fetchTotVolFilter("serch").then(total => {
        const prodottiPerPagina = 3;
        aggiornaPaginazioneVol(total, 1, prodottiPerPagina, caricaVolumiSerch, serch.trim());
    });
}

function handleSearch(event) {
    event.preventDefault();
    const query = document.getElementById('search').value.trim();
    if (query !== "") {
        serch(query);
    }
}

//sezione filter order

function caricaVolumiFilter(pag = 0, filter = null) {
    fetch(`getcatalog?page=${pag}&limit=3&productType=vol&filter=${filter}`)
        .then(res => res.json())
        .then(data => {
            const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti
            const volumi = data.filter(item => item.idVolume !== undefined);    // volumi

            const container = document.getElementById("catalogo1");
            container.innerHTML = "";  // reset contenuto

            volumi.forEach(vol => {
                const prod = prodotti.filter(item => item.idProdotto === vol.idProdotto);
                if(prod !== undefined){
                    const  volCard = creaCardVolume(vol, prod[0]);
                    container.appendChild(volCard);
                }
            })

        })

// Funzione per creare DOM card volume
    function creaCardVolume(vol, prod) {
        const div = document.createElement("div");
        div.className = "product-card cursor-pointer";

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

        div.addEventListener("click", (e) => {
            if (e.target.closest("button[data-no-propagation]")) return;

            window.location.href = `specificheprodotto.jsp?id=${vol.idVolume}&type=vol`;
        });

        return div;
    }
}

function caricaProdottiFilter(pag = 0, filter = null) {
    fetch(`getcatalog?page=${pag}&limit=3&productType=prod&filter=${filter}`)
        .then(res => res.json())
        .then(data => {
            const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti

            const container = document.getElementById("catalogo2");
            container.innerHTML = "";  // reset contenuto


            prodotti.forEach(prod => {
                const prodCard = creaCardProdotto(prod);
                container.appendChild(prodCard);
            });

        })

// Funzione per creare DOM card prodotto (action figure)
    function creaCardProdotto(prod) {
        const div = document.createElement("div");
        div.className = "product-card cursor-pointer";

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

        div.addEventListener("click", (e) => {
            if (e.target.closest("button[data-no-propagation]")) return;

            window.location.href = `specificheprodotto.jsp?id=${prod.idProdotto}&type=prod`;
        });

        return div;
    }
}

function aggiornaPaginazioneProdFilter(totalCount, currentPage, perPage, onPageChange, filter) {
    const totalPages = Math.ceil(totalCount / perPage);
    const pagination = document.getElementById('pagination2');
    const prevBtn = document.getElementById('prev-btn2');
    const nextBtn = document.getElementById('next-btn2');

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
                if (page !== currentPage) onPageChange(page, filter);
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
        if (currentPage > 1) onPageChange(currentPage - 1, filter);
    };

    nextBtn.onclick = () => {
        if (currentPage < totalPages) onPageChange(currentPage + 1, filter);
    };
}

function aggiornaPaginazioneVolFilter(totalCount, currentPage, perPage, onPageChange, filter) {
    const totalPages = Math.ceil(totalCount / perPage);
    const pagination = document.getElementById('pagination1');
    const prevBtn = document.getElementById('prev-btn1');
    const nextBtn = document.getElementById('next-btn1');

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
                if (page !== currentPage) onPageChange(page, filter);
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
        if (currentPage > 1) onPageChange(currentPage - 1, filter);
    };

    nextBtn.onclick = () => {
        if (currentPage < totalPages) onPageChange(currentPage + 1, filter);
    };
}

function filter(filter = ""){
    if(filter.trim() === ""){
        mostraErrore("filtro non valido");
        return;
    }

    if(filter !== "data") {
        caricaVolumiFilter(1, filter.trim());
        caricaProdottiFilter(1, filter.trim());

        fetchTotProdFilter("tot").then(total => {
            const prodottiPerPagina = 3;
            aggiornaPaginazioneProdFilter(total, 1, prodottiPerPagina, caricaProdottiFilter, filter.trim());
        });

        fetchTotVolFilter("tot").then(total => {
            const prodottiPerPagina = 3;
            aggiornaPaginazioneVolFilter(total, 1, prodottiPerPagina, caricaVolumiFilter, filter.trim());
        });

    } else {
        caricaVolumiFilter(1, filter.trim());

        fetchTotVolFilter("tot").then(total => {
            const prodottiPerPagina = 3;
            aggiornaPaginazioneVolFilter(total, 1, prodottiPerPagina, caricaVolumiFilter, filter.trim());
        });
    }
}