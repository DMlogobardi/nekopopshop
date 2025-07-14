
if (typeof window.APP_CONTEXT_PATH === 'undefined') {
    window.APP_CONTEXT_PATH = '';
    console.warn("APP_CONTEXT_PATH non definito. Assicurati di impostarlo nella JSP.");
}

const pageContext = {
    request: {
        contextPath: window.APP_CONTEXT_PATH
    }
};

document.addEventListener('DOMContentLoaded', function() {
    initSettingsTab();
    loadInitialSettings();
});

function initSettingsTab() {
    const settingsTabBtn = document.getElementById('settings-tab-btn');
    if (!settingsTabBtn) return;

    settingsTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadSettingsContent();
    });
}


function loadInitialSettings() {
    const formData = new URLSearchParams();
    formData.append('action', 'datiUtente'); // Per UtentDataGesture
    formData.append('actionUtent', 'list');  // Per UtentGesture

    fetch(`common/utentdategesture`, {
        method: 'POST',
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: formData,

    })
        .then(response => {
            if (response.status === 422) {
                throw new Error('Accesso non autorizzato. Effettua il login.');
            }
            if (!response.ok) {
                throw new Error(`Errore HTTP: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (data.error) {
                throw new Error(data.error);
            }

            // Estrai i dati dell'utente corrente
            const userId = getLoggedInUserId();
            const userData = Array.isArray(data) ?
                data.find(user => user.idCliente == userId) :
                data;

            if (!userData) {
                throw new Error('Dati utente non trovati');
            }

            // Normalizza i dati per il frontend
            const normalizedData = {
                firstName: data.nome || '',
                lastName: data.cognome || '',
                email: data.email || '',
            };

            localStorage.setItem('userSettings', JSON.stringify(normalizedData));

            if (window.location.hash === '#settings') {
                renderSettingsContent(document.querySelector('.main-content-container'), normalizedData);
            }
        })
        .catch(error => {
            console.error('Error loading settings:', error);
            showErrorNotification(error.message);

            if (error.message.includes('autorizzato') || error.message.includes('accesso')) {
                redirectToLogin();
            }
        });
}

function loadSettingsContent() {
    const mainContent = document.querySelector('.main-content-container') ||
        document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showSettingsLoading(mainContent);

    const savedSettings = localStorage.getItem('userSettings');
    if (savedSettings) {
        renderSettingsContent(mainContent, JSON.parse(savedSettings));
    } else {
        fetchCurrentUserSettings(mainContent);
    }
}



function fetchCurrentUserSettings(container) {
    const params = new URLSearchParams();
    params.append("action", "datiUtente");
    params.append("actionUtent", "list");

    console.log(`Fetching URL: ${pageContext.request.contextPath}/common/utentdatagesture`);

    fetch(`common/utentdategesture`, {
        method: 'POST',
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString(),
        credentials: 'include'
    })
        .then(response => {
            if (!response.ok) throw new Error('Errore nel caricamento delle impostazioni');
            return response.json();
        })
        .then(data => {
            const normalizedData = {
                firstName: data.nome || '',
                lastName: data.cognome || '',
                email: data.email || '',
                phone: data.telefono || '',
                avatar: data.avatar || `${pageContext.request.contextPath}/frontend/Assets/Images/default-avatar.png`
            };

            renderSettingsContent(container, normalizedData);
            localStorage.setItem('userSettings', JSON.stringify(normalizedData));
        })
        .catch(error => {
            console.error('Error:', error);
            showSettingsError(container, error);
        });
}

function showSettingsLoading(container) {
    container.innerHTML = `
        <div class="text-center p-8">
            <div class="inline-block animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekoorange mb-4"></div>
            <p class="text-nekoblue">Caricamento impostazioni...</p>
        </div>
    `;
}

function showSettingsError(container, error) {
    container.innerHTML = `
        <div class="text-center p-8 text-nekopeach">
            <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
            <p>Si è verificato un errore durante il caricamento delle impostazioni.</p>
            <p class="text-sm text-gray-500 mb-4">${error.message}</p>
            <button onclick="loadSettingsContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                Riprova
            </button>
        </div>
    `;
}

function renderSettingsContent(container, userData = {}) {
    const defaultData = {
        firstName: '',
        lastName: '',
        email: '',


    };

    const data = {...defaultData, ...userData};

    container.innerHTML = `
        <div class="tab-content active" id="settings-tab">
            <div class="profile-card bg-white rounded-lg shadow-md overflow-hidden">
                <!-- Header -->
                <div class="bg-gradient-to-r from-nekopeach to-nekopink p-6 ">
                    <h2 class="text-3xl font-bold text-white flex items-center">
                        <i class="fas fa-user-cog mr-3"></i> Impostazioni Account
                    </h2>
                </div>

                <!-- Form Impostazioni -->
                <div class="p-6">
                    <form id="settings-form">
                        <input type="hidden" name="action" value="datiUtente">
                        <input type="hidden" name="actionUtent" value="update">
                        
                        <!-- Sezione Informazioni Personali -->
                        <div class="mb-8">
                            <h3 class="text-lg font-bold text-nekoorange mb-4 flex items-center">
                                <i class="fas fa-user-circle mr-2"></i> Informazioni Personali
                            </h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                       

                                <!-- Nome -->
                                <div class="form-group">
                                    <label for="settings-firstname" class="block text-sm font-medium text-gray-700 mb-1">Nome</label>
                                    <input type="text" id="settings-firstname" name="nome" 
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-nekoblue focus:border-transparent" 
                                           value="${data.firstName}" required>
                                </div>

                                <!-- Cognome -->
                                <div class="form-group">
                                    <label for="settings-lastname" class="block text-sm font-medium text-gray-700 mb-1">Cognome</label>
                                    <input type="text" id="settings-lastname" name="cognome"
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-nekoblue focus:border-transparent" 
                                           value="${data.lastName}" required>
                                </div>
                            </div>
                        </div>

                        <!-- Sezione Contatti -->
                        <div class="mb-8">
                            <h3 class="text-lg font-bold text-nekoorange mb-4 flex items-center">
                                <i class="fas fa-envelope mr-2"></i> Informazioni di Contatto
                            </h3>
                            
                            <div class="grid grid-cols-1 gap-6">
                                <!-- Email -->
                                <div class="form-group">
                                    <label for="settings-email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                                    <div class="relative">
                                        <input type="email" id="settings-email" name="email"
                                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-nekoblue focus:border-transparent pr-16" 
                                               value="${data.email}" required>
                                        <span class="absolute right-3 top-2 bg-green-100 text-green-800 text-xs px-2 py-1 rounded">Verificata</span>
                                    </div>
                                </div>

                             
                            </div>
                        </div>

                        <!-- Bottoni Azione -->
                        <div class="flex flex-col sm:flex-row justify-end gap-4 mt-8">
                            <button type="button" id="cancel-settings" 
                                    class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                                Annulla
                            </button>
                            <button type="button" id="save-settings"
                                    class="px-6 py-2 bg-nekoorange text-white rounded-lg hover:bg-nekoblue-dark transition">
                                Salva Modifiche
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    `;
    document.getElementById('save-settings').addEventListener('click', () => {
        updateSettings()
    });

    document.getElementById('cancel-settings').addEventListener('click', () => {
        renderSettingsContent(container, userData);
    });

    setupSettingsEventHandlers();
}

function updateSettings(){
    const params = new URLSearchParams();
    params.append("action", "datiUtente");
    params.append("actionUtent", "update");
    const data={
        nome: document.getElementById("settings-firstname").value,
        cognome: document.getElementById("settings-lastname").value,
        email: document.getElementById("settings-email").value
    }
    params.append("json", JSON.stringify(data))
    fetch(`common/utentdategesture`, {
        method: 'POST',
        body: params.toString(),
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        credentials: 'include'
    }).then(response=>{
        if(!response.ok){
            throw new Error('Errore durante il salvataggio')
        }
        return response.json()
    }).then(data=>{
        if(data.error){
            throw new Error(data.error)
        }
        showNotification('Impostazioni salvate con successo!')
        loadSettingsContent()
    })

}

function setupSettingsEventHandlers() {
    // Gestione upload avatar
    const avatarUpload = document.getElementById('settings-avatar-upload');
    if (avatarUpload) {
        avatarUpload.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    const avatarPreview = document.querySelector('.avatar-preview');
                    if (avatarPreview) {
                        avatarPreview.style.backgroundImage = `url('${event.target.result}')`;
                    }
                };
                reader.readAsDataURL(file);
            }
        });
    }

    // Gestione form
    const settingsForm = document.getElementById('settings-form');
    if (settingsForm) {
        settingsForm.addEventListener('submit', function(e) {
            e.preventDefault();
            saveSettings();
        });
    }

    // Bottone annulla
    const cancelBtn = document.getElementById('cancel-settings');
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function() {
            loadSettingsContent();
        });
    }
}

function saveSettings() {
    const form = document.getElementById('settings-form');
    if (!form) return;

    const formData = new FormData(form);
    const userId = getLoggedInUserId();

    // Aggiungi l'ID utente e i campi nel formato corretto per il backend
    formData.append('idCliente', userId);

    // Crea l'oggetto JSON per l'update
    const userData = {
        nome: formData.get('nome'),
        cognome: formData.get('cognome'),
        telefono: formData.get('telefono'),
        email: formData.get('email')
    };

    // Se c'è un nuovo avatar, aggiungilo
    const avatarFile = document.getElementById('settings-avatar-upload').files[0];
    if (avatarFile) {
        formData.append('avatarFile', avatarFile);
    } else {
        formData.append('avatar', formData.get('avatar'));
    }

    // Aggiungi il JSON come parametro
    formData.append('json', JSON.stringify(userData));

    showNotification('Salvataggio in corso...', 'info');

    fetch(`${pageContext.request.contextPath}/common/utentdategesture`, {
        method: 'POST',
        body: formData,
        credentials: 'include'
    })
        .then(response => {
            if (response.status === 422) {
                throw new Error('Accesso non autorizzato durante il salvataggio');
            }
            if (!response.ok) {
                throw new Error('Errore durante il salvataggio');
            }
            return response.json();
        })
        .then(data => {
            if (data.error) {
                throw new Error(data.error);
            }
            showNotification('Impostazioni salvate con successo!', 'success');

            // Aggiorna i dati in localStorage
            const currentSettings = JSON.parse(localStorage.getItem('userSettings') || {});
            const updatedSettings = {
                ...currentSettings,
                firstName: userData.nome,
                lastName: userData.cognome,
                phone: userData.telefono
            };

            if (data.avatar) {
                updatedSettings.avatar = data.avatar;
            }

            localStorage.setItem('userSettings', JSON.stringify(updatedSettings));
        })
        .catch(error => {
            console.error('Error saving settings:', error);
            showNotification(error.message || 'Errore durante il salvataggio', 'error');
        });
}

// Funzioni di utilità
function getLoggedInUserId() {
    return parseInt(localStorage.getItem('userId')) || 0;
}


function redirectToLogin() {
    window.location.href = `${pageContext.request.contextPath}/login.jsp?redirect=${encodeURIComponent(window.location.pathname + window.location.hash)}`;
}

function showNotification(message, type = 'info') {
    const colors = {
        info: 'bg-blue-100 text-blue-800',
        success: 'bg-green-100 text-green-800',
        error: 'bg-red-100 text-red-800',
        warning: 'bg-yellow-100 text-yellow-800'
    };

    const notification = document.createElement('div');
    notification.className = `fixed top-4 right-4 px-6 py-3 rounded-lg shadow-lg ${colors[type]} z-50`;
    notification.innerHTML = `
        <div class="flex items-center">
            <i class="fas ${type === 'success' ? 'fa-check-circle' : type === 'error' ? 'fa-times-circle' : 'fa-info-circle'} mr-2"></i>
            <span>${message}</span>
        </div>
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.classList.add('opacity-0', 'transition-opacity', 'duration-500');
        setTimeout(() => notification.remove(), 500);
    }, 5000);
}

// Stili aggiuntivi
function addSettingsStyles() {
    if (document.getElementById('settings-styles')) return;

    const style = document.createElement('style');
    style.id = 'settings-styles';
    style.textContent = `
        .avatar-upload {
            position: relative;
            max-width: 128px;
            margin: 0 auto;
        }
        .avatar-preview {
            width: 128px;
            height: 128px;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            border: 3px solid #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .avatar-edit {
            position: absolute;
            right: 5px;
            bottom: 5px;
        }
        .avatar-edit input {
            display: none;
        }
        .avatar-edit label {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .avatar-edit label:hover {
            transform: scale(1.1);
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        #settings-notification {
            transition: all 0.3s ease;
        }
    `;
    document.head.appendChild(style);
}

// Inizializza gli stili al caricamento
addSettingsStyles();