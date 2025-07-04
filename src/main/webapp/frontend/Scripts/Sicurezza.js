document.addEventListener('DOMContentLoaded', function() {
    initSecurityTab();
});

function initSecurityTab() {
    const securityTabBtn = document.getElementById('security-tab-btn');
    if (!securityTabBtn) return;

    securityTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadSecurityContent();
    });
}

function loadSecurityContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showSecurityLoading(mainContent);

    // Simula chiamata AJAX (sostituisci con chiamata reale)
    setTimeout(() => {
        renderSecurityContent(mainContent);
    }, 800);
}

function showSecurityLoading(container) {
    container.innerHTML = `
        <div class="flex justify-center items-center h-64">
            <div class="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-nekopink"></div>
            <span class="ml-3 text-nekopeach">Caricamento sicurezza...</span>
        </div>
    `;
}

function renderSecurityContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="security-tab">
            <div class="profile-card bg-white border-2 border-nekopeach">
                <div class="bg-gradient-to-r from-nekopeach to-nekopink p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-lock mr-3"></i> Sicurezza Account
                    </h2>
                </div>

                <div class="p-6">
                    <!-- Tabs Navigation -->
                    <div class="flex mb-6">
                        <div class="form-tab active" onclick="openSecurityTab('cambio-password')">
                            <i class="fas fa-key mr-2"></i> Cambio Password
                        </div>
                        <div class="form-tab ml-2" onclick="openSecurityTab('cambio-email')">
                            <i class="fas fa-envelope mr-2"></i> Cambio Email
                        </div>
                        <div class="form-tab ml-2" onclick="openSecurityTab('two-factor')">
                            <i class="fas fa-shield-alt mr-2"></i> Autenticazione a 2 Fattori
                        </div>
                    </div>

                    <!-- Password Change Form -->
                    <div id="cambio-password" class="form-tab-content active">
                        <form id="passwordChangeForm" method="post" action="UpdatePasswordServlet">
                            <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                                <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-shield-alt mr-2"></i> Sicurezza Password</h4>
                                <p class="text-sm text-gray-700">
                                    Per la tua sicurezza, assicurati che la nuova password sia lunga almeno 8 caratteri e
                                    includa numeri, lettere maiuscole e minuscole e caratteri speciali.
                                </p>
                            </div>

                            <div class="input-group">
                                <label for="current-password">Password Attuale</label>
                                <div class="relative">
                                    <input type="password" id="current-password" name="current-password" required>
                                    <i class="toggle-password fas fa-eye" onclick="togglePassword('current-password')"></i>
                                </div>
                            </div>

                            <div class="input-group">
                                <label for="new-password">Nuova Password</label>
                                <div class="relative">
                                    <input type="password" id="new-password" name="new-password" required>
                                    <i class="toggle-password fas fa-eye" onclick="togglePassword('new-password')"></i>
                                </div>
                                <div id="password-strength" class="text-xs mt-1"></div>
                            </div>

                            <div class="input-group">
                                <label for="confirm-password">Conferma Nuova Password</label>
                                <div class="relative">
                                    <input type="password" id="confirm-password" name="confirm-password" required>
                                    <i class="toggle-password fas fa-eye" onclick="togglePassword('confirm-password')"></i>
                                </div>
                                <div id="password-match" class="text-xs mt-1"></div>
                            </div>

                            <div class="flex justify-end mt-6">
                                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                                    Annulla
                                </button>
                                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                                    Cambia Password
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Email Change Form -->
                    <div id="cambio-email" class="form-tab-content">
                        <form id="emailChangeForm" method="post" action="UpdateEmailServlet">
                            <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                                <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-info-circle mr-2"></i> Informazioni importanti</h4>
                                <p class="text-sm text-gray-700">
                                    Cambiando l'email, dovrai confermare la nuova indirizzo email attraverso un link che ti invieremo.
                                    Fino alla conferma, continuerai a utilizzare la tua email attuale per accedere.
                                </p>
                            </div>

                            <div class="input-group">
                                <label for="current-email">Email attuale</label>
                                <input type="email" id="current-email" value="neko.fan@example.com" readonly>
                            </div>

                            <div class="input-group">
                                <label for="new-email">Nuova Email</label>
                                <input type="email" id="new-email" name="new-email" required>
                            </div>

                            <div class="input-group">
                                <label for="confirm-email">Conferma Nuova Email</label>
                                <input type="email" id="confirm-email" name="confirm-email" required>
                            </div>

                            <div class="input-group">
                                <label for="password-email">Password Attuale</label>
                                <div class="relative">
                                    <input type="password" id="password-email" name="password" required>
                                    <i class="toggle-password fas fa-eye" onclick="togglePassword('password-email')"></i>
                                </div>
                            </div>

                            <div class="flex justify-end mt-6">
                                <button type="reset" class="px-6 py-2 border-2 border-nekopeach text-nekopeach font-bold rounded-lg mr-3 hover:bg-nekopeach hover:text-white transition">
                                    Annulla
                                </button>
                                <button type="submit" class="px-6 py-2 bg-nekopeach text-white font-bold rounded-lg hover:bg-nekored transition">
                                    Cambia Email
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Two Factor Authentication -->
                    <div id="two-factor" class="form-tab-content">
                        <div class="bg-nekopink/10 p-4 rounded-lg mb-6">
                            <h4 class="font-bold text-nekopeach mb-2"><i class="fas fa-shield-alt mr-2"></i> Autenticazione a 2 Fattori</h4>
                            <p class="text-sm text-gray-700">
                                L'autenticazione a due fattori aggiunge un ulteriore livello di sicurezza al tuo account.
                                Dovrai inserire un codice generato dalla tua app di autenticazione oltre alla password.
                            </p>
                        </div>

                        <div class="flex items-center justify-between mb-6">
                            <div>
                                <h4 class="font-bold text-gray-800">Autenticazione a 2 Fattori</h4>
                                <p class="text-sm text-gray-600">Stato attuale: <span id="2fa-status">Disattivata</span></p>
                            </div>
                            <label class="relative inline-flex items-center cursor-pointer">
                                <input type="checkbox" id="2fa-toggle" class="sr-only peer">
                                <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-nekopeach/30 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-nekopeach"></div>
                            </label>
                        </div>

                        <div id="2fa-setup" class="hidden bg-white p-4 rounded-lg border border-nekopink">
                            <h5 class="font-bold mb-3 text-nekopeach">Configura l'autenticazione a 2 fattori</h5>
                            <div class="flex flex-col md:flex-row items-center">
                                <div class="mb-4 md:mb-0 md:mr-6">
                                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=otpauth://totp/NekoPopShop:user%40example.com?secret=JBSWY3DPEHPK3PXP&issuer=NekoPopShop" alt="QR Code" class="w-32 h-32">
                                </div>
                                <div>
                                    <p class="text-sm mb-3">1. Scansiona questo QR code con la tua app di autenticazione (Google Authenticator, Authy, ecc.)</p>
                                    <p class="text-sm mb-3">2. Inserisci il codice generato dall'app per verificare:</p>
                                    <div class="input-group">
                                        <label for="2fa-code">Codice di verifica</label>
                                        <input type="text" id="2fa-code" name="2fa-code" placeholder="123456">
                                    </div>
                                    <button class="mt-3 px-4 py-2 bg-nekopeach text-white text-sm font-bold rounded-lg hover:bg-nekored transition">
                                        Verifica e Attiva
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Aggiungi gestori eventi
    setupSecurityEventHandlers();
    addSecurityStyles();
}

