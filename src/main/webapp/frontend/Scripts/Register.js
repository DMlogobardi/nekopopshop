// Funzione per mostrare il banner di successo
function mostraBannerRegistrazioneSuccesso() {
    const msg = document.getElementById('registration-message');
    if (!msg) {
        // Fallback se il banner non esiste
        alert('Registrazione completata! Sarai reindirizzato alla pagina di login.');
        window.location.href = 'login.jsp';
        return;
    }

    // Mostra il banner con animazione
    msg.classList.remove('hidden');
    msg.classList.add('block', 'animate-fade-in');

    // Nascondi dopo 3 secondi e reindirizza
    setTimeout(() => {
        msg.classList.remove('block', 'animate-fade-in');
        msg.classList.add('hidden');
        window.location.href = 'login.jsp';
    }, 3000);
}

// Funzione per completare la registrazione
async function completaRegistrazione() {
    // 1. Validazione finale
    const password = document.getElementById('password')?.value;
    const confirmPassword = document.getElementById('confirm-password')?.value;
    const terms = document.getElementById('terms')?.checked;

    if (password !== confirmPassword) {
        alert("Le password non coincidono");
        return;
    }

    if (!terms) {
        alert("Devi accettare i termini e condizioni");
        return;
    }

    // 2. Preparazione dati
    const dto = {
        name: document.getElementById('name').value,
        cognome: document.getElementById('cognome').value,
        nascita: document.getElementById('nascita').value,
        email: document.getElementById('email').value,
        cf: document.getElementById('cf').value,
        via: document.getElementById('via').value,
        civico: parseInt(document.getElementById('civico').value),
        cap: document.getElementById('cap').value,
        prefisso: document.getElementById('prefisso').value,
        numero: document.getElementById('numero').value,
        password: password,
        nick: document.getElementById('nick').value
    };

    try {
        // 3. Invio dati al server
        const response = await fetch('register', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(dto)
        });

        if (!response.ok) throw new Error('Errore nella richiesta');

        const data = await response.json();

        // 4. Gestione risposta
        if (data.status === 'success') {
            mostraBannerRegistrazioneSuccesso();
        } else {
            alert("Registrazione fallita: " + (data.message || "Errore generico"));
        }
    } catch (error) {
        console.error("Errore:", error);
        alert("Errore durante la registrazione. Riprova.");
    }
}

// Inizializzazione quando il DOM è pronto
document.addEventListener('DOMContentLoaded', function() {
    const confirmButton = document.getElementById('conferma');
    if (confirmButton) {
        confirmButton.addEventListener('click', function(e) {
            e.preventDefault();
            completaRegistrazione();
        });
    }
});


