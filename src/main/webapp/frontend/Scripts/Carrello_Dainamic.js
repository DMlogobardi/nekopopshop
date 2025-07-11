function mostraErrore(msg) {
    const erroreBox = document.getElementById("messaggioErrore");
    erroreBox.textContent = msg;
    erroreBox.classList.remove("hidden");

    erroreBox.scrollIntoView({ behavior: "smooth", block: "center" });

    setTimeout(() => {
        erroreBox.classList.add("hidden");
    }, 5000);
}

function mostraMessaggioCortesia(msg) {
    const box = document.getElementById("messaggioCortesia");
    box.textContent = msg;
    box.classList.remove("hidden");

    box.scrollIntoView({ behavior: "smooth", block: "center" });

    setTimeout(() => {
        box.classList.add("hidden");
    }, 5000);
}

function setSconti() {
    var codice = document.getElementById("codiceSconto").value.trim();

    if (codice !== "") {

        const params = new URLSearchParams();
        params.append("action", "setSconti");
        params.append("code", codice.toString());

        fetch("cartgesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        })
            .then(response => response.json())
            .then(data =>{
            if(data.success !== null && data.success !== undefined){
                const sconto = parseInt(data.success);

                if (!isNaN(sconto)) {
                    document.getElementById('coupon-success').textContent = `Hai ottenuto uno sconto del ${sconto}% sul tuo ordine`;
                    document.getElementById('coupon-success').classList.remove('hidden');
                    document.getElementById('discount-row').classList.remove('hidden');
                    aggiornaRiepilogoCarrello();
                } else {
                    mostraErrore("Il valore di sconto non è valido.");
                }
            } else {
                mostraErrore(data.error || "Codice sconto non valido.");
            }
        }).catch(err => {
            console.error("Errore:", err);
            mostraErrore("Si è verificato un errore. Riprova più tardi.");
        });

    } else {
        mostraErrore("codice non valido");
    }
}

async function aggiornaRiepilogoCarrello() {
    const params = new URLSearchParams();
    params.append("action", "cartTotals");

    fetch("cartgesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel recupero del riepilogo carrello");
            }
            return response.json();
        })
        .then(data => {
            console.log(data)
            let shipping = 0;
            const subtotal = parseFloat(data.tot || 0);
            if(subtotal !== 0)
                shipping = parseFloat(data.speseSped || 0);
            else
                shipping = parseFloat(0);
            const scontoPercentuale = parseInt(data.sconti)
            const discount = scontoPercentuale > 0 ? subtotal * (scontoPercentuale / 100) : 0;
            const total = subtotal + shipping - discount.toFixed(2);

            // Aggiorna la UI
            document.getElementById("subtotal").textContent = `€ ${subtotal.toFixed(2).replace('.', ',')}`;
            document.getElementById("shipping").textContent = `€ ${shipping.toFixed(2).replace('.', ',')}`;
            document.getElementById("discount").textContent = `-€ ${discount.toFixed(2).replace('.', ',')}`;
            document.getElementById("total").textContent = `€ ${total.toFixed(2).replace('.', ',')}`;

            if (discount > 0) {
                document.getElementById("discount-row").classList.remove("hidden");
            } else {
                document.getElementById("discount-row").classList.add("hidden");
            }
        })
        .catch(error => {
            console.error("Errore nel caricamento dei costi:", error);
            mostraErrore("Errore nel calcolo del totale. Riprova.");
        });
}

