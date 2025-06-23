function mostraErrore(msg) {
    const erroreBox = document.getElementById("messaggioErrore");
    erroreBox.textContent = msg;
    erroreBox.classList.remove("hidden");

    // Puoi anche farlo scomparire dopo qualche secondo se vuoi:
    setTimeout(() => {
        erroreBox.classList.add("hidden");
    }, 5000);
}

document.addEventListener("DOMContentLoaded", function () {

    fetch("getcatalog?dayProduct=ok")
        .then(response => {
            if (response.status === 500){
                throw new Error("Errore nel caricamento del prodotto");
            }
            return response.json();
        })
        .then(data => {
            const container = document.getElementById("dayOffer");

            if (Array.isArray(data) && data.length >= 2) {
                const prodotto = data[0];
                const volume = data[1];

                const imageSrc = volume.imgVol.startsWith("data:")
                    ? volume.imgVol
                    : `data:image/jpeg;base64,${volume.imgVol}`;

                let prezzoOriginale = volume.prezzo;
                let prezzoAumentato = (volume.prezzo * 1.3).toFixed(2);

                let oggi = new Date();
                oggi.setDate(oggi.getDate() + 7);
                let dataFormattata = oggi.toLocaleDateString('it-IT');


                container.innerHTML = `
                            <div class="absolute -top-2 right-4 flex gap-2">
                                <div class="w-3 h-3 rounded-full bg-nekopink"></div>
                                <div class="w-3 h-3 rounded-full bg-nekopurple"></div>
                                <div class="w-3 h-3 rounded-full bg-kawaililac"></div>
                            </div>
                
                            <div class="flex flex-col md:flex-row items-center gap-4">
                                <div class="bg-kawaililac rounded-xl px-4 py-2 flex items-center">
                                    <i class="fas fa-star text-yellow-400 text-2xl mr-3"> </i>
                                    <div>
                                        <h3 class="font-bold text-white text-xl" style="font-size: 30px"> Offerta del giorno!</h3>
                                        <p class="text-white text-xs">Sconti fino al 30%</p>
                                    </div>
                                </div>
                        
                                <div class="md:flex-1 flex flex-col md:flex-row items-center gap-4">
                                    <div class="bg-gradient-to-r from-nekopink to-nekopurple w-24 h-24 rounded-xl p-1">
                                        <div class="bg-white w-full h-full rounded-lg overflow-hidden">
                                            <img src="${imageSrc}"
                                                 alt="${prodotto.nome}"
                                                 class="w-full h-full object-cover">
                                        </div>
                                    </div>
                
                                    <div class="text-center md:text-left">
                                        <h3 class="font-bold text-xl text-nekopurple mb-1">${prodotto.nome} Vol. ${volume.numVolumi}</h3>
                                        <div class="flex justify-center md:justify-start items-center gap-1">
                                            <p class="text-gray-500 line-through text-sm">&#8364 ${prezzoAumentato}</p>
                                            <p class="text-2xl font-bold text-nekopink">&#8364 ${volume.prezzo}</p>
                                        </div>
                                        <div class="mt-2 flex gap-2 justify-center md:justify-start">
                                            <span class="bg-nekoorange px-2 py-1 rounded-lg text-white text-xs">super sconto</span>
                                            <span class="bg-nekored px-2 py-1 rounded-lg text-white text-xs">-30%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mt-4 flex justify-between items-center">
                                <p class="text-white text-sm">Offerta valida fino al ${dataFormattata}</p>
                                <button data-id="${volume.idVolume}" id="addCartOfferta" class="bg-nekopeach hover:bg-nekopink text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
                                    <i class="fas fa-gift mr-2"></i> Approfitta ora
                                </button>
                            </div>
                `;

                document.getElementById("addCartOfferta").addEventListener("click", function(e) {
                    const idVolume = this.dataset.id;

                    const dati = {
                        qCarrello: 1,
                        idVolume: idVolume
                    };

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
                                window.location.href = "catalog.jsp";
                            } else {
                                mostraErrore("alcuni prodotti sono già nel carrello");
                            }
                        })
                        .catch(err => {
                            console.error("Errore:", err);
                            mostraErrore("Si è verificato un errore. Riprova più tardi.");
                        });
                });

            } else {
                container.innerHTML = `<p class="text-red-500">Nessun prodotto disponibile.</p>`;
            }
        })
        .catch(error => {
            console.error("Errore:", error);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    fetch("getcatalog?dayProduct=figure")
        .then(response => {
            if (response.status === 500){
                throw new Error("Errore nel caricamento del prodotto");
            }
            return response.json();
        })
        .then(data => {
            const container = document.getElementById("limitedFigure");

            const prodotto = data[0];
            const imageSrc = `data:image/jpeg;base64,${prodotto.imgProd}`

            container.innerHTML = `
                <img src="${imageSrc}"
                    alt="${prodotto.nome}"
                    class="w-full h-full object-cover">`;
        })
        .catch(error => {
            console.error("Errore:", error);
        })

});

