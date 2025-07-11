// Modal functionality
/*const addProductBtn = document.getElementById('addProductBtn');
const closeModalBtn = document.getElementById('closeModalBtn');
const cancelModalBtn = document.getElementById('cancelModalBtn');
const modal = document.getElementById('addProductModal');

addProductBtn.addEventListener('click', () => {
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
});*/

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

let curentPageProd = 1;
let elemVol = true;
let elemProd = true;

async function loadTableProd(pag){
    try{
        const response = await fetch(`getcatalog?page=${pag}&limit=5&productType=prod`);
        const data = await response.json();

        if(data.error !== undefined){
            mostraErrore("errore nel caricamento");
            return;
        }

        const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti

        const table = document.getElementById("tableFigure");
        table.innerHTML = "";  // reset contenuto

        if(data.length > 0) {
            elemProd = true;
            prodotti.forEach(prod => {
                const row = document.createElement("tr");
                row.innerHTML = createRiga(prod);
                table.appendChild(row);
            });
        } else {
            elemProd = false;
        }

        function createRiga(item) {
            const imgSrc = item.imgProd
                ? (item.imgProd.startsWith("data:")
                    ? item.imgProd
                    : `data:image/jpeg;base64,${item.imgProd}`)
                : "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
            return`
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        #NEKO-${item.idProdotto}
                    </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img
                                        class="h-10 w-10 rounded"
                                        src=${imgSrc}
                                        alt="Jujutsu Kaisen"
                                    />
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900">
                                        ${item.nome}
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="px-2 py-1 text-xs rounded-full category-manga">Action Figure</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${item.prezzo}€
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${item.quantita}
                        </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <button id="editProd${item.idProdotto}" class="text-nekoblue hover:text-blue-600 mr-3">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button id="removeProd${item.idProdotto}" class="text-nekored hover:text-red-600">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
            `;
        }


    }  catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function loadTableVol(pag){
    try{
        const respons = await fetch(`getcatalog?page=${pag}&limit=5&productType=vol`);
        const data = await respons.json();

        if(data.error !== undefined){
            mostraErrore("errore nel caricamento");
            return;
        }

        const prodotti = data.filter(item => item.idVolume === undefined);  // prodotti
        const volumi = data.filter(item => item.idVolume !== undefined);    // volumi

        const table = document.getElementById("tableManga");
        table.innerHTML = "";  // reset contenuto

        if(data.length > 0) {
            elemVol  = true;
            volumi.forEach(vol => {
                const prod = prodotti.filter(item => item.idProdotto === vol.idProdotto);
                if (prod !== undefined) {
                    const row = document.createElement("tr");
                    row.innerHTML = createVolEow(vol, prod[0]);
                    table.appendChild(row);
                }
            })
        } else {
            elemVol = false;
        }

        function createVolEow(item, tag){
            const imgSrc = item.imgVol
                ? (item.imgVol.startsWith("data:")
                    ? item.imgVol
                    : `data:image/jpeg;base64,${item.imgVol}`)
                : "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
            return`
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        #NEKO-${item.idVolume}
                    </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img
                                        class="h-10 w-10 rounded"
                                        src=${imgSrc}
                                        alt="Jujutsu Kaisen"
                                    />
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900">
                                        ${tag.nome} ${item.numVolumi}
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="px-2 py-1 text-xs rounded-full category-manga">${item.tag}</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${item.prezzo}€
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${item.quantita}
                        </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <button id="editProd${item.idVolume}" class="text-nekoblue hover:text-blue-600 mr-3">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button id="removeProd${item.idVolume}" class="text-nekored hover:text-red-600">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
            `;
        }
    }  catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function loadTotVol(){
    try{
        const respons = await fetch(`getcatalog?tot=tot&productType=vol`);
        const data = await respons.json();

        if(data.error !== undefined){
            mostraErrore("errore nel caricamento");
            return;
        }

        return data.totale;
    }  catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function loadTotProd(){
    try{
        const respons = await fetch(`getcatalog?tot=tot&productType=prod`);
        const data = await respons.json();

        if(data.error !== undefined){
            mostraErrore("errore nel caricamento");
            return;
        }

        return data.totale;
    }  catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function getTot(){
    const tagTot = document.getElementById("tot_prod");
    const volTot = await loadTotVol();
    const  prodTot = await loadTotProd();

    tagTot.textContent = (volTot + prodTot).toString();
}

window.initProduct = function () {
    loadTableProd(curentPageProd);
    loadTableVol(curentPageProd);
    getTot();

    document.getElementById("precProd").addEventListener("click",  btn => {
        if(curentPageProd > 1){
            curentPageProd -= 1;
            loadTableProd(curentPageProd);
            loadTableVol(curentPageProd);
        } else {
            btn.classList.add("disabled:opacity-50");
            btn.disabled = true;
            mostraErrore("sei arrivato all'inizio della lista");
        }
        console.log(currentPageProd);
    })

    document.getElementById("sucProd").addEventListener("click", function (){
        const btn = document.getElementById("precProd");
        if(elemProd || elemVol){
            curentPageProd += 1;
            loadTableProd(curentPageProd);
            loadTableVol(curentPageProd);
            btn.classList.remove("disabled:opacity-50");
            btn.disabled = false;
        }
        console.log(curentPageProd);
    })
}