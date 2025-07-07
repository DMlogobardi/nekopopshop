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
                            <div class="address-option p-4 border rounded-lg cursor-pointer hover:border-nekopeach" id="indirizzo${element.idIndirizzo}">
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
                            <div class="payment-option p-4 border rounded-lg cursor-pointer hover:border-nekopeach selected-payment" id="carta${element.idMetodoPagamento}">
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

function loadRiassunto(){}


document.addEventListener('DOMContentLoaded', function() {
    loadAddress();
    loadCarte();
});