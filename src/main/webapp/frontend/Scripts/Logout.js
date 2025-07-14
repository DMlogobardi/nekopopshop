/**
 * Gestione completa del logout
 * @version 1.1
 */

/**
 * Esegue il logout via form POST (metodo più affidabile)
 */
function performFormLogout() {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/common/logout';

    // Aggiungi CSRF token se necessario (esempio per Spring)
    // const csrfInput = document.createElement('input');
    // csrfInput.type = 'hidden';
    // csrfInput.name = '_csrf';
    // csrfInput.value = 'YOUR_CSRF_TOKEN';
    // form.appendChild(csrfInput);

    document.body.appendChild(form);
    form.submit();
}

/**
 * Esegue il logout via fetch API (più moderno)
 */
function performFetchLogout() {
    fetch('/common/logout', {
        method: 'POST',
        credentials: 'same-origin',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            // 'X-CSRF-TOKEN': 'YOUR_CSRF_TOKEN' // Scommenta se necessario
        }
    })
        .then(response => {
            if (response.redirected) {
                window.location.href = response.url;
            } else {
                window.location.href = 'index.jsp';
            }
        })
        .catch(error => {
            console.error('Fetch logout failed:', error);
            // Fallback al metodo tradizionale
            performFormLogout();
        });
}

/**
 * Gestore principale del logout
 */
function handleLogout() {
    // Usa fetch se supportato, altrimenti usa form
    if (window.fetch) {
        performFetchLogout();
    } else {
        performFormLogout();
    }
}

// Inizializzazione al caricamento della pagina
document.addEventListener('DOMContentLoaded', function() {
    // Aggiunge listener a tutti gli elementi con data-tab="logout"
    const logoutElements = document.querySelectorAll('[data-tab="logout"]');

    logoutElements.forEach(element => {
        element.addEventListener('click', function(e) {
            e.preventDefault();
            handleLogout();
        });
    });

    // Debug
    console.log('Logout handler initialized', logoutElements);
});

// Espone le funzioni globalmente se necessario
window.logout = handleLogout;
window.performLogout = handleLogout; // Alias