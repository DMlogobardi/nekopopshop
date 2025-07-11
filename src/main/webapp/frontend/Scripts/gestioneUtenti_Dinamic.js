const closeModalBtn1 = document.getElementById('closeModalBtn1');
const cancelModalBtn1 = document.getElementById('cancelModalBtn1');
const modal1 = document.getElementById('addUserModal');

const closeModal1 = () => {
    modal.classList.remove('active');
    modal.classList.add('opacity-0', 'invisible');
};

closeModalBtn1.addEventListener('click', closeModal1);
cancelModalBtn1.addEventListener('click', closeModal1);

// Close modal when clicking outside
modal1.addEventListener('click', (e) => {
    if (e.target === modal) {
        closeModal1();
    }
});

// Generate cherry blossoms
function createFloatingElements() {
    const decorations = document.getElementById('decorations');
    const types = ['cherry-blossom', 'cherry-blossom'];
    const colors = ['#ff7eb8', '#ff65a3', '#ff4d8e'];

    for (let i = 0; i < 8; i++) {
        const element = document.createElement('div');
        const type = types[Math.floor(Math.random() * types.length)];
        const color = colors[Math.floor(Math.random() * colors.length)];

        element.className = type;
        element.style.left = Math.random() * 100 + 'vw';
        element.style.animationDuration = (10 + Math.random() * 20) + 's';
        element.style.animationDelay = Math.random() * 5 + 's';
        element.style.opacity = Math.random() * 0.5 + 0.2;
        element.style.transform = 'scale(' + (Math.random() * 0.5 + 0.5) + ')';

        decorations.appendChild(element);
    }
}

function ordiniForUser(id = 0) {
    if(id === 0){
        mostraErrore("ordini non visualizabili");
        return Promise.resolve(0); // ritorna 0 se id non valido
    }
    const params = new URLSearchParams();
    params.append("action", "order");
    params.append("actionOrder", "fromUser");
    params.append("id", id);

    return fetch("admin/admindatagesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
        .then(res => res.json())
        .then(data => {
            if (data.error !== undefined) {
                mostraErrore("internal error");
                return 0;
            }
            const ordiniCliente = data.filter(item => item.idOrdine !== undefined);
            return ordiniCliente.length;
        });
}

let elem = true

function caricaClienti(pag = 1){
    const params = new URLSearchParams();
    params.append("action", "cliente");
    params.append("actionCliente", "getAll");
    params.append("limit", "10");
    params.append("page", pag.toString());

    fetch("admin/admindatagesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    }).then(res => res.json())
        .then(data =>{
            if(data.error !== undefined){
                mostraErrore("internal error")
            }
            const clienti = data.filter(item => item.idCliente !== undefined);
            let tabbella = document.getElementById("table");

            if(clienti.length > 0) {
                elem = true;
                tabbella.innerHTML = '';
                Promise.all(clienti.map(creaSezione)).then(sezioni => {
                    sezioni.forEach(html => {
                        const row = document.createElement("tr");
                        row.innerHTML = html;
                        tabbella.appendChild(row);
                    });
                });
            } else {
                elem = false;
                curentPage -= 1;
                mostraErrore("clienti finiti");
            }

            async function creaSezione(item) {
                let numOrdini;

                try {
                    numOrdini = await ordiniForUser(item.idCliente);
                } catch (error) {
                    console.warn(`Impossibile ottenere ordini per cliente ${item.idCliente}:`, error.message);
                    numOrdini = 'Errore';
                }

                return `<tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${item.idCliente}</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.nome} ${item.cognome}</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.email}</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${numOrdini}</td>

                </tr>
                    `;
            }
        });
}

async function utentiRegistrati(){
    const params = new URLSearchParams();
    params.append("action", "cliente");
    params.append("actionCliente", "getAll");

    const respons = await fetch("admin/admindatagesture", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
    })
    const data = await respons.json()

    if(data.error !== undefined){
        mostraErrore("internal error")
    }

    const contUtent = document.getElementById("tot");
    contUtent.textContent = data.length;

}

let curentPage = 1;

window.initUtent = function() {
    utentiRegistrati();
    caricaClienti(curentPage);

    document.getElementById("prec").addEventListener("click", function () {
        if(curentPage > 1){
            curentPage -= 1;
            caricaClienti(curentPage);
        } else {
            mostraErrore("sei arrivato all'inizio della lista");
        }
        console.log(curentPage);
    })

    document.getElementById("suc").addEventListener("click", function (){
        if(elem){
            curentPage += 1;
            caricaClienti(curentPage);
        }
        console.log(curentPage);
    })
}