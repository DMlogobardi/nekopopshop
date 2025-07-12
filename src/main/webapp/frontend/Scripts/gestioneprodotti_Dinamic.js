// Modal functionality
/*const addProductBtn = document.getElementById('addProductBtn');
const closeModalBtn = document.getElementById('closeModalBtn');
const cancelModalBtn = document.getElementById('cancelModalBtn');
const modal = document.getElementById('addProductModal');

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
                        <button onclick="editProduct(\`${item.idProdotto}\`, 'prod')" class="text-nekoblue hover:text-blue-600 mr-3">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button onclick="removeProduct(\`${item.idProdotto}\`, 'prod')" class="text-nekored hover:text-red-600">
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
                        <button onclick="editProduct(\`${item.idVolume}\`, 'vol')" class="text-nekoblue hover:text-blue-600 mr-3">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button onclick="removeProduct(\`${item.idVolume}\`, 'vol')" class="text-nekored hover:text-red-600">
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

async function removeProduct(id, tipo) {
    const params = new URLSearchParams();
    params.append("action", "delete");
    const del = {
        tipo: tipo,
        id: id
    }
    const delBody = {
        elements: del
    }
    params.append("json", JSON.stringify(delBody));
    try {
        const respons = await fetch("admin/manageproduct", {
            method: "POST",
            headers: {
                "Content-Type": "form-data"
            },
            body: params.toString()
        });

        const data = await respons.json();

        if (data.error !== undefined) {
            mostraErrore("errore nel caricamento");
            return;
        }

        if (data.success !== undefined) {
            if (tipo === "vol") {
                loadTableProd(curentPageProd);
            } else {
                loadTableVol(curentPageProd);
            }
        }
    } catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function editProduct(id, tipo) {
    const update = document.getElementById("modifyProductModal");
    const nVolume = document.getElementById("productvolNumDivModify");
    const tag = document.getElementById("tagModify");
    update.classList.add('active');
    update.classList.remove('opacity-0', 'invisible');
    if(tipo === "prod"){
        nVolume.classList.add("hidden");
        tag.classList.add("hidden")
        return;
    }
    if(tipo === "vol"){
        nVolume.classList.remove("hidden");
        tag.classList.remove("hidden")
        return;
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

function modalSwopAdd(tipo){
    const nVolume = document.getElementById("productvolNumDiv");
    const tag = document.getElementById("volTagDiv");
    if(tipo === "figure"){
        nVolume.classList.add("hidden");
        tag.classList.add("hidden")
        return;
    }
    if(tipo === "manga"){
        nVolume.classList.remove("hidden");
        tag.classList.remove("hidden")
        return;
    }
}

function clearModal(tipo) {
    if (tipo === "add") {
        const categoria = document.getElementById("productCategory2");
        const nome = document.getElementById("productName2");
        const numVol = document.getElementById("productvolNum");
        const prezzo = document.getElementById("productPrice2");
        const quantita = document.getElementById("productStock2");
        const tag = document.getElementById("volTag");
        const autore = document.getElementById("autore");
        const imgPrev = document.getElementById("imagePreview");
        const img = document.getElementById("imgAdd");
        const descrizione = document.getElementById("productDescription2");

        categoria.value = "figure";
        modalSwopAdd("figure");
        nome.value = "";
        if (numVol) numVol.value = "";
        prezzo.value = "";
        quantita.value = "";
        if (tag) tag.value = "";
        if (autore) autore.value = "";
        if (imgPrev) {
            imgPrev.innerHTML = `
                <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                </svg>
            `;
        }
        if (img) img.value = "";
        if(descrizione) descrizione.value = "";
    } else {
        const nome = document.getElementById("productName3");
        const numVol = document.getElementById("productvolNumModify");
        const prezzo = document.getElementById("productPrice3");
        const quantita = document.getElementById("productStock3"); // CORRETTO!
        const tag = document.getElementById("productCategory3");
        const autore = document.getElementById("productAutore3");
        const imgPrev = document.getElementById("imagePreviewModify");
        const img = document.getElementById("imgModify");
        const descrizione = document.getElementById("productDescription3");

        if (nome) nome.value = "";
        if (numVol) numVol.value = "";
        if (prezzo) prezzo.value = "";
        if (quantita) quantita.value = "";
        if (tag) tag.value = "";
        if (autore) autore.value = "";
        if (imgPrev) {
            imgPrev.innerHTML = `
                <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                </svg>
            `;
        }
        if (img) img.value = "";
        if(descrizione) descrizione.value = "";
    }
}

window.initProduct = function () {
    loadTableProd(curentPageProd);
    loadTableVol(curentPageProd);
    getTot();

    const addBtn = document.getElementById("add");

    document.getElementById("precProd").addEventListener("click", btn => {
        if (curentPageProd > 1) {
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

    document.getElementById("sucProd").addEventListener("click", function () {
        const btn = document.getElementById("precProd");
        if (elemProd || elemVol) {
            curentPageProd += 1;
            loadTableProd(curentPageProd);
            loadTableVol(curentPageProd);
            btn.classList.remove("disabled:opacity-50");
            btn.disabled = false;
        }
        console.log(curentPageProd);
    })

    const closeModalBtn = document.getElementById('closeModalBtn2');
    closeModalBtn.addEventListener('click', function () {
        const modal = document.getElementById('addProductModal');
        modal.classList.remove('active');
        modal.classList.add('opacity-0', 'invisible');
        clearModal("add");
    });

    addBtn.addEventListener("click", function () {
        const modal = document.getElementById('addProductModal');
        modal.classList.add('active');
        modal.classList.remove('opacity-0', 'invisible');
    })

    const closeModalUpBtn = document.getElementById("closeModalBtn3");
    closeModalUpBtn.addEventListener('click', function () {
        const modalUp = document.getElementById('modifyProductModal');
        modalUp.classList.remove('active');
        modalUp.classList.add('opacity-0', 'invisible');
        clearModal("modify");
    });

    const addSelect = document.getElementById("productCategory2")
    addSelect.addEventListener("click", function () {
        modalSwopAdd(addSelect.value);
    })

    const annullaAdd = document.getElementById("cancelModalBtn2");
    const annullaModify = document.getElementById("cancelModalBtn3");
    annullaAdd.addEventListener("click", function () {
        clearModal("add");
    })
    annullaModify.addEventListener("click", function () {
        clearModal("modify");
    })

    document.getElementById("imgModify").addEventListener("change", function (event) {
        const file = event.target.files[0];
        const preview = document.getElementById("imagePreviewModify");

        if (file && file.type.startsWith("image/")) {
            const imageUrl = URL.createObjectURL(file);

            preview.innerHTML = `
            <img src="${imageUrl}" alt="Anteprima immagine" class="h-16 w-16 rounded-md object-cover" />
        `;
        } else {
            preview.innerHTML = `
            <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
            </svg>
        `;
        }
    });

    document.getElementById("imgAdd").addEventListener("change", function (event) {
        const file = event.target.files[0];
        const preview = document.getElementById("imagePreview");

        if (file && file.type.startsWith("image/")) {
        const imageUrl = URL.createObjectURL(file);

        preview.innerHTML = `
            <img src="${imageUrl}" alt="Anteprima immagine" class="h-16 w-16 rounded-md object-cover" />
        `;
    } else {
        preview.innerHTML = `
            <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
            </svg>
        `;
    }
    });

}