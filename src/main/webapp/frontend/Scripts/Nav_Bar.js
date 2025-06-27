function creaNavbar(access) {
    const navbar = document.getElementById("navbar");
    if (!navbar) return;

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
    }

    html += `</div></div>`;
    navbar.innerHTML = html;
}

window.addEventListener("DOMContentLoaded", () => {
    const access = localStorage.getItem("access");
    creaNavbar(access);
});
