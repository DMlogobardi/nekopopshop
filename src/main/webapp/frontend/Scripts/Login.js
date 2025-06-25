fetch("login", {
    method: "POST",
    body: new FormData(document.getElementById("loginForm"))
})
    .then(res => res.json())
    .then(data => {
        if (data.satus === "success") {
            localStorage.setItem("access", data.access);
            window.location.href = "index.jsp";
        }
    });
