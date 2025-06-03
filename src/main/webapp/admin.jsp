<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NekoPopShop - Admin</title>
    <link rel="stylesheet" href="frontend/style.css">

</head>
<body>
    <!-- Header -->
    <div class="header">
        <a href="index.jsp" class="logo">NekoPopShop - Admin</a>
        <div>
            <a href="logout" style="color: #ecf0f1;">Logout</a>
        </div>
    </div>
    
    <!-- Pannello di controllo admin -->
    <div class="admin-container">
        <div class="admin-actions">
            <button class="admin-btn" onclick="openForm('addMangaForm')">Aggiungi Manga</button>
            <button class="admin-btn" onclick="openForm('addVolumeForm')">Aggiungi Volume</button>
            <button class="admin-btn delete" onclick="openForm('deleteMangaForm')">Elimina Manga</button>
        </div>
        
        <!-- Barra di ricerca -->
        <div style="padding: 20px; background-color: #3498db; text-align: center;">
            <input type="text" id="adminSearch" class="search-bar" placeholder="Cerca manga o volumi..." style="width: 60%; padding: 12px; border-radius: 25px; border: none; font-size: 16px;">
        </div>
        
        <!-- Lista prodotti -->
        <div class="products-container" id="adminProductsContainer">
            <!-- I prodotti verranno caricati via JavaScript -->
        </div>
    </div>
    
    <!-- Form per aggiungere manga -->
    <div id="addMangaForm" class="form-popup">
        <h2>Aggiungi Nuovo Manga</h2>
        <form id="mangaForm">
            <div class="form-group">
                <label for="mangaTitle">Titolo:</label>
                <input type="text" id="mangaTitle" required>
            </div>
            <div class="form-group">
                <label for="mangaAuthor">Autore:</label>
                <input type="text" id="mangaAuthor" required>
            </div>
            <div class="form-group">
                <label for="mangaDescription">Descrizione:</label>
                <textarea id="mangaDescription" style="width: 100%; height: 100px;"></textarea>
            </div>
            <div class="form-group">
                <label for="mangaImage">URL Immagine:</label>
                <input type="text" id="mangaImage">
            </div>
            <button type="submit" class="admin-btn">Salva</button>
            <button type="button" class="admin-btn delete" onclick="closeForm('addMangaForm')">Annulla</button>
        </form>
    </div>
    
    <!-- Form per aggiungere volume -->
    <div id="addVolumeForm" class="form-popup">
        <h2>Aggiungi Nuovo Volume</h2>
        <form id="volumeForm">
            <div class="form-group">
                <label for="volumeManga">Manga:</label>
                <select id="volumeManga" required>
                    <!-- Popolato via JavaScript -->
                </select>
            </div>
            <div class="form-group">
                <label for="volumeNumber">Numero Volume:</label>
                <input type="number" id="volumeNumber" min="1" required>
            </div>
            <div class="form-group">
                <label for="volumePrice">Prezzo:</label>
                <input type="number" id="volumePrice" min="0" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="volumeStock">Quantità in Stock:</label>
                <input type="number" id="volumeStock" min="0" required>
            </div>
            <div class="form-group">
                <label for="volumeImage">URL Immagine:</label>
                <input type="text" id="volumeImage">
            </div>
            <button type="submit" class="admin-btn">Salva</button>
            <button type="button" class="admin-btn delete" onclick="closeForm('addVolumeForm')">Annulla</button>
        </form>
    </div>
    
    <!-- Form per eliminare manga -->
    <div id="deleteMangaForm" class="form-popup">
        <h2>Elimina Manga</h2>
        <form id="deleteMangaForm">
            <div class="form-group">
                <label for="mangaToDelete">Seleziona Manga:</label>
                <select id="mangaToDelete" required>
                    <!-- Popolato via JavaScript -->
                </select>
            </div>
            <button type="submit" class="admin-btn delete">Conferma Eliminazione</button>
            <button type="button" class="admin-btn" onclick="closeForm('deleteMangaForm')">Annulla</button>
        </form>
    </div>

    <script>
        // Funzioni per aprire/chiudere i form
        function openForm(formId) {
            document.getElementById(formId).style.display = 'block';
            if (formId === 'addVolumeForm' || formId === 'deleteMangaForm') {
                loadMangaForSelect();
            }
        }
        
        function closeForm(formId) {
            document.getElementById(formId).style.display = 'none';
        }
        
        // Carica i manga per i select
        function loadMangaForSelect() {
            fetch('getmangalist')
                .then(response => response.json())
                .then(data => {
                    const volumeMangaSelect = document.getElementById('volumeManga');
                    const deleteMangaSelect = document.getElementById('mangaToDelete');
                    
                    volumeMangaSelect.innerHTML = '';
                    deleteMangaSelect.innerHTML = '';
                    
                    data.forEach(manga => {
                        const option1 = document.createElement('option');
                        option1.value = manga.id;
                        option1.textContent = manga.title;
                        volumeMangaSelect.appendChild(option1);
                        
                        const option2 = document.createElement('option');
                        option2.value = manga.id;
                        option2.textContent = manga.title;
                        deleteMangaSelect.appendChild(option2);
                    });
                });
        }
        
        // Carica i prodotti per l'admin
        function loadAdminProducts(searchTerm = '') {
            fetch('getcatalog' + (searchTerm ? '?search=' + encodeURIComponent(searchTerm) : ''))
                .then(response => response.json())
                .then(data => {
                    const container = document.getElementById('adminProductsContainer');
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
                                <div class="product-actions">
                                    <button class="action-btn edit-btn" onclick="editProduct(${product.id})">Modifica</button>
                                    <button class="action-btn delete-btn" onclick="deleteProduct(${product.id})">Elimina</button>
                                </div>
                            </div>
                        `;
                        container.appendChild(productCard);
                    });
                });
        }
        
        // Funzioni per modificare/eliminare prodotti
        function editProduct(productId) {
            // Implementa la logica per modificare un prodotto
            alert('Modifica prodotto ' + productId);
        }
        
        function deleteProduct(productId) {
            if (confirm('Sei sicuro di voler eliminare questo volume?')) {
                fetch('deletevolume?id=' + productId, { method: 'POST' })
                    .then(response => {
                        if (response.ok) {
                            loadAdminProducts();
                        }
                    });
            }
        }
        
        // Gestione ricerca admin
        document.getElementById('adminSearch').addEventListener('input', function() {
            loadAdminProducts(this.value.trim());
        });
        
        // Inizializzazione
        loadAdminProducts();
    </script>
</body>
</html>