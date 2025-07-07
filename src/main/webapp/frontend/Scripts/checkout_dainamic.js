function loadAddress() {
    let addressContainer = document.getElementById("shipping-address-list");
    const params = new URLSearchParams();
    params.append("action", "indirizzi");
    params.append("actionIndirizzo","list");

    fetch("common/utentdategesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel recupero degli indirizzi");
            }
            else {
                return response.json();
            }
        })
        .then(response => {
            console.log(response);
            document.getElementById("shipping-address-list").innerHTML="";
            response.forEach(element => {
                if(element.idIndirizzo >0){
                    let oldAddress = document.getElementById("shipping-address-list").innerHTML;
                    let address = `
                            <div class="address-option p-4 border rounded-lg cursor-pointer hover:border-nekopeach" id="indirizzo-${element.idIndirizzo}">
                                <div class="flex justify-between">
                                    <div>
                                        <p class="text-sm text-gray-600">${element.via}</p>
                                        <p class="text-sm text-gray-600">${element.nCivico}</p>
                                        <p class="text-sm text-gray-600">${element.cap}</p>
                                    </div>
                                    <i class="fas fa-check text-nekopeach mt-1 invisible"></i>
                                </div>
                            </div><br>`
                    document.getElementById("shipping-address-list").innerHTML = oldAddress + address;
                }
            })
            document.getElementById("shipping-address-list").firstElementChild.firstElementChild.children[1].classList.remove('invisible');


        })
        .catch(error => {
            mostraErrore(error);
        })

}

function addIndirizzo() {
    let via = document.getElementById("via").value;
    let civico = document.getElementById("civico").value;
    let cap = document.getElementById("cap").value;
    let json= {
      via : via,
      nCivico : civico,
      cap : cap
    };

    const params = new URLSearchParams();
    params.append("action", "indirizzi");
    params.append("actionIndirizzo","add");
    params.append("json",JSON.stringify(json));

    fetch("common/utentdategesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel recupero degli indirizzi");
            }
            else {
                return response.json();
            }
        })
        .then(response => {
            if(response.success === "success") {
                mostraErrore("Indirizzo aggiunto con successo!");
                loadAddress();
            }

        })
        .catch(error => {
            mostraErrore(error);
        })



}

function loadCarte() {
    let addressContainer = document.getElementById("payment-method-list");
    const params = new URLSearchParams();
    params.append("action", "carte");
    params.append("actionCard","list");

    fetch("common/utentdategesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel recupero degli indirizzi");
            }
            else {
                return response.json();
            }
        })
        .then(response => {
            console.log(response);

            document.getElementById("payment-method-list").innerHTML="";
            response.forEach(element => {
                if(element.idMetodoPagamento >0){
                    let oldCarte = document.getElementById("payment-method-list").innerHTML;
                    let dataScadenza = "2035-06-15";
                    let [anno, mese] = dataScadenza.split("-");
                    let nuovaData = `${mese}/${anno}`;

                    let carta = `
                            <div class="payment-option p-4 border rounded-lg cursor-pointer hover:border-nekopeach selected-payment" id="carta-${element.idMetodoPagamento}">
                                <div class="flex justify-between items-center">
                                    <div class="flex items-center">
                                        <div>
                                            <h3 class="font-bold">${element.tipo}: •••• •••• •••• ${element.nCarta}</h3>
                                            <p class="text-sm text-gray-600">Scadenza: ${nuovaData}</p>
                                        </div>
                                    </div>
                                    <i class="fas fa-check text-nekopeach invisible"></i>
                                </div>
                            </div>`;
                    document.getElementById("payment-method-list").innerHTML = oldCarte + carta;
                }
            })
            document.getElementById("payment-method-list").firstElementChild.firstElementChild.children[1].classList.remove('invisible');

        })
        .catch(error => {
            mostraErrore(error);
        })


}

