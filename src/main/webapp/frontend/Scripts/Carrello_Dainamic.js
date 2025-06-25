function mostraErrore(msg) {
    const erroreBox = document.getElementById("messaggioErrore");
    erroreBox.textContent = msg;
    erroreBox.classList.remove("hidden");

    erroreBox.scrollIntoView({ behavior: "smooth", block: "center" });

    setTimeout(() => {
        erroreBox.classList.add("hidden");
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
                    updateCartTotals(sconto);
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

// Update cart totals
function updateCartTotals(cuponValue) {
    const items = document.querySelectorAll('#cart-items-container .product-card');
    let subtotal = 0;

    items.forEach(item => {
        const priceText = item.querySelector('.text-nekopink, .text-nekored').textContent;
        const price = parseFloat(priceText.replace('€', '').replace(',', '.'));
        const quantity = parseInt(item.querySelector('.quantity-input').value);
        subtotal += price * quantity;
    });

    const shipping = 4.99;
    const discountRate = cuponValue / 100; // 👈 converti intero in percentuale
    const discount = subtotal * discountRate;
    const total = subtotal + shipping - discount;

    document.getElementById('subtotal').textContent = `€${subtotal.toFixed(2).replace('.', ',')}`;
    document.getElementById('shipping').textContent = `€${shipping.toFixed(2).replace('.', ',')}`;
    document.getElementById('discount').textContent = `-€${discount.toFixed(2).replace('.', ',')}`;
    document.getElementById('total').textContent = `€${total.toFixed(2).replace('.', ',')}`;
    document.getElementById('item-count').textContent = `${items.length} articol${items.length != 1 ? 'i' : 'o'}`;
}

document.addEventListener("DOMContentLoaded", function () {

    const params = new URLSearchParams();
    params.append("action", "list");

    fetch("cartgesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })

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

        return `
    <div class="product-card bg-white rounded-lg overflow-hidden border-2 border-nekoorange mb-4 relative">
        <div class="p-4 flex flex-col md:flex-row">
            <div class="w-full md:w-1/4 h-40 rounded-xl overflow-hidden flex-shrink-0">
                <img src="${imgSrc}" alt="${titolo}" class="w-full h-full object-cover">
            </div>
            <div class="md:ml-4 mt-4 md:mt-0 flex-1">
                <div class="flex justify-between">
                    <h3 class="font-bold text-gray-800 text-lg" style="font-size: 20px">${titolo}</h3>
                    <button class="remove-btn text-xl" data-id="${item.tipo === 'volume' ? item.idVolume : item.idProdotto}" data-tipo="${item.tipo}">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </div>
                <p class="text-gray-600 text-sm mt-1">${descrizione}</p>
                <div class="mt-4 flex flex-col md:flex-row md:items-center justify-between">
                    <div class="flex items-center mb-3 md:mb-0">
                        <span class="text-2xl font-bold text-nekored">&#8364; ${prezzoFormattato}</span>
                    </div>
                    <div class="quantity-selector">
                        <button class="quantity-btn decrement">
                            <i class="fas fa-minus"></i>
                        </button>
                        <input type="number" value="${item.quantita || 1}" min="1" class="quantity-input">
                        <button class="quantity-btn increment">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;
    }

});

function aggiornaPaginazione(totalCount, currentPage) {
    const totalPages = Math.ceil(totalCount / perPage);
    const pagination = document.querySelector('#pagination .flex.items-center.gap-2');

    pagination.innerHTML = '';
    for (let i = 1; i <= totalPages; i++) {
        pagination.innerHTML += `
            <a href="#" data-page="${i}" 
               class="w-10 h-10 ${i === currentPage ? 'bg-nekopeach text-white' : 'bg-white text-nekopeach'}
               rounded-full flex items-center justify-center font-bold hover:bg-nekopink hover:text-white transition">
               ${i}
            </a>`;
    }
}

document.getElementById("pagination").addEventListener("click", e => {
    if (e.target.matches("a[data-page]")) {
        e.preventDefault();
        currentPage = parseInt(e.target.dataset.page);
        caricaProdotti(currentPage);
    }
});