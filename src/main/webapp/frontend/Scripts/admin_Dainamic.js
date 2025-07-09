function caricaContenuto(pagina) {
    $("#contenuto").load(pagina);
}

// Funzione per caricare il contenuto via AJAX
/*function loadContent(section) {
    // Mostra loader
    $('#dynamic-content').html('<div class="loader"></div>');

    // Rimuovi active da tutti gli item della sidebar
    $('.sidebar-item').removeClass('active');
    // Aggiungi active all'item cliccato
    $(event.target).closest('.sidebar-item').addClass('active');

    // Mappa delle sezioni con i loro URL
    const sections = {
        'dashboard': 'dashboard-content.jsp',
        'products': 'gestioneprodotti.jsp',
        'users': 'gestioneutenti.jsp',
        'orders': 'ordini.jsp',
        'settings': 'impostazioniadmin.jsp'
    };

    // Effettua la chiamata AJAX
    $.ajax({
        url: sections[section],
        type: 'GET',
        success: function(data) {
            $('#dynamic-content').html(data);

            // Se abbiamo caricato la dashboard, inizializza i grafici
            if(section === 'dashboard') {
                initCharts();
            }
        },
        error: function(xhr, status, error) {
            $('#dynamic-content').html(`
                    <div class="admin-card p-6 bg-white rounded-xl text-center text-red-500">
                        <i class="fas fa-exclamation-triangle text-3xl mb-3"></i>
                        <p>Errore nel caricamento del contenuto</p>
                        <button onclick="loadContent('dashboard')" class="btn-primary mt-3">
                            Torna alla Dashboard
                        </button>
                    </div>
                `);
        }
    });
}*/

// Inizializzazione della pagina
document.addEventListener("DOMContentLoaded", function () {
    createFloatingElements();
    //initCharts();

    // Gestione click sui link della sidebar
    $('.sidebar-item').click(function (e) {
        e.preventDefault();
        // La funzione loadContent viene chiamata dall'onclick
    });

    // Create floating elements
    function createFloatingElements() {
        const decorations = document.getElementById('decorations');
        const types = ['cherry-blossom', 'cherry-blossom'];
        const colors = ['#ff7eb8', '#ff65a3', '#ff4d8e'];

        for (let i = 0; i < 8; i++) {
            const element = document.createElement('div');
            const type = types[Math.floor(Math.random() * types.length)];
            const color = colors[Math.floor(Math.random() * colors.length)];

            element.className = type;
            element.style.left = Math.random() * 100 + 'vw';
            element.style.animationDuration = (10 + Math.random() * 20) + 's';
            element.style.animationDelay = Math.random() * 5 + 's';
            element.style.opacity = Math.random() * 0.5 + 0.2;
            element.style.transform = 'scale(' + (Math.random() * 0.5 + 0.5) + ')';

            decorations.appendChild(element);
        }
    }

    // Initialize charts
    function initCharts() {
        // Sales Chart
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                datasets: [{
                    label: 'Vendite',
                    data: [12, 19, 15, 24, 22, 18, 26],
                    backgroundColor: 'rgba(229, 84, 88, 0.05)',
                    borderColor: '#E55458',
                    borderWidth: 2,
                    tension: 0.4,
                    fill: true,
                    pointBackgroundColor: '#fff',
                    pointBorderColor: '#E55458',
                    pointBorderWidth: 2,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            drawBorder: false
                        },
                        ticks: {
                            stepSize: 5
                        }
                    },
                    x: {
                        grid: {
                            display: false,
                            drawBorder: false
                        }
                    }
                }
            }
        });

        // Revenue Chart
        const revenueCtx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(revenueCtx, {
            type: 'bar',
            data: {
                labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                datasets: [{
                    label: 'Guadagni',
                    data: [215, 325, 280, 465, 420, 310, 520],
                    backgroundColor: [
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)'
                    ],
                    borderColor: [
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)'
                    ],
                    borderWidth: 1,
                    borderRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            drawBorder: false
                        }
                    },
                    x: {
                        grid: {
                            display: false,
                            drawBorder: false
                        }
                    }
                }
            }
        });
    }

    // Modal functions
    function openModal(modalId) {
        document.getElementById(modalId).classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    const closeModal = (modalId) => {
        document.getElementById(modalId).classList.remove('active');
        document.body.style.overflow = 'auto';
    }

    // Initialize everything when DOM is loaded
    document.addEventListener('DOMContentLoaded', function () {
        createFloatingElements();
        initCharts();

        // Close modal when clicking outside
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => {
            modal.addEventListener('click', function (e) {
                if (e.target === modal) {
                    modal.classList.remove('active');
                    document.body.style.overflow = 'auto';
                }
            });
        });

        // Demo notification for skeleton loader
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.display = 'flex';
            });
        }, 1000);
    });
});

// Mappa i pulsanti ai contenuti
const contentMap = {
    'products': 'gestioneprodotti.jsp',
    'users': 'gestioneutenti.jsp',
    'dashboard': 'impostazioniadmin.jsp',
    'orders' : 'ordini.jsp',
};

function loadContent(section) {
    if (!contentMap[section]) {
        console.error(`Sezione "${section}" non trovata in contentMap`);
        $('#dynamic-content').html(`<div class="alert alert-error">Sezione "${section}" non trovata</div>`);
        return;
    }
    const loader = `<div class="loader mt-8"> </div>`;
    $('#dynamic-content').html(loader).load(contentMap[section], function(response, status) {
        if (status === "error") {
            $('#dynamic-content').html(`<div class="alert alert-error">Errore nel caricamento</div>`);
        } else {
            if(section === "dashboard") {
                init();
            } else if (section === "users") {
                console.log("user")
                if (typeof initUtent === "function") {
                    initUtent();
                } else {
                    // Altrimenti carica lo script e poi chiama la funzione
                    $.getScript("frontend/Scripts/gestioneUtenti_Dinamic.js")
                        .done(function() {
                            if (typeof initUtent === "function") {
                                initUtent();
                            } else {
                                mostraErrore("pagina bloccata, scusateci il disagio");
                                console.log("is not defined")
                            }
                        })
                        .fail(function() {
                            console.error("Errore nel caricamento dello script gestioneUtenti_Dinamic.js");
                        });
                }
            }
        }
    });
}

function handleSidebarClick(element, contentId) {
    document.querySelectorAll('.sidebar-item').forEach(link => {
        link.classList.remove('active');
    });
    element.classList.add('active');
    loadContent(contentId);
}


// Inizializzazione
$(document).ready(function() {
    // Attiva il primo tab
    loadContent('dashboard');

    // Gestione click menu
    $('.sidebar-item').click(function(e) {
        e.preventDefault();
        const section = $(this).data('section');
        loadContent(section);
    });
});