function addCarta() {
    let nome = document.getElementById("nome").value;
    let cognome = document.getElementById("cognome").value;
    let nCarta = document.getElementById("nCarta").value;
    let mese = document.getElementById("mese").value;
    let tipo = document.getElementById("tipo").value;
    let anno = document.getElementById("anno").value;
    let json= {
        nomeInte : nome,
        cognomeInt : cognome,
        tipo : tipo,
        nCarta : nCarta.toString().trim().slice(-4),
        dataScadenza : `${anno}-${mese}-01`
    };

    const params = new URLSearchParams();
    params.append("action", "carte");
    params.append("actionCard","add");
    params.append("json",JSON.stringify(json));

    fetch("common/utentdategesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel recupero delle carte");
            }
            else {
                return response.json();
            }
        })
        .then(response => {
            if(response.success === "success") {
                mostraErrore("Carta aggiunta con successo!");

            }

        })
        .catch(error => {
            mostraErrore(error);
        })
}

function loadValori(){
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
            var sconto =0;
            console.log(data)
            if(data.sconti !== null) {
                document.getElementById("containerSconto").hidden = false;
                let sconto = (data.sconti /100) * (data.tot + data.speseSped);
                console.log(sconto);
                document.getElementById("sconto").innerHTML = `-€ ${sconto.toFixed(2).replace('.', ',')}`;
                document.getElementById("totale").innerHTML = `${(data.tot + data.speseSped - sconto).toFixed(2) }`;
            }
            else {

                document.getElementById("totale").innerHTML = `€${data.tot + data.speseSped}`
            }
            document.getElementById("subtotale").innerHTML = `€${data.tot.toFixed(2).replace('.', ',')}`;
            document.getElementById("spedizione").innerHTML = `€${data.speseSped.toFixed(2).replace('.', ',')}`;


        })
        .catch(error => {
            mostraErrore(error);
        });
}
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
                <div class="flex justify-between">
                            <div class="flex">
                                <div class="w-16 h-16 rounded-md overflow-hidden mr-3">
                                    <img src="${imgSrc}" alt="${titolo}" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="font-medium">${titolo}</h3>
                                    <p class="text-sm text-gray-600">Quantità: ${quantita}</p>
                                </div>
                            </div>
                            <p class="font-medium">€${prezzoFormattato}</p>
                        </div>

            `;
}


async function loadArticoli() {

        const params = new URLSearchParams();
        params.append("action", "list");
        params.append("offset", 0);

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

            const container = document.getElementById("items");
            container.innerHTML = "";

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


            prodottiFinali.forEach(item=>{
                container.innerHTML += creaCardCarrello(item);
            })

        }
        catch (error) {
            console.error(error);
            mostraErrore(error);
        }
}




function loadRiassunto(){
    loadArticoli();
    loadValori();

}

function completaOrdine() {
    // Trova l'elemento <i> visibile (senza la classe 'invisible')
    const checkIconAddress = document.querySelector('.address-option i.fas.fa-check:not(.invisible)');
    let idAddress =0;
    let idCarta = 0;
    let a,b = null;
    if (checkIconAddress) {
        // Risali fino al div con la classe 'address-option'
        const addressDiv = checkIconAddress.closest('.address-option');

        if (addressDiv) {
            [b,idAddress] = addressDiv.id.split('-');
        }
    }

    const checkIconCarta = document.querySelector('.payment-option i.fas.fa-check:not(.invisible)');

    if (checkIconCarta) {
        const div = checkIconCarta.closest('.payment-option');

        if (div) {
            [a,idCarta]= div.id.split('-');

        } else {
            console.warn('Div con classe address-option non trovato.');
        }
    } else {
        console.warn('Nessun elemento <i> visibile trovato.');
    }
    console.log(`idCarta = ${idCarta}, idAddress = ${idAddress}`);

    const params = new URLSearchParams();
    params.append("card", idCarta);
    params.append("indirizzo", idAddress);

    fetch("common/order", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nell'ordine");
            }
            else {
                return response.json();
            }
        })
        .then(result => {
            if(result.success === "success") {
                window.location.href = "cart.jsp";
            }

        })
        .catch(error => {
            mostraErrore(error);
        })

}

document.addEventListener('DOMContentLoaded', function() {
    loadAddress();
    loadCarte();
    loadRiassunto()
});