document.addEventListener('DOMContentLoaded', function() {
    initDashboardTab();
});

function initDashboardTab() {
    const dashboardTabBtn = document.getElementById('dashboard-tab-btn');
    if (!dashboardTabBtn) {
        console.warn("Elemento 'dashboard-tab-btn' non trovato.");
        return;
    }

    dashboardTabBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loadDashboardContent();
    });

    const mainContent = document.querySelector('.lg\\:col-span-3');
    const dashboardTab = document.getElementById('dashboard-tab');

    if (dashboardTab && dashboardTab.classList.contains('active') && dashboardTab.innerHTML.trim() === '') {
        loadDashboardContent();
    }
}

function loadDashboardContent() {
    const mainContent = document.querySelector('.lg\\:col-span-3');
    if (!mainContent) {
        console.error("Contenitore principale per la dashboard non trovato.");
        return;
    }

    const dashboardTab = document.getElementById('dashboard-tab');
    if (dashboardTab && dashboardTab.dataset.loaded === 'true') {
        console.log("Dashboard già caricata.");
        return;
    }

    renderDashboardContent(mainContent);
    if (dashboardTab) {
        dashboardTab.dataset.loaded = 'true';
    }
}

function renderDashboardContent(container) {
    container.innerHTML = `
        <div class="tab-content active" id="dashboard-tab">
            <div class="profile-card bg-white border-2 border-nekored">
                <div class="bg-gradient-to-r from-nekored to-nekoorange p-4">
                    <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-tachometer-alt mr-3"></i> La tua dashboard
                    </h2>
                </div>
                <div class="p-6">
                    <h2 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                        <i class="fas fa-heart mr-2"></i> Benvenuto nella tua area utente!
                    </h2>
                    <h2 class="font-bold text-lg text-nekopeach mb-4 flex items-center">
                        <i class="fas fa-heart mr-2"></i> Preparati all'esperienza offerta da NekoPop Shop!
                    </h2>
                </div>
            </div>
        </div>
    `;
}
