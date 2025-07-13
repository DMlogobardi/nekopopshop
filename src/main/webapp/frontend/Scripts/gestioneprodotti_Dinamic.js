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
            const safeDataItem = JSON.stringify(item)
                .replace(/"/g, '&quot;')  // escape i doppi apici per HTML
                .replace(/'/g, '&#39;');

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
                        <button 
                            data-item="${safeDataItem}"  
                            onclick="editProduct('${item.idProdotto}', 'prod', this)" 
                            class="edit-btn text-nekoblue hover:text-blue-600 mr-3">
                                <i class="fas fa-edit"></i>
                        </button>
                        <button onclick="removeProduct(\`${item.idProdotto}\`, 'prodotto')" class="text-nekored hover:text-red-600">
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
            const safeDataItem = JSON.stringify(item)
                .replace(/"/g, '&quot;')  // escape i doppi apici per HTML
                .replace(/'/g, '&#39;');

            const safeDataTag = JSON.stringify(tag)
                .replace(/"/g, '&quot;')  // escape i doppi apici per HTML
                .replace(/'/g, '&#39;');

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
                                    <img id=\`img\`
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
                        <button 
                            data-item="${safeDataItem}"
                            data-tag="${safeDataTag}"  
                            onclick="editProduct('${item.idVolume}', 'vol', this)" 
                            class="edit-btn text-nekoblue hover:text-blue-600 mr-3">
                                <i class="fas fa-edit"></i>
                        </button>
                        <button onclick="removeProduct(\`${item.idVolume}\`, 'volume')" class="text-nekored hover:text-red-600">
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
    const delBody = {
        element: [
            {
                tipo: tipo,
                id: id
            }
        ]
    };

    const form = new FormData();
    form.append("action", "delete");
    form.append("json", JSON.stringify(delBody));

    try {
        const response = await fetch("admin/manageproduct", {
            method: "POST",
            body: form
        });

        const data = await response.json();

        if (data.error !== undefined) {
            mostraErrore("errore nel caricamento");
            return;
        }

        if (data.success !== undefined) {
            if (tipo === "vol") {
                await loadTableProd(curentPageProd);
            } else {
                await  loadTableVol(curentPageProd);
            }
        }
    } catch (error) {
        mostraErrore("network error");
        console.log(error);
        return null;
    }
}

async function loadDataProd(item){
    console.log(item);
    const nome = document.getElementById("productName3");
    const prezzo = document.getElementById("productPrice3");
    const quantita = document.getElementById("productStock3"); // CORRETTO!
    const autore = document.getElementById("productAutore3");
    const imgPrev = document.getElementById("imagePreviewModify");
    const descrizione = document.getElementById("productDescription3");

    nome.value = item.nome;
    prezzo.value = item.prezzo;
    quantita.value = item.quantita;
    if (autore) autore.value = item.autore;
    if (imgPrev && item.imgProd) {
        const imgSrc = item.imgProd.startsWith("data:")
            ? item.imgProd
            : `data:image/jpeg;base64,${item.imgProd}`;

        imgPrev.innerHTML = `
        <img src="${imgSrc}" class="h-full w-full object-cover rounded" alt="Anteprima immagine">
    `;
    }
    if(descrizione) descrizione.value = item.descrizione;
}

async function loadDataVol(item, tagItem){
    const nome = document.getElementById("productName3");
    const numVol = document.getElementById("productvolNumModify");
    const prezzo = document.getElementById("productPrice3");
    const quantita = document.getElementById("productStock3"); // CORRETTO!
    const tag = document.getElementById("productCategory3");
    const autore = document.getElementById("productAutore3");
    const imgPrev = document.getElementById("imagePreviewModify");
    const descrizione = document.getElementById("productDescription3");

    if (nome) nome.value = tagItem.nome;
    if (numVol) numVol.value = item.numVolumi;
    if (prezzo) prezzo.value = item.prezzo;
    if (quantita) quantita.value = item.quantita;
    if (tag) tag.value = item.tag;
    if (autore) autore.value = tagItem.autore;
    if (imgPrev && item.imgVol) {
        const imgSrc = item.imgVol.startsWith("data:")
            ? item.imgVol
            : `data:image/jpeg;base64,${item.imgVol}`;

        imgPrev.innerHTML = `
        <img src="${imgSrc}" class="h-full w-full object-cover rounded" alt="Anteprima immagine">
    `;
    }
    if(descrizione) descrizione.value = tagItem.descrizione;

}

async function editProduct(id, tipo, btnElement) {
    const update = document.getElementById("modifyProductModal");
    const nVolume = document.getElementById("productvolNumDivModify");
    const tag = document.getElementById("tagModify");
    update.classList.add('active');
    update.classList.remove('opacity-0', 'invisible');

    const item = JSON.parse(btnElement.dataset.item);

    if(tipo === "prod"){
        console.log(item.prezzo);
        nVolume.classList.add("hidden");
        tag.classList.add("hidden");
        await loadDataProd(item);
        return;
    }
    if(tipo === "vol"){
        const tagItem = JSON.parse(btnElement.dataset.tag);
        nVolume.classList.remove("hidden");
        tag.classList.remove("hidden");
        await loadDataVol(item, tagItem);
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

function renameFileWithSuffix(file, suffix) {
    const dotIndex = file.name.lastIndexOf(".");
    const baseName = dotIndex !== -1 ? file.name.substring(0, dotIndex) : file.name;
    const extension = dotIndex !== -1 ? file.name.substring(dotIndex) : "";
    const newName = baseName + suffix + extension;

    return new File([file], newName, { type: file.type, lastModified: file.lastModified });
}

function paramsAdd() {
    const categoria = document.getElementById("productCategory2");
    const nome = document.getElementById("productName2");
    const numVol = document.getElementById("productvolNum");
    const prezzo = document.getElementById("productPrice2");
    const quantita = document.getElementById("productStock2");
    const tag = document.getElementById("volTag");
    const autore = document.getElementById("autore");
    const img = document.getElementById("imgAdd");
    const descrizione = document.getElementById("productDescription2");

    const params = new FormData();
    params.append("action", "insert");

    const prodotti = [];
    const volumi = [];

    if (categoria.value === "manga") {
        const oggi = new Date();
        const data = `${oggi.getFullYear()}-${(oggi.getMonth() + 1).toString().padStart(2, '0')}-${oggi.getDate().toString().padStart(2, '0')}`;

        prodotti.push({
            idTempVolume: 1,
            nome: nome.value,
            autor: autore.value,
            descrizzione: descrizione.value
        });

        volumi.push({
            idImg: 1,
            idProd: 1,
            numVolume: Number(numVol.value),
            prezzo: Number(prezzo.value),
            quantita: Number(quantita.value),
            datapubl: data,
            tag: tag.value
        });

    } else {
        prodotti.push({
            idImg: 1,
            nome: nome.value,
            quantita: Number(quantita.value),
            prezzo: Number(prezzo.value),
            autor: autore.value,
            descrizzione: descrizione.value
        });
    }

    const json = { prodotti, volumi };
    params.append("json", JSON.stringify(json));
    const originalFile = img.files[0];
    const renamedFile = renameFileWithSuffix(originalFile, "_1");
    params.append("image", renamedFile);
    return params;
}


async function fatchAdd(){
    const formData = paramsAdd();

    try {
        const response = await fetch('admin/manageproduct', {
            method: 'POST',
            body: formData,   // NON impostare Content-Type! Il browser lo fa automaticamente
        });

        const data = await response.json();

        if(data.success !== undefined){
            mostraErrore("prodotto aggiunto con successo");
        }
    } catch (error) {
        mostraErrore("Errore nell'aggiunta");
        console.error('Errore nella fetch:', error);
    }
}

async function fatchModify(){

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

    document.getElementById("addGo").addEventListener("click", function (){
        fatchAdd();
        const modal = document.getElementById('addProductModal');
        modal.classList.remove('active');
        modal.classList.add('opacity-0', 'invisible');
        clearModal("add");
        curentPageProd = 1;
        loadTableProd(curentPageProd);
        loadTableVol(curentPageProd);
    });

    document.getElementById("addGo").addEventListener("click", function (){
        fatchModify();
        const modal = document.getElementById('addProductModal');
        modal.classList.remove('active');
        modal.classList.add('opacity-0', 'invisible');
        clearModal("modify");
        curentPageProd = 1;
        loadTableProd(curentPageProd);
        loadTableVol(curentPageProd);
    });

}