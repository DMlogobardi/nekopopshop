// Modal functionality
const addProductBtn = document.getElementById('addProductBtn');
const closeModalBtn = document.getElementById('closeModalBtn');
const cancelModalBtn = document.getElementById('cancelModalBtn');
const modal = document.getElementById('addProductModal');

addProductBtn.addEventListener('click', () => {
    modal.classList.add('active');
    modal.classList.remove('opacity-0', 'invisible');
});

const closeModal = () => {
    modal.classList.remove('active');
    modal.classList.add('opacity-0', 'invisible');
};

closeModalBtn.addEventListener('click', closeModal);
cancelModalBtn.addEventListener('click', closeModal);

// Close modal when clicking outside
modal.addEventListener('click', (e) => {
    if (e.target === modal) {
        closeModal();
    }
});

// Generate cherry blossoms
function createCherryBlossoms() {
    const decorations = document.getElementById('decorations');
    for (let i = 0; i < 15; i++) {
        const blossom = document.createElement('div');
        blossom.className = 'cherry-blossom';

        // Random position
        const left = Math.random() * 100;
        blossom.style.left = `${left}vw`;

        // Random delay
        const delay = Math.random() * 15;
        blossom.style.animationDelay = `${delay}s`;

        // Random size
        const size = 15 + Math.random() * 15;
        blossom.style.width = `${size}px`;
        blossom.style.height = `${size}px`;

        decorations.appendChild(blossom);
    }
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    createCherryBlossoms();
});