function mostraErrore(msg) {
    const erroreBox = document.getElementById("messaggioErrore");
    erroreBox.textContent = msg;
    erroreBox.classList.remove("hidden");

    erroreBox.scrollIntoView({ behavior: "smooth", block: "center" });

    setTimeout(() => {
        erroreBox.classList.add("hidden");
    }, 5000);
}

function getCookie(name) {
    return document.cookie.split('; ').find(row => row.startsWith(name + '='))?.split('=')[1];
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

// Quantity control functions
function increaseQuantity() {
    const quantityInput = document.getElementById('quantity');
    let value = parseInt(quantityInput.value);
    if (value < 10) {
        quantityInput.value = value + 1;
    }
}

function decreaseQuantity() {
    const quantityInput = document.getElementById('quantity');
    let value = parseInt(quantityInput.value);
    if (value > 1) {
        quantityInput.value = value - 1;
    }
}

// Add to cart function
function addToCart() {
    const url = new URLSearchParams(window.location.search);
    const id = url.get('id');
    const type = url.get('type');
    const quantity = document.getElementById('quantity').value;
    const dati = {
        qCarrello: quantity
    };

    if (type === "vol") {
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

// Thumbnail click handler
document.querySelectorAll('.w-20.h-20').forEach(thumb => {
    thumb.addEventListener('click', function() {
        const mainImage = document.querySelector('.h-96 img');
        const newSrc = this.querySelector('img').src;
        mainImage.src = newSrc;

        // Update active thumbnail
        document.querySelectorAll('.w-20.h-20').forEach(t => {
            t.classList.remove('border-nekopink', 'border-2');
            t.classList.add('border-gray-200');
        });
        this.classList.remove('border-gray-200');
        this.classList.add('border-nekopink', 'border-2');
    });
});

function load(){
    console.log("load chiamata");
    const params = new URLSearchParams(window.location.search);
    const id = params.get('id');
    const type = params.get('type');
    const imgprod = document.getElementById("img");
    const title = document.getElementById("title");
    const tag = document.getElementById("tag");
    const descrizione = document.getElementById("descrizione");
    const noSconto = document.getElementById("prezzo+");
    const prezzo = document.getElementById("prezzo");
    const risparmio = document.getElementById("risparmio");
    const dbQuantità = document.getElementById("disponibilità");
    const autore = document.getElementById("autore");
    const dataPub = document.getElementById("dataPub");

    fetch(`getcatalog?id=${id}&productType=${type}`)
        .then(res => res.json())
        .then(data => {
            if(data.error !== undefined){
                mostraErrore("errore nel caricamento, scusateci il disagio");
                return;
            }
            if(type === "prod"){
                imgprod.src = data[0].imgProd ? `data:image/jpeg;base64,${data[0].imgProd}` : "default-image.jpg";
                title.textContent = data[0].nome;
                tag.textContent = "Action Figure";
                descrizione.textContent = data[0].descrizione;
                noSconto.textContent = (data[0].prezzo * 1.05).toFixed(2);
                prezzo.textContent = data[0].prezzo;
                risparmio.textContent = (data[0].prezzo * 0.05).toFixed(2);
                dbQuantità.textContent = data[0].quantità;
                autore.textContent = data[0].autore;
                dataPub.textContent = new Date(new Date().setFullYear(new Date().getFullYear() - 1))
                    .toISOString().split('T')[0];
            } else {
                const prod = data[0];
                const vol = data[1];

                imgprod.src = vol.imgVol ? `data:image/jpeg;base64,${vol.imgVol}` : "default-image.jpg";
                title.textContent = prod.nome;
                tag.textContent = vol.tag;
                descrizione.textContent = prod.descrizione;
                noSconto.textContent = (vol.prezzo * 1.05).toFixed(2);
                prezzo.textContent = vol.prezzo;
                risparmio.textContent = (vol.prezzo * 0.05).toFixed(2);
                dbQuantità.textContent = vol.quantità;
                autore.textContent = prod.autore;
                dataPub.textContent = vol.dataPubl
            }
        })

}

function addToWhisList(){
    if(getCookie("access")) {
        const params = new URLSearchParams(window.location.search);
        const id = params.get('id');
        const type = params.get('type');
        const dati = {};

        if (type === "vol") {
            dati.idVolume = id;
        } else {
            dati.idProdotto = id;
        }


        const param = new URLSearchParams();
        param.append("action", "wishlist");
        param.append("actionWishList", "add");
        param.append("json", JSON.stringify(dati));

        fetch("common/utentdategesture", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: param.toString()
        })
            .then(res => res.json())
            .then(data => {
                if(data.error){
                    mostraErrore("non siamo riusciti ad aggiungerlo alla lista");
                    return;
                }
                mostraErrore("aggiunto con successo")
            })
        return;
    }
    mostraErrore("eseguire l'accesso per aggiungere");
}

// Initialize when page loads
document.addEventListener('DOMContentLoaded', function() {
    console.log("DOM caricato");
    generateDecorations();
    load();
});