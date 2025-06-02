document.addEventListener('DOMContentLoaded', function() {
    // Create sakura petals
    createSakuraPetals();

    // Load products
    loadProducts();

    // Cart functionality
    setupCart();

    // Animate category cards on hover
    animateCategoryCards();
});


function createSakuraPetals() {
    const sakuraContainer = document.querySelector('.sakura-petals');
    const petalCount = 15;

    for (let i = 0; i < petalCount; i++) {
        const petal = document.createElement('div');
        petal.classList.add('sakura');

        // Random size between 10px and 25px
        const size = Math.random() * 15 + 10;
        petal.style.width = `${size}px`;
        petal.style.height = `${size}px`;

        // Random position
        petal.style.left = `${Math.random() * 100}vw`;

        // Random animation duration between 10s and 20s
        const duration = Math.random() * 10 + 10;
        petal.style.animationDuration = `${duration}s`;

        // Random delay
        petal.style.animationDelay = `${Math.random() * 5}s`;

        // Random x-axis movement
        const randomX = Math.random() * 100 - 50;
        petal.style.setProperty('--end-x', `${randomX}px`);

        sakuraContainer.appendChild(petal);
    }
}

function loadProducts() {
    const productGrid = document.querySelector('.product-grid');

    // Sample product data
    const products = [
        {
            id: 1,
            name: 'Maneki Neko Lucky Cat',
            price: 24.99,
            image: 'https://i.imgur.com/JzR8Q4O.png'
        },
        {
            id: 2,
            name: 'Cherry Blossom Cat T-shirt',
            price: 19.99,
            image: 'https://i.imgur.com/8nLyTQj.png'
        },
        {
            id: 3,
            name: 'Kawaii Cat Plush',
            price: 14.99,
            image: 'https://i.imgur.com/5QzY7JQ.png'
        },
        {
            id: 4,
            name: 'Japanese Cat Mug',
            price: 12.99,
            image: 'https://i.imgur.com/3qJQY9J.png'
        },
        {
            id: 5,
            name: 'Cat & Sakura Phone Case',
            price: 15.99,
            image: 'https://i.imgur.com/9zQY7JQ.png'
        },
        {
            id: 6,
            name: 'Neko Face Mask',
            price: 8.99,
            image: 'https://i.imgur.com/JzR8Q4O.png'
        }
    ];

    // Clear any existing content
    productGrid.innerHTML = '';

    // Add products to the grid
    products.forEach(product => {
        const productCard = document.createElement('div');
        productCard.classList.add('product-card');
        productCard.innerHTML = `
            <img src="${product.image}" alt="${product.name}" class="product-image">
            <div class="product-info">
                <h3 class="product-title">${product.name}</h3>
                <p class="product-price">$${product.price.toFixed(2)}</p>
                <button class="add-to-cart" data-id="${product.id}">Add to Cart</button>
            </div>
        `;
        productGrid.appendChild(productCard);
    });
}

function setupCart() {
    let cart = JSON.parse(localStorage.getItem('nekoCart')) || [];
    updateCartCount();

    // Add to cart button event listeners
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('add-to-cart')) {
            const productId = parseInt(e.target.getAttribute('data-id'));
            addToCart(productId);
        }
    });

    function addToCart(productId) {
        // In a real app, you would find the product details from your products array
        const product = {
            id: productId,
            quantity: 1
        };

        // Check if product already in cart
        const existingItem = cart.find(item => item.id === productId);

        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push(product);
        }

        // Save to localStorage
        localStorage.setItem('nekoCart', JSON.stringify(cart));

        // Update cart count
        updateCartCount();

        // Show added to cart animation
        const cartIcon = document.querySelector('.cart-icon');
        cartIcon.classList.add('animate-bounce');
        setTimeout(() => {
            cartIcon.classList.remove('animate-bounce');
        }, 1000);
    }

    function updateCartCount() {
        const count = cart.reduce((total, item) => total + item.quantity, 0);
        document.querySelector('.cart-count').textContent = count;
    }
}

function animateCategoryCards() {
    const categoryCards = document.querySelectorAll('.category-card');

    categoryCards.forEach(card => {
        card.addEventListener('mouseenter', () => {
            const catEars = document.createElement('div');
            catEars.innerHTML = `
                <div style="position: absolute; top: -15px; left: 10px; width: 20px; height: 30px; background-color: ${card.style.backgroundColor}; border-radius: 50% 50% 0 0; transform: rotate(-30deg);"></div>
                <div style="position: absolute; top: -15px; right: 10px; width: 20px; height: 30px; background-color: ${card.style.backgroundColor}; border-radius: 50% 50% 0 0; transform: rotate(30deg);"></div>
            `;
            catEars.style.position = 'relative';
            card.appendChild(catEars);

            setTimeout(() => {
                catEars.remove();
            }, 300);
        });
    });
}