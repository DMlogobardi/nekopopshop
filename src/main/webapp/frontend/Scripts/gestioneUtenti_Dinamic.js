// Modal functionality
const addUserBtn = document.getElementById('addUserBtn');
const closeModalBtn = document.getElementById('closeModalBtn');
const cancelModalBtn = document.getElementById('cancelModalBtn');
const modal = document.getElementById('addUserModal');

addUserBtn.addEventListener('click', () => {
    modal.classList.add('active');
    modal.classList.remove('opacity-0', 'invisible');
});

const closeModal = () => {
    modal.classList.remove('active');
    modal.classList.add('opacity-0', 'invisible');
};

closeModalBtn.addEventListener('click', closeModal);
cancelModalBtn.addEventListener('click', closeModal);

// Close modal when clicking outside
modal.addEventListener('click', (e) => {
    if (e.target === modal) {
        closeModal();
    }
});

// Generate cherry blossoms
function createCherryBlossoms() {
    const decorations = document.getElementById('decorations');
    for (let i = 0; i < 15; i++) {
        const blossom = document.createElement('div');
        blossom.className = 'cherry-blossom';

        // Random position
        const left = Math.random() * 100;
        blossom.style.left = `${left}vw`;

        // Random delay
        const delay = Math.random() * 15;
        blossom.style.animationDelay = `${delay}s`;

        // Random size
        const size = 15 + Math.random() * 15;
        blossom.style.width = `${size}px`;
        blossom.style.height = `${size}px`;

        decorations.appendChild(blossom);
    }
}

async function ordiniForUser(id = 0){
    if(id === 0){
        mostraErrore("ordini non visualizabili");
    }
    const params = new URLSearchParams();
    params.append("action", "order");
    params.append("actionOrder", "fromUse");
    params.append("id", id);

    fetch("admin/admindatagesture", {
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
                return;
            }

            return data.length;
        })
}

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
            let tabbella = document.getElementById("table");

            data.forEach(c =>{
                const sezzione = creaSezione(c);
                tabbella.appendChild(sezzione);
            })

            async function creaSezione(item) {
                let numOrdini;

                try {
                    const ordini = await ordiniForUser(item.idCliente);
                    numOrdini = ordini;
                } catch (error) {
                    console.warn(`Impossibile ottenere ordini per cliente ${item.idCliente}:`, error.message);
                    numOrdini = 'Errore';
                }

                return `<tr>
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${item.idCliente}</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.nome} ${item.cognome}</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.email}</td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">numOrdini</td>

                </tr>
                    `;
            }
        });
}

function utentiRegistrati(){
    const params = new URLSearchParams();
    params.append("action", "cliente");
    params.append("actionCliente", "getAll");

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

            const contUtent = document.getElementById("tot");
            contUtent.textContent = data.length;
        });
}

function initUtent(){
    createCherryBlossoms();
    utentiRegistrati();
    caricaClienti();
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    createCherryBlossoms();
    initUtent();
});