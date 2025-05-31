<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NekoPopShop - Home</title>
    <link rel="stylesheet" href="frontend/style.css">

</head>
<body>
    <!-- Header con logo, navigazione e carrello -->
    <div class="header">
        <a href="index.jsp" class="logo">NekoPopShop</a>
        
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="catalog.jsp">Catalogo</a>
            <a href="about.jsp">Chi Siamo</a>
        </div>
        
        <div class="user-section">
            <c:choose>
                <c:when test="${not empty sessionScope.logToken}">
                    <c:choose>
                        <c:when test="${sessionScope.logToken == 'A'}">
                            <a href="admin.jsp" class="profile-icon">Admin</a>
                        </c:when>
                        <c:otherwise>
                            <a href="profile.jsp" class="profile-icon">Profilo</a>
                        </c:otherwise>
                    </c:choose>
                    <a href="cart.jsp" class="cart-icon">Carrello (${not empty sessionScope.cart ? sessionScope.cart.contenuti.size() : 0})</a>
                    <a href="logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="profile-icon">Login</a>
                    <a href="register.jsp" class="cart-icon">Registrati</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <!-- Barra di ricerca con suggerimenti -->
    <div class="search-container">
        <input type="text" class="search-bar" id="searchInput" placeholder="Cerca manga per nome..." autocomplete="off">
        <div class="search-suggestions" id="searchSuggestions"></div>
    </div>
    
    <!-- Sezione prodotti -->
    <div class="products-container" id="productsContainer">
        <!-- I prodotti verranno caricati via JavaScript -->
    </div>

    <script>
        // Funzione per caricare i prodotti
        function loadProducts(searchTerm = '') {
            fetch('getcatalog' + (searchTerm ? '?search=' + encodeURIComponent(searchTerm) : ''))
                .then(response => response.json())
                .then(data => {
                    const container = document.getElementById('productsContainer');
                    container.innerHTML = '';
                    
                    data.forEach(product => {
                        const productCard = document.createElement('div');
                        productCard.className = 'product-card';
                        productCard.innerHTML = `
                            <img src="${product.imageUrl || 'images/default-manga.jpg'}" alt="${product.title}" class="product-image">
                            <div class="product-info">
                                <div class="product-title">${product.title}</div>
                                <div class="product-volume">Volume ${product.volumeNumber}</div>
                                <div class="product-price">€${product.price.toFixed(2)}</div>
                            </div>
                        `;
                        productCard.addEventListener('click', () => {
                            window.location.href = 'product.jsp?id=' + product.id;
                        });
                        container.appendChild(productCard);
                    });
                });
        }
        
        // Funzione per i suggerimenti di ricerca
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.trim();
            const suggestions = document.getElementById('searchSuggestions');
            
            if (searchTerm.length < 2) {
                suggestions.style.display = 'none';
                return;
            }
            
            fetch('getcatalog?search=' + encodeURIComponent(searchTerm))
                .then(response => response.json())
                .then(data => {
                    suggestions.innerHTML = '';
                    if (data.length > 0) {
                        data.slice(0, 5).forEach(item => {
                            const suggestion = document.createElement('div');
                            suggestion.className = 'suggestion-item';
                            suggestion.textContent = `${item.title} - Vol. ${item.volumeNumber}`;
                            suggestion.addEventListener('click', () => {
                                document.getElementById('searchInput').value = `${item.title} - Vol. ${item.volumeNumber}`;
                                suggestions.style.display = 'none';
                                loadProducts(item.title);
                            });
                            suggestions.appendChild(suggestion);
                        });
                        suggestions.style.display = 'block';
                    } else {
                        suggestions.style.display = 'none';
                    }
                });
        });
        
        // Chiudi i suggerimenti quando si clicca fuori
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.search-container')) {
                document.getElementById('searchSuggestions').style.display = 'none';
            }
        });
        
        // Carica i prodotti all'avvio
        loadProducts();
    </script>
</body>
</html>