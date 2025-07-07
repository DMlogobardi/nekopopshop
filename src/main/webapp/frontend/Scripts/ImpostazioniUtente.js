// frontend/Scripts/ImpostazioniUtente.js

document.addEventListener('DOMContentLoaded', function() {
    initSettingsTab();
});

function initSettingsTab() {
    const settingsTabBtn = document.getElementById('settings-tab-btn');
    if (!settingsTabBtn) return;

    settingsTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadSettingsContent();
    });
}

function loadSettingsContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showSettingsLoading(mainContent);

    // Simula chiamata AJAX (sostituisci con chiamata reale)
    setTimeout(() => {
        renderSettingsContent(mainContent);
    }, 800);
}

function showSettingsLoading(container) {
    container.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopink"></div>
            <span class="ml-3 text-nekopeach">Caricamento impostazioni...</span>
        </div>
    `;
}

function renderSettingsContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="settings-tab">
            <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
                <!-- Header -->
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-user-cog mr-3"></i> Impostazioni Account
                    </h2>
                </div>

                <!-- Form Impostazioni -->
                <div class="p-6">
                    <form id="settings-form">
                        <!-- Sezione Informazioni Personali -->
                        <div class="mb-8">
                            <h3 class="text-lg font-bold text-nekopeach mb-4 flex items-center">
                                <i class="fas fa-user-circle mr-2"></i> Informazioni Personali
                            </h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Avatar Upload -->
                                <div class="md:col-span-2 flex flex-col items-center">
                                    <div class="avatar-upload mb-4">
                                        <div class="avatar-preview" id="settings-avatar-preview" 
                                             style="background-image: url('https://randomuser.me/api/portraits/women/44.jpg')">
                                        </div>
                                        <div class="avatar-edit">
                                            <input type="file" id="settings-avatar-upload" accept=".png, .jpg, .jpeg">
                                            <label for="settings-avatar-upload"><i class="fas fa-camera"></i></label>
                                        </div>
                                    </div>
                                    <p class="text-sm text-gray-500">Clicca sull'icona per cambiare l'avatar</p>
                                </div>

                                <!-- Nome -->
                                <div class="relative">
                                    <input type="text" id="settings-firstname" class="form-input w-full px-4 py-3 rounded-lg" 
                                           value="Marika" required>
                                    <label for="settings-firstname" class="form-label">Nome</label>
                                </div>

                                <!-- Cognome -->
                                <div class="relative">
                                    <input type="text" id="settings-lastname" class="form-input w-full px-4 py-3 rounded-lg" 
                                           value="Rossi" required>
                                    <label for="settings-lastname" class="form-label">Cognome</label>
                                </div>
                            </div>
                        </div>

                        <!-- Sezione Contatti -->
                        <div class="mb-8">
                            <h3 class="text-lg font-bold text-nekopeach mb-4 flex items-center">
                                <i class="fas fa-envelope mr-2"></i> Informazioni di Contatto
                            </h3>
                            
                            <div class="grid grid-cols-1 gap-6">
                                <!-- Email -->
                                <div class="relative">
                                    <input type="email" id="settings-email" class="form-input w-full px-4 py-3 rounded-lg" 
                                           value="marika.rossi@example.com" required>
                                    <label for="settings-email" class="form-label">Email</label>
                                    <div class="absolute right-4 top-4">
                                        <span class="verification-badge">Verificata</span>
                                    </div>
                                </div>

                                <!-- Telefono -->
                                <div class="relative">
                                    <input type="tel" id="settings-phone" class="form-input w-full px-4 py-3 rounded-lg" 
                                           value="+39 1234567890">
                                    <label for="settings-phone" class="form-label">Telefono</label>
                                </div>
                            </div>
                        </div>

                        <!-- Sezione Preferenze -->
                        <div class="mb-8">
                            <h3 class="text-lg font-bold text-nekopeach mb-4 flex items-center">
                                <i class="fas fa-sliders-h mr-2"></i> Preferenze
                            </h3>
                            
                            <div class="space-y-4">
                                <!-- Notifiche Email -->
                                <div class="flex items-center justify-between">
                                    <div>
                                        <h4 class="font-medium text-gray-800">Notifiche Email</h4>
                                        <p class="text-sm text-gray-500">Ricevi aggiornamenti e offerte speciali</p>
                                    </div>
                                    <label class="toggle-switch">
                                        <input type="checkbox" checked>
                                        <span class="toggle-slider"></span>
                                    </label>
                                </div>

                                <!-- Newsletter -->
                                <div class="flex items-center justify-between">
                                    <div>
                                        <h4 class="font-medium text-gray-800">Iscrizione Newsletter</h4>
                                        <p class="text-sm text-gray-500">Novità e promozioni settimanali</p>
                                    </div>
                                    <label class="toggle-switch">
                                        <input type="checkbox">
                                        <span class="toggle-slider"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Bottoni Azione -->
                        <div class="flex flex-col sm:flex-row justify-end gap-4 mt-8">
                            <button type="button" id="cancel-settings" 
                                    class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-6 py-2 rounded-lg transition">
                                Annulla
                            </button>
                            <button type="submit" 
                                    class="bg-nekoorange hover:bg-nekored text-white px-6 py-2 rounded-lg transition">
                                Salva Modifiche
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    `;

    // Aggiungi gestori eventi
    setupSettingsEventHandlers();
    addSettingsStyles();
}

