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
                            } else if (data.success) {
                                window.location.href = "catalog.jsp";
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
            console.log(data)
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