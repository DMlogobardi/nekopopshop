let elemOrder = true;
let currentPageOrder = 1;

async function caricaOrdini(page = 1){
    const params = new URLSearchParams();
    params.append("action", "order");
    params.append("actionOrder", "getAll");
    params.append("limit", "3");
    params.append("page", page.toString());
    try {
        const response = await fetch("admin/admindatagesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        const data = await response.json();

        if(data.error !== undefined){
            mostraErrore("errore nel caricamento");
            return;
        }

        const ordini = data.filter(item => item.idOrdine !== undefined);
        const container = document.getElementById("orders-grid");
        const lodaing = document.getElementById("loading");
        const next = document.getElementById("sucOrder");

        if(ordini.length > 0){
            elemOrder = true;
            next.classList.remove("disabled:opacity-50");
            next.disabled = false;
            lodaing.classList.replace("active", "hidden");
            container.classList.replace("hidden", "active");
            container.innerHTML = '';
            Promise.all(ordini.map(creaSezione)).then(sezioni => {
                sezioni.forEach(html => {
                    const row = document.createElement("div");
                    row.innerHTML = html;
                    container.appendChild(row);
                });
            });
        } else {
            elemOrder = false;
            currentPageOrder -= 1;
            next.classList.add("disabled:opacity-50");
            next.disabled = true;
            mostraErrore("ordini finiti");
        }

        async function creaSezione(item){
            return `<div class="order-card bg-white p-4">
                        <div class="flex flex-col">
                            <div class="flex justify-between items-start mb-3">
                                <div>
                                    <h3 class="font-medium text-lg text-gray-800">Ordine #NEKO-${item.idOrdine}</h3>
                                </div>
                                <div class="flex items-center">
                                    <span class="text-sm font-bold text-gray-700">${item.tot} €</span>
                                </div>
                            </div>

                            <div class="flex justify-between items-center mb-3">
                                <div>
                                    <p class="text-sm text-gray-600"><i class="far fa-calendar-alt mr-2"></i> Data: ${item.dataOrdine}</p>
                                </div>
                                <div class="flex gap-2">
                                    <button onclick="orderDettagli(\`${item.idOrdine}\`)" class="action-btn view-btn">
                                        <i class="fas fa-eye mr-1"></i> Dettagli
                                    </button>
                                    <button onclick="annullaOrdine(\`${item.idOrdine}\`)" class="action-btn cancel-btn">
                                        <i class="fas fa-times mr-1"></i> elimina
                                    </button>
                                </div>
                            </div>

                            <!-- Order details (hidden by default) -->
                            <div id="dettagli${item.idOrdine}" class="hidden">
                                <div class="border-t border-gray-200 pt-3 mt-3">
                                    <h4 class="font-bold text-gray-700 mb-2">Prodotti:</h4>
                                    <div id="productOrder${item.idOrdine}" class="grid grid-cols-1 md:grid-cols-3 gap-3 mb-4">
                                        
                                    </div>

                                    <div id="speditionDett${item.idOrdine}" class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>`;
        }
    } catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function loadAcquistati(dettagli, products, idOrdine){
    const params = new URLSearchParams();
    params.append("action", "order");
    params.append("actionOrder", "getContenuti");
    params.append("id", idOrdine.toString())

    try{
        const response = await fetch("admin/admindatagesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        const data = await response.json();

        if(data.error !== undefined){
            mostraErrore("errore nel caricamento");
            return;
        }

        const prodotti = data.filter(item => item.nome !== undefined);
        const volumi = data.filter(item => item.idVolume !== undefined);
        products.innerHTML = "";

        prodotti
            .filter(prod => Number(prod.prezzo) > 0)
            .forEach(prod => {
                let row = document.createElement("div");
                row.innerHTML = creaProdotto(prod);
                products.appendChild(row);
            });

        volumi.forEach(vol => {
            const prod = prodotti.find(item => item.idProdotto === vol.idProdotto);
            if (prod) {
                let volCard = document.createElement("div");
                volCard.innerHTML = creaVolume(vol, prod);
                products.appendChild(volCard);
            }
        });

        function creaProdotto(item) {
            const imgSrc = item.imgProd
                ? (item.imgProd.startsWith("data:")
                    ? item.imgProd
                    : `data:image/jpeg;base64,${item.imgProd}`)
                : "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";

            return`
                <div class="flex items-center p-2 bg-gray-50 rounded-lg">
                    <img src="${imgSrc}" alt="${item.nome}" class="product-image mr-3">
                    <div>
                        <p class="font-medium text-gray-800">${item.nome}</p>
                        <p class="text-sm text-gray-600">Quantità: ${item.quantita}</p>
                        <p class="text-sm font-bold text-nekoblue">${item.prezzo}</p>
                    </div>
                </div>
            `;
        }

        function creaVolume(item, tag) {

            const imgSrc = item.imgVol
                ? (item.imgVol.startsWith("data:")
                    ? item.imgVol
                    : `data:image/jpeg;base64,${item.imgVol}`)
                : "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";

            return`
                <div class="flex items-center p-2 bg-gray-50 rounded-lg">
                    <img src="${imgSrc}" alt="${tag.nome} ${item.numVolumi}" class="product-image mr-3">
                    <div>
                        <p class="font-medium text-gray-800">${tag.nome} ${item.numVolumi}</p>
                        <p class="text-sm text-gray-600">Quantità: ${item.quantita}</p>
                        <p class="text-sm font-bold text-nekoblue">${item.prezzo}</p>
                    </div>
                </div>
            `;
        }
    } catch (error) {
        dettagli.classList.add("hidden");
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function loadDipendencise(dettagli, dip,idOrdine){
    const params = new URLSearchParams();
    params.append("action", "order");
    params.append("actionOrder", "getDip");
    params.append("id", idOrdine.toString())

    try {
        const response = await fetch("admin/admindatagesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        const data = await response.json();

        if (data.error !== undefined) {
            mostraErrore("errore nel caricamento");
            return;
        }

        dip.innerHTML = "";

        let ind = document.createElement("div");
        let card = document.createElement("div");

        ind.innerHTML = createInd(data);
        card.innerHTML = createCard(data);

        dip.appendChild(ind);
        dip.appendChild(card);

        function createInd(item) {
            return`
                <div>
                    <h4 class="font-bold text-gray-700 mb-2">Indirizzo di spedizione:</h4>
                    <div class="bg-gray-50 p-3 rounded-lg">
                        <p class="text-sm">${item.via} ${item.nCivico}</p>
                        <p class="text-sm">${item.cap}</p>
                    </div>
                </div>
            `;
        }

        function createCard(item) {
            const tipo = item.tipo.toLowerCase();
            const iconClass =
                tipo === 'visa' ? 'fab fa-cc-visa text-blue-700' :
                    tipo === 'mastercard' ? 'fab fa-cc-mastercard text-red-600' :
                        tipo === 'amex' || tipo === 'american express' ? 'fab fa-cc-amex text-indigo-600' :
                            tipo === 'paypal' ? 'fab fa-cc-paypal text-blue-500' :
                                'fas fa-credit-card text-gray-500';

            return `
                    <div>
                        <h4 class="font-bold text-gray-700 mb-2">Metodo di pagamento:</h4>
                        <div class="bg-gray-50 p-3 rounded-lg">
                            <div class="flex items-center mb-2">
                                <i class="${iconClass} text-2xl mr-2"></i>
                                <span class="font-medium capitalize">${item.tipo}</span>
                            </div>
                            <p class="text-sm">ID transazione: ${item.tipo}-${item.idMetodoPagamento}</p>
                            <p class="text-sm">Stato: Completato</p>
                        </div>
                    </div>
                `;
        }

    } catch (error) {
        dettagli.classList.add("hidden");
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function orderDettagli(idOrdine){
    const dettagli = document.getElementById(`dettagli${idOrdine}`);
    const products = document.getElementById(`productOrder${idOrdine}`);
    const dip = document.getElementById(`speditionDett${idOrdine}`);

    if(!dettagli.classList.contains("hidden")){
        products.innerHTML="";
        dip.innerHTML="";
        dettagli.classList.add("hidden");
        return null;
    }

    await loadAcquistati(dettagli, products, idOrdine);
    await loadDipendencise(dettagli, dip, idOrdine)
    dettagli.classList.remove("hidden");
}

async function annullaOrdine(idOrdine){
    const params = new URLSearchParams();
    params.append("action", "order");
    params.append("actionOrder", "delete");
    params.append("id", idOrdine.toString())

    try {
        const response = await fetch("admin/admindatagesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        });

        const data = await response.json();

        if (data.error !== undefined) {
            mostraErrore("errore nel caricamento");
            return;
        }

        if(data.success !== undefined){
            caricaOrdini(currentPageOrder);
        }
    } catch (error) {
        dettagli.classList.add("hidden");
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

window.initOrder = function() {
    console.log("initOrder chiamata");
    caricaOrdini(currentPageOrder);

    document.getElementById("precOrder").addEventListener("click",  btn => {
        if(currentPageOrder > 1){
            currentPageOrder -= 1;
            caricaOrdini(currentPageOrder);
        } else {
            btn.classList.add("disabled:opacity-50");
            btn.disabled = true;
            mostraErrore("sei arrivato all'inizio della lista");
        }
        console.log(currentPageOrder);
    })

    document.getElementById("sucOrder").addEventListener("click", function (){
        const btn = document.getElementById("precOrder");
        if(elemOrder){
            currentPageOrder += 1;
            caricaOrdini(currentPageOrder);
            btn.classList.remove("disabled:opacity-50");
            btn.disabled = false;
        }
        console.log(currentPageOrder);
    })
}