document.addEventListener('DOMContentLoaded', function() {
    // Carica il contenuto degli indirizzi quando si clicca sul tab
    document.getElementById('addresses-tab-btn').addEventListener('click', function() {
        loadAddressesContent();
    });
});

function loadAddressesContent() {
    const addressesTab = document.getElementById('addresses-tab');

    // Se il contenuto è già stato caricato, non fare nulla
    if (addressesTab.dataset.loaded === 'true') return;

    // Mostra un loader durante il caricamento
    addressesTab.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopeach"></div>
        </div>
    `;

    // Inietta gli stili CSS necessari
    injectAddressesStyles();

    // Simuliamo il caricamento del contenuto (nella realtà sarebbe una chiamata AJAX)
    setTimeout(() => {
        // Carica il contenuto HTML
        addressesTab.innerHTML = getAddressesHTMLContent();

        // Imposta il flag che indica che il contenuto è stato caricato
        addressesTab.dataset.loaded = 'true';

        // Inizializza le funzionalità degli indirizzi
        initAddressesFunctionality();
    }, 800);
}



function getAddressesHTMLContent() {
    return `
        <div class="profile-card bg-white border-2 border-nekopeach">
            <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
                <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                    <i class="fas fa-map-marked-alt mr-3"></i> I tuoi Indirizzi di Spedizione
                </h2>
            </div>

            <div class="p-6">
                <!-- Tabs Navigation -->
                <div class="flex mb-6">
                    <div class="form-tab active" onclick="openAddressTab('indirizzi-salvati')">
                        <i class="fas fa-heart mr-2"></i> Indirizzi Salvati
                    </div>
                    <div class="form-tab ml-2" onclick="openAddressTab('aggiungi-indirizzo')">
                        <i class="fas fa-plus mr-2"></i> Aggiungi Indirizzo
                    </div>
                </div>

                <!-- Saved Addresses -->
                <div id="indirizzi-salvati" class="form-tab-content active">
                    <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                        <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-info-circle mr-2"></i> Gestisci i tuoi indirizzi di spedizione</h4>
                        <p class="text-sm text-gray-700">
                            Qui puoi gestire tutti gli indirizzi dove desideri ricevere i tuoi acquisti. Puoi aggiungere nuovi indirizzi,
                            modificare quelli esistenti o impostarne uno come predefinito per un checkout più rapido.
                        </p>
                    </div>

                    <!-- Address List -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Default Address -->
                        <div class="address-card bg-white p-6 default">
                            <div class="flex items-start mb-4">
                                <div class="bg-nekopink w-10 h-10 rounded-full flex items-center justify-center mr-4">
                                    <i class="fas fa-home text-nekopeach"></i>
                                </div>
                                <div>
                                    <h4 class="font-bold text-lg text-gray-800 flex items-center">
                                        Casa <span class="address-badge ml-2">Predefinito</span>
                                    </h4>
                                    <p class="text-sm text-gray-600">Davide Rossi</p>
                                </div>
                            </div>
                            <div class="mb-4">
                                <p class="text-gray-800">
                                    Via del Colosseo 12<br>
                                    00184 Roma RM<br>
                                    Italia
                                </p>
                            </div>
                            <div class="text-sm">
                                <p class="text-gray-600 mb-2">
                                    <i class="fas fa-phone-alt mr-2"></i> +39 123 4567890
                                </p>
                                <p class="text-gray-600">
                                    <i class="fas fa-envelope mr-2"></i> davide.rossi@example.com
                                </p>
                            </div>
                            <div class="flex justify-end mt-4 space-x-2">
                                <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>

                        <!-- Office Address -->
                        <div class="address-card bg-white p-6">
                            <div class="flex items-start mb-4">
                                <div class="bg-nekopink w-10 h-10 rounded-full flex items-center justify-center mr-4">
                                    <i class="fas fa-building text-nekopeach"></i>
                                </div>
                                <div>
                                    <h4 class="font-bold text-lg text-gray-800">Ufficio</h4>
                                    <p class="text-sm text-gray-600">Davide Rossi</p>
                                </div>
                            </div>
                            <div class="mb-4">
                                <p class="text-gray-800">
                                    Via del Corso 123<br>
                                    00186 Roma RM<br>
                                    Italia
                                </p>
                            </div>
                            <div class="text-sm">
                                <p class="text-gray-600 mb-2">
                                    <i class="fas fa-phone-alt mr-2"></i> +39 123 4567891
                                </p>
                                <p class="text-gray-600">
                                    <i class="fas fa-envelope mr-2"></i> davide.rossi@azienda.com
                                </p>
                            </div>
                            <div class="flex justify-end mt-4 space-x-2">
                                <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                                <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                                    <i class="fas fa-star"></i>
                                </button>
                            </div>
                        </div>

                        <!-- Parent's Address -->
                        <div class="address-card bg-white p-6">
                            <div class="flex items-start mb-4">
                                <div class="bg-nekopink w-10 h-10 rounded-full flex items-center justify-center mr-4">
                                    <i class="fas fa-users text-nekopeach"></i>
                                </div>
                                <div>
                                    <h4 class="font-bold text-lg text-gray-800">Casa dei Genitori</h4>
                                    <p class="text-sm text-gray-600">Famiglia Rossi</p>
                                </div>
                            </div>
                            <div class="mb-4">
                                <p class="text-gray-800">
                                    Viale Europa 42<br>
                                    00144 Roma RM<br>
                                    Italia
                                </p>
                            </div>
                            <div class="text-sm">
                                <p class="text-gray-600 mb-2">
                                    <i class="fas fa-phone-alt mr-2"></i> +39 123 4567892
                                </p>
                                <p class="text-gray-600">
                                    <i class="fas fa-envelope mr-2"></i> rossi.famiglia@example.com
                                </p>
                            </div>
                            <div class="flex justify-end mt-4 space-x-2">
                                <button class="text-nekopeach hover:text-nekored transition" title="Modifica">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="text-gray-500 hover:text-gray-700 transition" title="Rimuovi">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                                <button class="text-blue-500 hover:text-blue-700 transition" title="Imposta come predefinito">
                                    <i class="fas fa-star"></i>
                                </button>
                            </div>
                        </div>

                        <!-- Add New Address -->
                        <div class="address-card bg-nekopink/20 border-dashed border-2 border-nekopeach flex items-center justify-center min-h-full cursor-pointer hover:bg-nekopink/30 transition" onclick="openAddressTab('aggiungi-indirizzo')">
                            <div class="text-center p-6">
                                <div class="w-12 h-12 rounded-full bg-nekopeach flex items-center justify-center mx-auto mb-4">
                                    <i class="fas fa-plus text-white text-xl"></i>
                                </div>
                                <h4 class="font-bold text-nekopeach">Aggiungi Nuovo Indirizzo</h4>
                                <p class="text-sm text-gray-600 mt-1">Crea un nuovo indirizzo di spedizione</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Address Form -->
                <div id="aggiungi-indirizzo" class="form-tab-content">
                    <form id="addAddressForm" method="post" action="AddAddressServlet">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <!-- Map Preview -->
                            <div class="map-container">
                                <i class="fas fa-map-marked-alt text-3xl text-gray-300"></i>
                                <p class="ml-3">Anteprima mappa</p>
                                <div class="map-overlay"></div>
                            </div>

                            <!-- Address Form -->
                            <div>
                                <div class="mb-4">
                                    <h4 class="font-bold text-lg text-gray-800 mb-2">Etichetta Indirizzo</h4>
                                    <p class="text-sm text-gray-600 mb-3">Assegna un nome a questo indirizzo per riconoscerlo facilmente (es. Casa, Ufficio)</p>
                                    <div class="flex flex-wrap gap-2">
                                        <button type="button" class="address-label-btn px-4 py-2 rounded-full border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white transition" data-label="Casa">Casa</button>
                                        <button type="button" class="address-label-btn px-4 py-2 rounded-full border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white transition" data-label="Ufficio">Ufficio</button>
                                        <button type="button" class="address-label-btn px-4 py-2 rounded-full border border-nekopeach text-nekopeach hover:bg-nekopeach hover:text-white transition" data-label="Genitori">Genitori</button>
                                    </div>
                                </div>

                                <div class="input-group">
                                    <label for="address-label">Etichetta Personalizzata</label>
                                    <input type="text" id="address-label" name="address-label" placeholder="Come vuoi chiamare questo indirizzo?">
                                </div>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="input-group">
                                <label for="full-name">Nome Completo</label>
                                <input type="text" id="full-name" name="full-name" placeholder="Nome e Cognome">
                            </div>

                            <div class="input-group">
                                <label for="phone">Telefono</label>
                                <input type="tel" id="phone" name="phone" placeholder="+39 123 4567890">
                            </div>

                            <div class="input-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" placeholder="tua@email.com">
                            </div>

                            <div class="input-group">
                                <label for="company">Società (opzionale)</label>
                                <input type="text" id="company" name="company" placeholder="Nome azienda">
                            </div>

                            <div class="input-group">
                                <label for="address">Indirizzo</label>
                                <input type="text" id="address" name="address" placeholder="Via e numero civico">
                            </div>

                            <div class="input-group">
                                <label for="address2">Indirizzo 2 (opzionale)</label>
                                <input type="text" id="address2" name="address2" placeholder="Appartamento, piano, etc.">
                            </div>

                            <div class="input-group">
                                <label for="city">Città</label>
                                <input type="text" id="city" name="city" placeholder="Città">
                            </div>

                            <div class="input-group">
                                <label for="zip-code">CAP</label>
                                <input type="text" id="zip-code" name="zip-code" placeholder="Codice Postale">
                            </div>

                            <div class="input-group">
                                <label for="province">Provincia</label>
                                <input type="text" id="province" name="province" placeholder="Sigla Provincia">
                            </div>

                            <div class="input-group-select">
                                <label for="country">Nazione</label>
                                <select id="country" name="country">
                                    <option value="">Seleziona Nazione</option>
                                    <option value="IT" selected>Italia</option>
                                    <option value="DE">Germania</option>
                                    <option value="FR">Francia</option>
                                    <option value="ES">Spagna</option>
                                    <option value="UK">Regno Unito</option>
                                    <option value="US">Stati Uniti</option>
                                </select>
                            </div>
                        </div>

                        <div class="flex items-center mb-6 mt-6">
                            <input type="checkbox" id="default-address" name="default-address" class="rounded border-nekopeach text-nekopeach focus:ring-nekopeach">
                            <label for="default-address" class="ml-2 block text-sm text-gray-700">
                                Imposta come indirizzo di spedizione predefinito
                            </label>
                        </div>

                        <div class="flex justify-end mt-6">
                            <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                                Annulla
                            </button>
                            <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                                <i class="fas fa-plus mr-2"></i> Aggiungi Indirizzo
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    `;
}
function injectAddressesStyles() {
    // Crea un elemento style solo se non esiste già
    if (!document.getElementById('addresses-styles')) {
        const styleElement = document.createElement('style');
        styleElement.id = 'addresses-styles';
        styleElement.textContent = `
            .address-card {
                transition: all 0.3s ease;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 3px 10px rgba(0,0,0,0.1);
                position: relative;
                border: 2px solid #f2d5bb;
            }

            .address-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(229, 84, 88, 0.2);
                border-color: #E55458;
            }

            .address-card.default::after {
                content: 'Predefinito';
                position: absolute;
                top: 15px;
                right: -30px;
                background-color: #E55458;
                color: white;
                padding: 3px 30px;
                transform: rotate(45deg);
                font-size: 12px;
                font-weight: bold;
            }

            .input-group {
                position: relative;
                margin-bottom: 1.5rem;
            }

            .input-group input, .input-group textarea {
                width: 100%;
                padding: 0.75rem;
                border: 2px solid #f2d5bb;
                border-radius: 10px;
                background-color: #fff;
                transition: all 0.3s ease;
            }

            .input-group input:focus, .input-group textarea:focus {
                border-color: #E55458;
                box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.2);
                outline: none;
            }

            .input-group label {
                position: absolute;
                left: 0.75rem;
                top: -0.75rem;
                padding: 0 0.25rem;
                background-color: white;
                color: #E55458;
                font-size: 0.8rem;
                font-weight: bold;
            }

            .input-group-select {
                position: relative;
                margin-bottom: 1.5rem;
            }

            .input-group-select select {
                width: 100%;
                padding: 0.75rem;
                border: 2px solid #f2d5bb;
                border-radius: 10px;
                background-color: #fff;
                transition: all 0.3s ease;
                appearance: none;
            }

            .input-group-select select:focus {
                border-color: #E55458;
                box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.2);
                outline: none;
            }

            .input-group-select label {
                position: absolute;
                left: 0.75rem;
                top: -0.75rem;
                padding: 0 0.25rem;
                background-color: white;
                color: #E55458;
                font-size: 0.8rem;
                font-weight: bold;
            }

            .input-group-select::after {
                content: '\\f078';
                font-family: 'Font Awesome 6 Free';
                font-weight: 900;
                color: #E55458;
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                pointer-events: none;
            }

            .form-tab {
                padding: 0.75rem 1.5rem;
                border-radius: 10px 10px 0 0;
                background-color: #f2d5bb;
                color: #E55458;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .form-tab.active {
                background-color: #E55458;
                color: white;
            }

            .form-tab-content {
                display: none;
            }

            .form-tab-content.active {
                display: block;
                animation: fadeIn 0.5s ease;
            }

            .address-method-item {
                transition: all 0.3s ease;
                border: 2px solid #f2d5bb;
                border-radius: 10px;
                padding: 15px;
                position: relative;
                overflow: hidden;
            }

            .address-method-item:hover {
                border-color: #E55458;
                transform: translateY(-3px);
            }

            .address-method-item .address-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #f2d5bb;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #E55458;
                font-size: 20px;
                margin-right: 15px;
            }

            .address-method-default-badge {
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: #E55458;
                color: white;
                padding: 2px 8px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: bold;
            }

            .address-badge {
                display: inline-block;
                padding: 2px 8px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: bold;
                background-color: #f2d5bb;
                color: #E55458;
                margin-right: 5px;
            }

            .map-container {
                height: 200px;
                background-color: #f5f5f5;
                border: 2px dashed #f2d5bb;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #888;
                font-size: 14px;
                position: relative;
                overflow: hidden;
            }

            .map-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(to bottom, rgba(229,84,88,0.2), transparent);
                pointer-events: none;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }
        `;

        // Aggiungi gli stili al head del documento
        document.head.appendChild(styleElement);
    }
}

function initAddressesFunctionality() {
    // Funzione per cambiare tab
    window.openAddressTab = function(tabName) {
        const tabs = document.querySelectorAll('.form-tab');
        const tabContents = document.querySelectorAll('.form-tab-content');

        tabs.forEach(tab => tab.classList.remove('active'));
        tabContents.forEach(content => content.classList.remove('active'));

        event.currentTarget.classList.add('active');
        document.getElementById(tabName).classList.add('active');

        // Scroll to form
        if (tabName !== 'indirizzi-salvati') {
            document.getElementById(tabName).scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    };

    // Set address label from buttons
    document.querySelectorAll('.address-label-btn').forEach(button => {
        button.addEventListener('click', function() {
            document.getElementById('address-label').value = this.dataset.label;
        });
    });

    // Form validation
    document.getElementById('addAddressForm').addEventListener('submit', function(e) {
        const fullName = document.getElementById('full-name').value;
        const phone = document.getElementById('phone').value;
        const address = document.getElementById('address').value;
        const city = document.getElementById('city').value;
        const zipCode = document.getElementById('zip-code').value;
        const country = document.getElementById('country').value;

        if (!fullName) {
            alert('Inserisci il tuo nome completo');
            e.preventDefault();
            return;
        }

        if (!phone) {
            alert('Inserisci un numero di telefono valido');
            e.preventDefault();
            return;
        }

        if (!address) {
            alert('Inserisci un indirizzo valido');
            e.preventDefault();
            return;
        }

        if (!city) {
            alert('Inserisci una città');
            e.preventDefault();
            return;
        }

        if (!zipCode) {
            alert('Inserisci un codice postale');
            e.preventDefault();
            return;
        }

        if (!country) {
            alert('Seleziona una nazione');
            e.preventDefault();
            return;
        }
    });

    // Auto-fill province from zip code (example for Italy)
    document.getElementById('zip-code').addEventListener('blur', function() {
        if (document.getElementById('country').value === 'IT' &&
            this.value.length === 5 &&
            !isNaN(this.value)) {
            // Simple mapping of some Italian CAP to provinces
            const capToProvince = {
                '00100': 'RM', // Rome
                '20100': 'MI', // Milan
                '50100': 'FI', // Florence
                '40100': 'BO', // Bologna
                '16100': 'GE', // Genoa
                '10100': 'TO', // Turin
                '80100': 'NA', // Naples
                '35100': 'PD', // Padua
                '34100': 'TS', // Trieste
                '38100': 'TN'  // Trento
            };

            const province = capToProvince[this.value];
            if (province) {
                document.getElementById('province').value = province;
            }
        }
    });
}