function setupSecurityEventHandlers() {
    // Toggle password visibility
    function togglePassword(id) {
        const input = document.getElementById(id);
        const icon = input.nextElementSibling;
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    // Switch between security tabs
    window.openSecurityTab = function(tabName) {
        const tabs = document.querySelectorAll('.form-tab');
        const tabContents = document.querySelectorAll('.form-tab-content');

        tabs.forEach(tab => tab.classList.remove('active'));
        tabContents.forEach(content => content.classList.remove('active'));

        event.currentTarget.classList.add('active');
        document.getElementById(tabName).classList.add('active');
    }

    // Password strength indicator
    document.getElementById('new-password')?.addEventListener('input', function() {
        const password = this.value;
        const strengthIndicator = document.getElementById('password-strength');

        // Reset
        strengthIndicator.textContent = '';
        strengthIndicator.className = 'text-xs mt-1';

        if (password.length === 0) return;

        // Check password strength
        let strength = 0;
        if (password.length >= 8) strength++;
        if (password.match(/[A-Z]/)) strength++;
        if (password.match(/[a-z]/)) strength++;
        if (password.match(/[0-9]/)) strength++;
        if (password.match(/[^A-Za-z0-9]/)) strength++;

        // Display strength
        if (strength <= 2) {
            strengthIndicator.textContent = 'Debole';
            strengthIndicator.className = 'text-xs mt-1 text-red-500';
        } else if (strength <= 4) {
            strengthIndicator.textContent = 'Media';
            strengthIndicator.className = 'text-xs mt-1 text-yellow-500';
        } else {
            strengthIndicator.textContent = 'Forte';
            strengthIndicator.className = 'text-xs mt-1 text-green-500';
        }
    });

    // Password match validation
    document.getElementById('confirm-password')?.addEventListener('input', function() {
        const newPassword = document.getElementById('new-password').value;
        const confirmPassword = this.value;
        const matchIndicator = document.getElementById('password-match');

        if (confirmPassword.length === 0) {
            matchIndicator.textContent = '';
            return;
        }

        if (newPassword === confirmPassword) {
            matchIndicator.textContent = 'Le password coincidono';
            matchIndicator.className = 'text-xs mt-1 text-green-500';
        } else {
            matchIndicator.textContent = 'Le password non coincidono';
            matchIndicator.className = 'text-xs mt-1 text-red-500';
        }
    });

    // 2FA Toggle
    document.getElementById('2fa-toggle')?.addEventListener('change', function() {
        const statusElement = document.getElementById('2fa-status');
        const setupElement = document.getElementById('2fa-setup');

        if (this.checked) {
            statusElement.textContent = 'Attivazione in corso...';
            setupElement.classList.remove('hidden');
        } else {
            statusElement.textContent = 'Disattivata';
            setupElement.classList.add('hidden');
        }
    });

    // Form validation
    document.getElementById('emailChangeForm')?.addEventListener('submit', function(e) {
        const newEmail = document.getElementById('new-email').value;
        const confirmEmail = document.getElementById('confirm-email').value;

        if (newEmail !== confirmEmail) {
            alert('Le email non coincidono!');
            e.preventDefault();
        }
    });

    document.getElementById('passwordChangeForm')?.addEventListener('submit', function(e) {
        const newPassword = document.getElementById('new-password').value;
        const confirmPassword = document.getElementById('confirm-password').value;

        if (newPassword !== confirmPassword) {
            alert('Le password non coincidono!');
            e.preventDefault();
        }
    });
}

function addSecurityStyles() {
    if (document.getElementById('security-styles')) return;

    const style = document.createElement('style');
    style.id = 'security-styles';
    style.textContent = `
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
        
        .input-group {
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .input-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #f2d5bb;
            border-radius: 10px;
            background-color: #fff;
            transition: all 0.3s ease;
        }
        
        .input-group input:focus {
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
        
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #999;
        }
        
        .toggle-password:hover {
            color: #E55458;
        }
    `;
    document.head.appendChild(style);
}

// Versione con AJAX reale
/*
function loadSecurityContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) return;

    showSecurityLoading(mainContent);

    fetch('${pageContext.request.contextPath}/getSecuritySettings')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.text();
        })
        .then(html => {
            mainContent.innerHTML = html;
            setupSecurityEventHandlers();
            addSecurityStyles();
        })
        .catch(error => {
            mainContent.innerHTML = `
                <div class="text-center p-8 text-nekopeach">
                    <i class="fas fa-exclamation-triangle text-4xl mb-4"></i>
                    <p>Si è verificato un errore durante il caricamento delle impostazioni di sicurezza.</p>
                    <button onclick="loadSecurityContent()" class="mt-4 bg-nekopeach text-white px-4 py-2 rounded-lg">
                        Riprova
                    </button>
                </div>
            `;
            console.error('Error loading security settings:', error);
        });
}
*/