function setupSettingsEventHandlers() {
    // Gestione upload avatar
    const avatarUpload = document.getElementById('settings-avatar-upload');
    if (avatarUpload) {
        avatarUpload.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('settings-avatar-preview');
                    preview.style.backgroundImage = `url('${e.target.result}')`;
                }
                reader.readAsDataURL(file);
            }
        });
    }

    // Gestione annullamento
    const cancelBtn = document.getElementById('cancel-settings');
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function() {
            // Qui puoi reindirizzare alla dashboard o ricaricare i dati originali
            window.location.reload();
        });
    }

    // Gestione submit form
    const settingsForm = document.getElementById('settings-form');
    if (settingsForm) {
        settingsForm.addEventListener('submit', function(e) {
            e.preventDefault();
            saveSettings();
        });
    }
}

function saveSettings() {
    // Simula salvataggio (sostituisci con chiamata AJAX reale)
    console.log('Salvataggio impostazioni...');

    // Mostra notifica
    showNotification('Impostazioni salvate con successo!', 'success');
}

function showNotification(message, type) {
    const notification = document.createElement('div');
    notification.className = `fixed top-4 right-4 z-50 px-6 py-3 rounded-lg shadow-lg text-white ${
        type === 'success' ? 'bg-green-500' : 'bg-red-500'
    }`;
    notification.innerHTML = `
        <div class="flex items-center">
            <i class="fas ${type === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'} mr-2"></i>
            <span>${message}</span>
        </div>
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.classList.add('opacity-0', 'transition-opacity', 'duration-500');
        setTimeout(() => notification.remove(), 500);
    }, 3000);
}

function addSettingsStyles() {
    if (document.getElementById('settings-styles')) return;

    const style = document.createElement('style');
    style.id = 'settings-styles';
    style.textContent = `
        /* Stili specifici per la pagina impostazioni */
        .form-input {
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
        }
        
        .form-input:focus {
            border-color: #E55458;
            box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.2);
        }
        
        .form-label {
            position: absolute;
            left: 1rem;
            top: -0.5rem;
            background-color: white;
            padding: 0 0.25rem;
            font-size: 0.75rem;
            color: #718096;
            transition: all 0.3s ease;
        }
        
        .verification-badge {
            background: linear-gradient(90deg, #4CAF50, #8BC34A);
            color: white;
            font-size: 0.75rem;
            padding: 0.125rem 0.5rem;
            border-radius: 9999px;
        }
        
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }
        
        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 24px;
        }
        
        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .toggle-slider {
            background: linear-gradient(90deg, #E55458, #F29966);
        }
        
        input:checked + .toggle-slider:before {
            transform: translateX(26px);
        }
    `;
    document.head.appendChild(style);
}

// Versione con AJAX reale
/*
function loadSettingsContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showSettingsLoading(mainContent);

    fetch('${pageContext.request.contextPath}/getUserSettings')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.text();
        })
        .then(html => {
            mainContent.innerHTML = html;
            setupSettingsEventHandlers();
            addSettingsStyles();
        })
        .catch(error => {
            mainContent.innerHTML = `
                <div class="text-center p-8 text-nekopeach">
                    <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                    <p>Si è verificato un errore durante il caricamento delle impostazioni.</p>
                    <button onclick="loadSettingsContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                        Riprova
                    </button>
                </div>
            `;
            console.error('Error loading settings:', error);
        });
}

function saveSettings() {
    const formData = new FormData(document.getElementById('settings-form'));
    
    fetch('${pageContext.request.contextPath}/saveUserSettings', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) throw new Error('Salvataggio fallito');
        return response.json();
    })
    .then(data => {
        showNotification('Impostazioni salvate con successo!', 'success');
    })
    .catch(error => {
        showNotification('Errore durante il salvataggio', 'error');
        console.error('Error:', error);
    });
}
*/