
if (typeof window.APP_CONTEXT_PATH === 'undefined') {
    window.APP_CONTEXT_PATH = '';
    console.warn("APP_CONTEXT_PATH non definito. Assicurati di impostarlo nella JSP.");
}

(function() {
    const pageContext = {
        request: {
            contextPath: window.APP_CONTEXT_PATH
        }
    };
    // Il resto del tuo codice che utilizza pageContext
    document.addEventListener('DOMContentLoaded', function() {
        initSecurityTab();
        loadInitialSecuritySettings();
    });

    function initSecurityTab() {
        const securityTabBtn = document.getElementById('security-tab-btn');
        if (!securityTabBtn) return;

        securityTabBtn.addEventListener('click', function(e) {
            e.preventDefault();
            loadSecurityContent();
        });
    }

    function loadInitialSecuritySettings() {
        // Carica lo stato iniziale della sicurezza (es. stato 2FA)
        fetch(`${pageContext.request.contextPath}/common/utentgesture`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'action=getSecuritySettings'
        })
            .then(response => {
                if (!response.ok) throw new Error('Errore nel caricamento delle impostazioni di sicurezza');
                return response.json();
            })
            .then(data => {
                localStorage.setItem('securitySettings', JSON.stringify(data));
            })
            .catch(error => {
                console.error('Error loading security settings:', error);
            });
    }


    function loadSecurityContent() {
        const mainContent = document.querySelector('.lg\\:col-span-3');
        if (!mainContent) return;

        showSecurityLoading(mainContent);

        // Carica i dati dallo storage locale o dal backend
        const savedSettings = localStorage.getItem('securitySettings');
        if (savedSettings) {
            renderSecurityContent(mainContent, JSON.parse(savedSettings));
        } else {
            fetchSecuritySettingsFromBackend(mainContent);
        }
    }

    function showSecurityLoading(container) {
        container.innerHTML = '<div class="loading">Caricamento in corso...</div>';
    }

    function fetchSecuritySettingsFromBackend(container) {
        fetch(`${pageContext.request.contextPath}/common/utentgesture`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'action=getSecuritySettings'
        })
            .then(response => {
                if (!response.ok) throw new Error('Errore nel caricamento delle impostazioni di sicurezza');
                return response.json();
            })
            .then(data => {
                renderSecurityContent(container, data);
                localStorage.setItem('securitySettings', JSON.stringify(data));
            })
            .catch(error => {
                console.error('Error:', error);
                container.innerHTML = `
            <div class="text-center p-8 text-nekopeach">
                <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                <p>Si è verificato un errore durante il caricamento delle impostazioni di sicurezza.</p>
                <button onclick="loadSecurityContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                    Riprova
                </button>
            </div>
        `;
            });
    }

    function renderSecurityContent(container, securityData = {}) {
        // Dati di default
        const defaultData = {
            currentEmail: 'utente@example.com',
            is2FAEnabled: false,
            // Altri campi necessari
        };

        const data = {...defaultData, ...securityData};

        container.innerHTML = `
        <div class="tab-content active" id="security-tab">
            <!-- ... (mantieni la stessa struttura HTML) ... -->
            
            <!-- Modifica i form per usare i dati reali -->
            <form id="passwordChangeForm">
                <input type="hidden" name="action" value="changePassword">
                <!-- ... altri campi ... -->
            </form>
            
            <form id="emailChangeForm">
                <input type="hidden" name="action" value="changeEmail">
                <input type="email" id="current-email" value="${data.currentEmail}" readonly>
                <!-- ... altri campi ... -->
            </form>
            
            <!-- 2FA Status -->
            <span id="2fa-status">${data.is2FAEnabled ? 'Attivata' : 'Disattivata'}</span>
            <input type="checkbox" id="2fa-toggle" ${data.is2FAEnabled ? 'checked' : ''}>
            
            <!-- ... resto del codice ... -->
        </div>
    `;

        setupSecurityEventHandlers();
        addSecurityStyles();
    }

    function setupSecurityEventHandlers() {
        // Gestione cambio password
        document.getElementById('passwordChangeForm')?.addEventListener('submit', function(e) {
            e.preventDefault();
            changePassword(this);
        });

        // Gestione cambio email
        document.getElementById('emailChangeForm')?.addEventListener('submit', function(e) {
            e.preventDefault();
            changeEmail(this);
        });

        // Gestione 2FA
        document.getElementById('2fa-toggle')?.addEventListener('change', function() {
            toggle2FA(this.checked);
        });

        // ... (mantieni le altre funzioni di utilità come togglePassword, ecc.)
    }

    function changePassword(form) {
        const formData = new FormData(form);
        const saveBtn = form.querySelector('button[type="submit"]');

        if (saveBtn) {
            saveBtn.disabled = true;
            saveBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i> Salvataggio...';
        }

        fetch('${pageContext.request.contextPath}/common/utentgesture', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) throw new Error('Salvataggio fallito');
                return response.json();
            })
            .then(data => {
                showNotification('Password cambiata con successo!', 'success');
                form.reset();
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification('Errore durante il cambio password: ' + error.message, 'error');
            })
            .finally(() => {
                if (saveBtn) {
                    saveBtn.disabled = false;
                    saveBtn.textContent = 'Cambia Password';
                }
            });
    }

    function changeEmail(form) {
        const formData = new FormData(form);
        const saveBtn = form.querySelector('button[type="submit"]');

        if (saveBtn) {
            saveBtn.disabled = true;
            saveBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i> Salvataggio...';
        }

        fetch('${pageContext.request.contextPath}/common/utentgesture', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) throw new Error('Salvataggio fallito');
                return response.json();
            })
            .then(data => {
                showNotification('Email cambiata con successo! Ti abbiamo inviato un link di conferma.', 'success');
                localStorage.setItem('securitySettings', JSON.stringify(data));
                form.reset();
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification('Errore durante il cambio email: ' + error.message, 'error');
            })
            .finally(() => {
                if (saveBtn) {
                    saveBtn.disabled = false;
                    saveBtn.textContent = 'Cambia Email';
                }
            });
    }

    function toggle2FA(isEnabled) {
        const statusElement = document.getElementById('2fa-status');
        const formData = new FormData();
        formData.append('action', isEnabled ? 'enable2FA' : 'disable2FA');

        statusElement.textContent = isEnabled ? 'Attivazione in corso...' : 'Disattivazione in corso...';

        fetch('${pageContext.request.contextPath}/common/utentgesture', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) throw new Error('Operazione fallita');
                return response.json();
            })
            .then(data => {
                showNotification(`Autenticazione a 2 fattori ${isEnabled ? 'attivata' : 'disattivata'} con successo!`, 'success');
                localStorage.setItem('securitySettings', JSON.stringify(data));

                if (isEnabled) {
                    document.getElementById('2fa-setup').classList.remove('hidden');
                } else {
                    document.getElementById('2fa-setup').classList.add('hidden');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification(`Errore durante ${isEnabled ? 'attivazione' : 'disattivazione'} 2FA: ${error.message}`, 'error');
                document.getElementById('2fa-toggle').checked = !isEnabled;
            })
            .finally(() => {
                statusElement.textContent = document.getElementById('2fa-toggle').checked ? 'Attivata' : 'Disattivata';
            });
    }


})();

