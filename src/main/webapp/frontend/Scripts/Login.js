fetch("login", {
    method: "POST",
    body: new FormData(document.getElementById("loginForm"))
})
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            localStorage.setItem("access", data.access);
            localStorage.setItem("role", data.role); // salva il ruolo

            creaNavbar(data.role);

            if (data.role === "admin") {
                window.location.href = "admin/index.jsp";
            } else if (data.role === "user") {
                window.location.href = "user/index.jsp";
            } else {
                alert("Ruolo non riconosciuto");
            }
        } else {
            alert("Credenziali non valide");
        }
    });
