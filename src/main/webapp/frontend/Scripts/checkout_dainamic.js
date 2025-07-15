async function loadAddress() {
    let addressContainer = document.getElementById("shipping-address-list");
    const params = new URLSearchParams();
    params.append("action", "indirizzi");
    params.append("actionIndirizzo","list");

    await fetch("common/utentdategesture", {
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

                document.getElementById("shipping-address-list").innerHTML = "";

                response.forEach(element => {
                    if (element.idIndirizzo > 0) {
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
                        </div> `
                        document.getElementById("shipping-address-list").innerHTML = oldAddress + address;
                    }
                })
                if(document.getElementById("shipping-address-list").firstElementChild !== null){
                    document.getElementById("shipping-address-list").firstElementChild.firstElementChild.children[1].classList.remove('invisible');

                }


        })
        .catch(error => {
            mostraErrore(error);
        })

}

function addIndirizzo() {
    let via = document.getElementById("via").value.trim();
    let civico = document.getElementById("civico").value.trim();
    let cap = document.getElementById("cap").value.trim();
    let errore ="";
    let json= {
      via : via,
      nCivico : civico,
      cap : cap
    };
    const viaRegex = /^[A-Za-zÀ-ÖØ-öø-ÿ0-9\s.'-]{2,}$/;  // accetta lettere accentate, numeri, spazi, punti e apostrofi
    const civicoRegex = /^[0-9]{1,4}[A-Za-z]?$/;         // es. "10", "12B", "5"
    const capRegex = /^\d{5}$/;                          // es. "00100", "12345"
    // Validazione "via"
    if (!viaRegex.test(via)) {
        if (errore === "") {
            document.getElementById("via").focus();
        }
        errore += "Via non valida ";
    }

    // Validazione "civico"
    if (!civicoRegex.test(civico)) {
        if (errore === "") {
            document.getElementById("civico").focus();
        }
        errore += "Civico non valido ";
    }

    // Validazione "cap"
    if (!capRegex.test(cap)) {
        if (errore === "") {
            document.getElementById("cap").focus();
        }
        errore += "CAP non valido (deve contenere 5 cifre) ";
    }

    // Mostra errore se presente
    if (errore !== "") {
        mostraErrore(errore);
    }
    else {


        const params = new URLSearchParams();
        params.append("action", "indirizzi");
        params.append("actionIndirizzo", "add");
        params.append("json", JSON.stringify(json));

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
                } else {
                    return response.json();
                }
            })
            .then(response => {
                if (response.success === "success") {
                    mostraErrore("Indirizzo aggiunto con successo!");
                    loadAddress();
                }

            })
            .catch(error => {
                mostraErrore(error);
                console.error(error);
            })

    }

}

async function loadCarte() {
    let addressContainer = document.getElementById("payment-method-list");
    const params = new URLSearchParams();
    params.append("action", "carte");
    params.append("actionCard","list");

    await fetch("common/utentdategesture", {
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

            document.getElementById("payment-method-list").innerHTML = "";
            response.forEach(element => {

                if (element.idMetodoPagamento > 0) {
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
            if(document.getElementById("payment-method-list").firstElementChild !== null) {
                document.getElementById("payment-method-list").firstElementChild.firstElementChild.children[1].classList.remove('invisible');
            }
        })
        .catch(error => {
            mostraErrore(error);
            console.error(error);

        })


}

function addCarta() {
    let nome = document.getElementById("nome").value.trim();
    let cognome = document.getElementById("cognome").value.trim();
    let nCarta = document.getElementById("nCarta").value.trim();
    let mese = document.getElementById("mese").value.trim();
    let tipo = document.getElementById("tipo").value.trim();
    let anno = document.getElementById("anno").value.trim();
    let json = {
        nomeInte: nome,
        cognomeInt: cognome,
        tipo: tipo,
        nCarta: nCarta.toString().trim().slice(-4),
        dataScadenza: `${anno}-${mese}-01`
    };

    let errore = "";

// Regex
    const nomeRegex = /^[A-Za-zÀ-ÖØ-öø-ÿ'\s-]{2,}$/;
    const cognomeRegex = /^[A-Za-zÀ-ÖØ-öø-ÿ'\s-]{2,}$/;
    const cartaRegex = /^\d{16}$/; // 16 cifre
    const meseRegex = /^(0[1-9]|1[0-2])$/; // da 01 a 12
    const annoRegex = /^\d{4}$/; // 4 cifre

    // Validazione nome
    if (!nomeRegex.test(nome)) {
        if (errore === "") {
            document.getElementById("nome").focus();
        }
        errore += "Nome non valido ";
    }

    // Validazione cognome
    if (!cognomeRegex.test(cognome)) {
        if (errore === "") {
            document.getElementById("cognome").focus();
        }
        errore += "Cognome non valido ";
    }

    // Validazione numero carta
    if (!cartaRegex.test(nCarta)) {
        if (errore === "") {
            document.getElementById("nCarta").focus();
        }
        errore += "Numero carta non valido (inserisci 16 cifre) ";
    }

    // Validazione mese
    if (!meseRegex.test(mese)) {
        if (errore === "") {
            document.getElementById("mese").focus();
        }
        errore += "Mese non valido (01-12) ";
    }

    // Validazione anno
    if (!annoRegex.test(anno) || parseInt(anno) < new Date().getFullYear()) {
        if (errore === "") {
            document.getElementById("anno").focus();
        }
        errore += "Anno non valido o già passato ";
    }

    // Mostra errori se presenti
    if (errore !== "") {
        mostraErrore(errore);
    } else {


        const params = new URLSearchParams();
        params.append("action", "carte");
        params.append("actionCard", "add");
        params.append("json", JSON.stringify(json));

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
                } else {
                    return response.json();
                }
            })
            .then(response => {
                if (response.success === "success") {
                    mostraErrore("Carta aggiunta con successo!");

                }

            })
            .catch(error => {
                mostraErrore(error);
                console.error(error);

            })
    }

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
            console.error(error);

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
    const checkIconAddress = document.querySelector('.address-option i.fas.fa-check:not(.invisible)');
    let idAddress = 0;

    if (checkIconAddress) {
        const addressDiv = checkIconAddress.closest('.address-option');
        if (addressDiv) {
            const parts = addressDiv.id.split('-');
            if (parts.length > 1) {
                idAddress = parseInt(parts[1], 10);
            }
        }
    }

    const checkIconCarta = document.querySelector('.payment-option i.fas.fa-check:not(.invisible)');
    let idCarta = 0;

    if (checkIconCarta) {
        const div = checkIconCarta.closest('.payment-option');
        if (div) {
            const parts = div.id.split('-');
            if (parts.length > 1) {
                idCarta = parseInt(parts[1], 10);
            }
        }
    }

    if (idAddress === 0 || idCarta === 0) {
        mostraErrore("Seleziona sia un indirizzo che un metodo di pagamento validi.");
        return;
    }

    const payload = {
        card: idCarta,
        indirizzo: idAddress
    };

    fetch("common/order", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(payload)
    })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => {
                    throw new Error(err.message || "Errore sconosciuto nel completamento dell'ordine.");
                }).catch(() => {
                    throw new Error(`Errore HTTP: ${response.status} ${response.statusText}`);
                });
            }
            return response.json();
        })
        .then(result => {
            if (result.success === "success") {
                mostraErrore("ordine completato, ti reindiriziamo all'carello")
                console.log("Messaggio mostrato, attendo 5 secondi prima del redirect...");

                setTimeout(function () {
                    window.location.href = "cart.jsp";
                }, 5000);
            } else {
                mostraErrore(result.message || "Errore nel completamento dell'ordine. Riprova.");
            }
        })
        .catch(error => {
            console.error("Errore durante l'operazione di completamento ordine:", error);
            mostraErrore(error.message || "Si è verificato un errore inaspettato.");
        });
}

document.addEventListener('DOMContentLoaded', function() {
    loadAddress();
    loadCarte();
    loadRiassunto()
});