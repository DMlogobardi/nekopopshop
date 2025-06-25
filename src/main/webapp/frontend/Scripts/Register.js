function inviaRegistrazione() {
    const dto = {
        name: document.getElementById("name").value,
        cognome: document.getElementById("cognome").value,
        nascita: document.getElementById("nascita").value,
        email: document.getElementById("email").value,
        cf: document.getElementById("cf").value,
        via: document.getElementById("via").value,
        civico: parseInt(document.getElementById("civico").value),
        cap: document.getElementById("cap").value,
        prefisso: document.getElementById("prefisso").value,
        numero: document.getElementById("numero").value,
        password: document.getElementById("password").value,
        nick: document.getElementById("nick").value
    };


    function mostraBannerRegistrazioneSuccesso() {
        const msg = document.getElementById("registration-message");
        if (!msg) return;

        msg.classList.remove("hidden");
        msg.classList.add("block");

        // Nasconde il messaggio dopo 3.5 secondi e reindirizza al login
        setTimeout(() => {
            msg.classList.add("hidden");
            msg.classList.remove("block");
            window.location.href = "login.jsp";
        }, 3500);
    }
    document.addEventListener("DOMContentLoaded", function (){
        const confirmbutton = document.getElementById("conferma");
        confirmbutton.addEventListener("click", ()=>{
            completaRegistrazione();
        });

    })
    function completaRegistrazione() {
        const dto = {
            name: document.getElementById("name").value,
            cognome: document.getElementById("cognome").value,
            nascita: document.getElementById("nascita").value,
            email: document.getElementById("email").value,
            cf: document.getElementById("cf").value,
            via: document.getElementById("via").value,
            civico: parseInt(document.getElementById("civico").value),
            cap: document.getElementById("cap").value,
            prefisso: document.getElementById("prefisso").value,
            numero: document.getElementById("numero").value,
            password: document.getElementById("password").value,
            nick: document.getElementById("nick").value
        };

        fetch("register", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(dto)
        })
            .then(res => res.json())
            .then(data => {
                if (data.status === "success") {
                    mostraBannerRegistrazioneSuccesso();
                } else {
                    alert("Registrazione fallita: " + (data.message || "Errore generico"));
                }
            })
            .catch(err => {
                console.error("Errore di rete", err);
                alert("Errore durante la richiesta. Riprova.");
            });
    }
}



