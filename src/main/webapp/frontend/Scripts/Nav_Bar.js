function mostraErrore(msg) {
    const erroreBox = document.getElementById("messaggioErrore");
    erroreBox.textContent = msg;
    erroreBox.classList.remove("hidden");

    erroreBox.scrollIntoView({ behavior: "smooth", block: "center" });

    setTimeout(() => {
        erroreBox.classList.add("hidden");
    }, 5000);
}

function getCookie(name) {
    const value = document.cookie.split("; ")
        .find(row => row.startsWith(name + "="));
    return value ? value.split("=")[1] : null;
}

function creaNavbar() {
    const navbar = document.getElementById("navbar");
    if (!navbar) {
        console.error("ERRORE: Elemento #navbar non trovato!");
        return;
    }

    const access = getCookie("access") || "guest"; // Default: guest
    console.log("[DEBUG] Stato accesso:", access);

    let html = `
    <div class="w-full lg:w-auto">
      <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
        <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
        <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
        <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
        <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
    `;

    if (access === "admin") {
        html += `<a href="admin.jsp" class="folder-tab"><i class="fas fa-user-shield mr-2"></i> Admin</a>`;
    } else if (access === "user") {
        html += `<a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>`;
    } else {
        html += `
        <a href="login.jsp" class="folder-tab"><i class="fas fa-sign-in-alt mr-2"></i> Login</a>
        <a href="register.jsp" class="folder-tab"><i class="fas fa-user-plus mr-2"></i> Registrati</a>
        `;
    }

    // Aggiungi sempre il tasto Logout se loggato
    if (access === "admin" || access === "user") {
        html += `<a href="#" onclick="logout()" class="folder-tab"><i class="fas fa-sign-out-alt mr-2"></i> Logout</a>`;
    }

    html += `</div></div>`;
    navbar.innerHTML = html;
}

// Aggiorna la navbar al load e al cambio di stato
window.addEventListener("DOMContentLoaded", creaNavbar);
window.addEventListener("storage", creaNavbar); // Se cambi login da un'altra scheda

// Funzione per il logout
function logout() {
    const contextPath = '';
    fetch(`/nekopopshop/common/logout`, { method: 'POST' })
        .then(res => res.json())
        .then(data =>{
            if(data.error !== undefined){
                mostraErrore("logout inlegale")
            } else {
                document.cookie = "access=; path=/; max-age=0";
                window.location.href = "index.jsp";
            }
        })
}