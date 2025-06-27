document.addEventListener('DOMContentLoaded', function() {
    generateDecorations();
    document.getElementById("about").classList.add("active");

    const ila = document.getElementById("Ilaria");
    const davide = document.getElementById("davide");
    const alessia = document.getElementById("alessia");

    ila.addEventListener("keypress", function (){
        window.open("https://github.com/DMlogobardi", "_blank");
    })

    davide.addEventListener("keypress", function (){
        window.open("https://github.com/ilary2204", "_blank");
    })

    alessia.addEventListener("keypress", function (){
        window.open("https://github.com/AlessiaPalmigiano", "_blank");
    })
})

function generateDecorations() {
    const decorationsContainer = document.getElementById('decorations');
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    // Generate cherry blossom decorations
    for (let i = 0; i < 15; i++) {
        const blossom = document.createElement('div');
        blossom.className = 'cherry-blossom';
        blossom.style.left = `${Math.random() * viewportWidth}px`;
        blossom.style.animationDelay = `${Math.random() * 15}s`;
        blossom.style.opacity = `0.${Math.floor(2 + Math.random() * 7)}`;
        blossom.style.transform = `scale(${0.5 + Math.random()})`;
        decorationsContainer.appendChild(blossom);
    }
}