async function caricaProdotti(page) {
    const params = new URLSearchParams();
    params.append("action", "list");
    params.append("offset", (parseInt(page) - 1) || 0);

    try {
        const response = await fetch("cartgesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        if (!response.ok) {
            throw new Error("Errore nella risposta dal server");
        }

        const data = await response.json();
        console.log(data);

        const container = document.getElementById("cart-items-container");
        container.innerHTML = "";

        if (!Array.isArray(data) || data.length === 0) {
            document.getElementById("empty-cart").classList.remove('hidden');
            return;
        }
        document.getElementById("empty-cart").classList.add('hidden');

        // Filtra prodotti e volumi
        const prodotti = data.filter(item => item.idProdotto !== undefined);
        const volumi = data.filter(item => item.idVolume !== undefined);

        const prodottiFinali = [];
        const prodottiMostrati = new Set();

        volumi.forEach(volume => {
            const prodottoAssoc = prodotti.find(p => p.idProdotto === volume.idProdotto);
            prodottiFinali.push({
                tipo: 'volume',
                idProdotto: volume.idProdotto,
                idVolume: volume.idVolume,
                nome: volume.nome || (prodottoAssoc ? prodottoAssoc.nome : "Volume"),
                descrizione: prodottoAssoc.descrizione || "Descrizione volume non disponibile",
                prezzo: volume.prezzo,
                img: volume.imgVol || (prodottoAssoc ? prodottoAssoc.imgProd : ""),
                numVolumi: volume.numVolumi,
                quantita: volume.quantita || 1,
                badgeColor: "bg-nekopurple",
                borderColor: "border-kawaiblue",
                badgeText: "NEW!"
            });
            prodottiMostrati.add(volume.idProdotto);
        });

        prodotti.forEach(prodotto => {
            if (prodotto.prezzo > 0 && !prodottiMostrati.has(prodotto.idProdotto)) {
                prodottiFinali.push({
                    tipo: 'prodotto',
                    ...prodotto,
                    quantita: prodotto.quantita || 1,
                    badgeColor: "bg-nekored",
                    borderColor: "border-kawaililac",
                    badgeText: "POP!"
                });
                prodottiMostrati.add(prodotto.idProdotto);
            }
        });

        // Funzione per creare card prodotto/volume nel carrello
        function creaCardCarrello(item) {
            const titolo = item.tipo === 'volume'
                ? `${item.nome} Vol. ${item.numVolumi || ''}`
                : item.nome || 'Prodotto';

            const imgSrc = item.tipo === 'volume'
                ? (item.img ? (item.img.startsWith("data:") ? item.img : `data:image/jpeg;base64,${item.img}`) : "https://via.placeholder.com/400x300")
                : (item.imgProd ? (item.imgProd.startsWith("data:") ? item.imgProd : `data:image/jpeg;base64,${item.imgProd}`) : "https://via.placeholder.com/400x300");

            const descrizione = item.descrizione || '';
            const prezzo = item.prezzo || 0;
            const prezzoFormattato = prezzo.toFixed(2).replace('.', ',');

            const quantita = item.quantita || 1;

            return `
                <div class="product-card bg-white rounded-lg overflow-hidden border-2 ${item.borderColor} mb-4 relative">
                    <div class="p-4 flex flex-col md:flex-row">
                        <div class="w-full md:w-1/4 h-40 rounded-xl overflow-hidden flex-shrink-0">
                            <img src="${imgSrc}" alt="${titolo}" class="w-full h-full object-cover">
                        </div>
                        <div class="md:ml-4 mt-4 md:mt-0 flex-1">
                            <div class="flex justify-between">
                                <h3 class="font-bold text-gray-800 text-lg" style="font-size: 20px">${titolo}</h3>
                                <button class="remove-btn text-xl remove" data-id="${item.tipo === 'volume' ? item.idVolume : item.idProdotto}" data-tipo="${item.tipo}">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                            <p class="text-gray-600 text-sm mt-1">${descrizione}</p>
                            <div class="mt-4 flex flex-col md:flex-row md:items-center justify-between">
                                <div class="flex items-center mb-3 md:mb-0">
                                    <span class="text-2xl font-bold text-nekored">&#8364; ${prezzoFormattato}</span>
                                </div>
                                <div class="quantity-selector">
                                    <button data-tipo="decrement" class="quantity-btn decrement">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <p class="quantity-input"> ${quantita} </p>
                                    <button data-tipo="increment" class="quantity-btn increment">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="mt-2">
                                <button onclick="updateCart()" 
                                    class="bg-nekopeach hover:bg-nekopink text-white px-6 rounded-lg font-bold transition hidden applyBtn" 
                                    data-id="${item.tipo === 'volume' ? item.idVolume : item.idProdotto}" 
                                    data-tipo="${item.tipo}" 
                                    data-quantita="">
                                        applica
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }

        container.innerHTML = prodottiFinali.map(creaCardCarrello).join('');

        // Aggiorna funzionalità bottoni quantità e apply
        const cards = container.querySelectorAll('.product-card');

        cards.forEach(card => {
            const decrementBtn = card.querySelector('.quantity-btn.decrement');
            const incrementBtn = card.querySelector('.quantity-btn.increment');
            const quantityDisplay = card.querySelector('.quantity-input');
            const applyBtn = card.querySelector('.applyBtn');
            const removeBtn = card.querySelector('.remove');

            let originalQuantity = parseInt(quantityDisplay.textContent) || 1;
            let quantity = originalQuantity;

            function updateUI() {
                quantityDisplay.textContent = quantity;
                applyBtn.dataset.quantita = quantity;

                if (quantity !== originalQuantity) {
                    applyBtn.classList.remove('hidden');
                } else {
                    applyBtn.classList.add('hidden');
                }
            }

            decrementBtn.addEventListener('click', () => {
                if (quantity > 1) {
                    quantity--;
                    updateUI();
                }
            });

            incrementBtn.addEventListener('click', () => {
                quantity++;
                updateUI();
            });

            applyBtn.addEventListener('click', () => {
                const id = applyBtn.dataset.id;
                const tipo = applyBtn.dataset.tipo;

                updateCart(id, tipo, quantity);

                originalQuantity = quantity;
                applyBtn.classList.add('hidden');
            });

            removeBtn.addEventListener('click', (event) => {
                const btn = event.currentTarget; // il bottone cliccato
                const id = btn.dataset.id;
                const tipo = btn.dataset.tipo;

                console.log(id)
                console.log(tipo)

                remove(id, tipo);
            });
        });

        aggiornaRiepilogoCarrello();

    } catch (error) {
        console.error("Errore:", error);
        document.getElementById("empty-cart").classList.remove('hidden');
        mostraErrore("Si è verificato un errore durante il caricamento del carrello. Ci scusiamo per il disagio.");
    }
}

async function remove(id, tipo){
    const dati = {};

    if (tipo === "volume") {
        dati.idVolume = id;
    } else {
        dati.idProdotto = id;
    }

    const params = new URLSearchParams();
    params.append("action", "delete");
    params.append("json", JSON.stringify(dati));

    try {
        const response = await fetch("cartgesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        if (!response.ok) {
            throw new Error("Errore nella risposta dal server");
        }

        const data = await response.json();

        if (data.error) {
            mostraErrore(data.error);
        } else if (data.success === "success") {
            mostraMessaggioCortesia("Prodotto rimosso con successo");

            await caricaProdotti(1); // aspetta che si aggiorni la UI
            await aggiornaRiepilogoCarrello(); // poi aggiorna i totali

            const total = await fetchTotaleProdotti();
            const prodottiPerPagina = 3;
            const totalePagine = Math.ceil(total / prodottiPerPagina);
            aggiornaPaginazione(totalePagine, 1, prodottiPerPagina);
            setItemCount(total);
        } else {
            mostraErrore("Alcuni prodotti sono già nel carrello");
        }
    } catch (err) {
        console.error("Errore:", err);
        mostraErrore("Si è verificato un errore. Riprova più tardi.");
    }
}

async function updateCart(id, tipo, quantita) {
    const dati = { qCarrello: quantita };

    if (tipo === "volume") {
        dati.idVolume = id;
    } else {
        dati.idProdotto = id;
    }

    const params = new URLSearchParams();
    params.append("action", "update");
    params.append("json", JSON.stringify(dati));

    try {
        const response = await fetch("cartgesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        if (!response.ok) {
            throw new Error("Errore nella risposta dal server");
        }

        const data = await response.json();

        if (data.error) {
            mostraErrore(data.error);
        } else if (data.success === "success") {
            mostraMessaggioCortesia("Quantità aggiornata con successo!");

            await caricaProdotti(1); // aspetta che si aggiorni la UI
            await aggiornaRiepilogoCarrello(); // poi aggiorna i totali

            const total = await fetchTotaleProdotti();
            const prodottiPerPagina = 3;
            const totalePagine = Math.ceil(total / prodottiPerPagina);
            aggiornaPaginazione(totalePagine, 1, prodottiPerPagina);
            setItemCount(total);
        } else {
            mostraErrore("Alcuni prodotti sono già nel carrello");
        }
    } catch (err) {
        console.error("Errore:", err);
        mostraErrore("Si è verificato un errore. Riprova più tardi.");
    }
}


document.addEventListener("DOMContentLoaded", function () {
    generateDecorations();
    setupCart();
    caricaProdotti(1);
    aggiornaRiepilogoCarrello();
    fetchTotaleProdotti().then(total => {
        const prodottiPerPagina = 3;
        aggiornaPaginazione(total, 1, prodottiPerPagina, caricaProdotti);
        setItemCount(total);
    });
    const params = new URLSearchParams(window.location.search);
    const codiceCoupon = params.get("codice");

    if (codiceCoupon) {
        console.log("Codice ricevuto:", codiceCoupon);
        // Ad esempio: inseriscilo in un campo o usalo in JS
        document.getElementById("codiceSconto").value = codiceCoupon;
    }
});

function setItemCount(tot){
    const articoli = document.getElementById("item-count");

    if (articoli) {
        articoli.textContent = `${tot} articolo${tot === 1 ? '' : 'i'}`;
    }
}

function fetchTotaleProdotti() {

    const params = new URLSearchParams();
    params.append("action", "element");

    return fetch("cartgesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(res => res.json())
        .then(data => {
            if (data.success !== undefined) {
                return parseInt(data.success);
            } else {
                throw new Error("Totale non disponibile");
            }
        });
}

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

document.getElementById("pagination").addEventListener("click", e => {
    if (e.target.matches("a[data-page]")) {
        e.preventDefault();
        currentPage = parseInt(e.target.dataset.page);
        caricaProdotti(currentPage);
    }
});

document.getElementById("pagination").addEventListener("click", e => {
    if (e.target.matches("a[data-page]")) {
        e.preventDefault();
        currentPage = parseInt(e.target.dataset.page);
        caricaProdotti(currentPage);
    }
});

function generateDecorations() {
    const decorationsContainer = document.getElementById('decorations');
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    // Cat decorations
    const catEmojis = ['😺', '😸', '😹', '😻', '🙀', '🐱', '🐾'];

    // Generate cat emoji decorations
    for (let i = 0; i < 10; i++) {
        const cat = document.createElement('div');
        cat.className = 'cat-elements absolute z-0';
        cat.style.left = `${Math.random() * viewportWidth}px`;
        cat.style.top = `${Math.random() * viewportHeight}px`;
        cat.innerHTML = `<i>${catEmojis[Math.floor(Math.random() * catEmojis.length)]}</i>`;
        cat.style.fontSize = `${12 + Math.random() * 24}px`;
        cat.style.opacity = `0.${Math.floor(1 + Math.random() * 9)}`;
        cat.style.animationDuration = `${4 + Math.random() * 12}s`;
        cat.style.animationDelay = `${Math.random() * 5}s`;
        decorationsContainer.appendChild(cat);
    }

    // Generate cherry blossom decorations
    for (let i = 0; i < 15; i++) {
        const blossom = document.createElement('div');
        blossom.className = 'cherry-blossom';
        blossom.style.left = `${Math.random() * viewportWidth}px`;
        blossom.style.animationDelay = `${Math.random() * 15}s`;
        blossom.style.opacity = `0.${Math.floor(2 + Math.random() * 7)}`;
        blossom.style.transform = `scale(${0.5 + Math.random()})`;
        decorationsContainer.appendChild(blossom);
    }
}

// Cart functionality
function setupCart() {

    // Payment method selection
    document.querySelectorAll('.payment-method').forEach(method => {
        method.addEventListener('click', function() {
            document.querySelectorAll('.payment-method').forEach(m => m.classList.remove('selected'));
            this.classList.add('selected');
        });
    });

    // Checkout button
    document.querySelector('.checkout-btn').addEventListener('click', function() {
        let cookie = getCookie('access');
        fetchTotaleProdotti().then(res=>{
            if(res<=0){
                mostraErrore("Aggiungi qualcosa al carrello prima di procedere");
                setTimeout(()=>{window.location.href = 'catalog.jsp';},5000);
                return;
            }
        });
        if (cookie==="" || cookie === null) {
            mostraErrore("Effettua il login prima di procedere");
            setTimeout(()=>{window.location.href = 'login.jsp';},5000);

        }
        else{
            window.location.href ='checkout.jsp';
        }

    });
}
