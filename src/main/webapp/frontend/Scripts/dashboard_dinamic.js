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

function closeModal(modalId) {
    document.getElementById(modalId).classList.remove('active');
    document.body.style.overflow = 'auto';
}

// Initialize everything when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    createFloatingElements();
    initCharts();

    // Close modal when clicking outside
    const modals = document.querySelectorAll('.modal');
    modals.forEach(modal => {
        modal.addEventListener('click', function(e) {
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