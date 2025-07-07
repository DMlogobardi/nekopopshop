document.getElementById("loginForm")?.addEventListener("submit", function (e) {
    e.preventDefault(); // Previeni invio classico del form

    fetch("login", {
        method: "POST",
        body: new FormData(this)
    })
        .then(res => {
            if (!res.ok) {
                throw new Error("Errore nella risposta del server");
            }
            return res.json();
        })
        .then(data => {
            if (data.status === "success") {
                setTimeout(() => {
                    const redirects = {
                        "admin": "admin/index.jsp",
                        "user": "user/index.jsp"
                    };
                    const redirectUrl = redirects[role];
                    if (redirectUrl) {
                        window.location.href = redirectUrl;
                    } else {
                        console.warn("Ruolo sconosciuto:", role);
                        window.location.href = "index.jsp";
                    }
                }, 100);
            } else {
                alert(data.message || "Credenziali non valide");
            }
        })
        .catch(error => {
            console.error("Errore durante il login:", error);
            alert("Errore durante il login. Riprova più tardi.");
        });
});