document.addEventListener("DOMContentLoaded", function () {
    fetch("getcatalog?limit=2")
        .then(response => {
            if (response.status === 500) {
                throw new Error("Errore nel caricamento del prodotto");
            }
            return response.json();
        })
        .then(data => {
            const container = document.getElementById("weeklyFeatured");
            container.innerHTML = "";

            if (!Array.isArray(data) || data.length === 0) {
                container.innerHTML = "<p>Nessun prodotto valido da mostrare.</p>";
                return;
            }

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
                    descrizione: volume.descrizione || "Descrizione volume non disponibile",
                    prezzo: volume.prezzo,
                    img: volume.imgVol || (prodottoAssoc ? prodottoAssoc.imgProd : ""),
                    numVolumi: volume.numVolumi,
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
                        badgeColor: "bg-nekored",
                        borderColor: "border-kawaililac",
                        badgeText: "POP!"
                    });
                    prodottiMostrati.add(prodotto.idProdotto);
                }
            });

            // Funzione per creare card prodotto/volume

            function creaCard(item) {
                let titolo = "";
                let prezzo = item.prezzo || 0;
                let descrizione = item.descrizione || "";
                let imgSrc = "";

                if (item.tipo === 'volume') {
                    titolo = `${item.nome} Vol. ${item.numVolumi || ''}`;
                    imgSrc = item.img ? (item.img.startsWith("data:") ? item.img : `data:image/jpeg;base64,${item.img}`) : "https://via.placeholder.com/400x300";
                } else {
                    titolo = item.nome || "Action Figure";
                    imgSrc = item.imgProd ? (item.imgProd.startsWith("data:") ? item.imgProd : `data:image/jpeg;base64,${item.imgProd}`) : "https://via.placeholder.com/400x300";
                }

                return `
                    <div class="product-card bg-white rounded-lg overflow-hidden border-2 ${item.borderColor} relative m-2 max-w-sm">
                        <div class="relative h-48 overflow-hidden">
                            <img src="${imgSrc}" alt="${titolo}" class="w-full h-full object-cover transition-transform duration-300 hover:scale-105" />
                        </div>
                        <div class="p-4">
                            <h3 class="font-bold text-gray-800">${titolo}</h3>
                            <p class="text-gray-600 text-sm mt-1">${descrizione}</p>
                            <div class="flex justify-between items-center mt-4">
                                <span class="text-nekored font-bold">&#8364; ${prezzo.toFixed(2)}</span>
                                <button
                                 data-id="${item.tipo === 'volume' ? item.idVolume : item.idProdotto}"
                                 data-tipo="${item.tipo}"
                                 class="bg-nekored hover:bg-nekopink text-white py-2 px-4 rounded-lg text-sm transition add-to-cart">
                                    <i class="fas fa-cart-plus mr-1"></i> Aggiungi
                                </button>
                            </div>
                        </div>
                        <div class="absolute top-2 left-2 ${item.badgeColor} text-white px-2 py-1 rounded-md text-xs font-bold">${item.badgeText}</div>
                    </div>
                `;
            }

            container.innerHTML = prodottiFinali.slice(0, 2).map(creaCard).join('');
            document.querySelectorAll(".add-to-cart").forEach(btn => {
                btn.addEventListener("click", function () {

                    const tipo = this.dataset.tipo;
                    const id = this.dataset.id;

                    const dati = {
                        qCarrello: 1
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
                                window.location.href = "catalog.jsp";
                            } else {
                                mostraErrore("alcuni prodotti sono già nel carrello");
                            }
                        })
                        .catch(err => {
                            console.error("Errore:", err);
                            mostraErrore("Si è verificato un errore. Riprova più tardi.");
                        });
                });
            });
        })
        .catch(error => {
            console.error("Errore:", error);
            const container = document.getElementById("weeklyFeatured");
            container.innerHTML = "<p>Errore nel caricamento dei prodotti.</p>";
        });
});
