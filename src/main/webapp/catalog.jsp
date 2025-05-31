<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NekoPopShop - Catalogo Manga</title>
    <style>
        /* Stili ereditati da index.jsp */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #2c3e50;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #ecf0f1;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 20px;
        }
        
        .nav-links a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: 500;
        }
        
        .user-section {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .cart-icon, .profile-icon {
            color: #ecf0f1;
            cursor: pointer;
            font-size: 20px;
            text-decoration: none;
        }
        
        /* Stili specifici per la pagina catalogo */
        .catalog-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .search-section {
            background-color: #3498db;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        
        .search-bar {
            width: 100%;
            padding: 12px;
            border-radius: 25px;
            border: none;
            font-size: 16px;
        }
        
        .filter-section {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .filter-btn {
            padding: 8px 15px;
            background-color: #ecf0f1;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }
        
        .filter-btn.active {
            background-color: #2c3e50;
            color: white;
        }
        
        .filter-btn:hover {
            background-color: #bdc3c7;
        }
        
        .alphabet-nav {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 5px;
            margin-bottom: 20px;
            position: sticky;
            top: 0;
            background: white;
            padding: 10px 0;
            z-index: 100;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .alphabet-link {
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
            color: #2c3e50;
            font-weight: bold;
        }
        
        .alphabet-link:hover, .alphabet-link.active {
            background-color: #3498db;
            color: white;
        }
        
        .manga-section {
            margin-bottom: 40px;
        }
        
        .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }
        
        .section-letter {
            font-size: 2rem;
            font-weight: bold;
            color: #2c3e50;
            margin-right: 15px;
            width: 40px;
            text-align: center;
        }
        
        .section-title {
            font-size: 1.5rem;
            color: #2c3e50;
        }
        
        .manga-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .manga-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .manga-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .manga-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        
        .manga-info {
            padding: 15px;
        }
        
        .manga-title {
            font-weight: bold;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .manga-volumes {
            color: #7f8c8d;
            font-size: 14px;
        }
        
        .manga-price {
            color: #e74c3c;
            font-weight: bold;
            margin-top: 10px;
        }
        
        .volume-info {
            font-size: 12px;
            color: #3498db;
            margin-top: 5px;
        }
        
        .no-results {
            text-align: center;
            padding: 50px;
            color: #7f8c8d;
            font-size: 1.2rem;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 30px;
        }
        
        .page-btn {
            padding: 8px 12px;
            border: 1px solid #ddd;
            background: white;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .page-btn.active {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
        }
        
        @media (max-width: 768px) {
            .manga-grid {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <a href="index.jsp" class="logo">NekoPopShop</a>
        
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="catalog.jsp" class="active">Catalogo</a>
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
    
    <!-- Contenuto principale -->
    <div class="catalog-container">
        <!-- Barra di ricerca -->
        <div class="search-section">
            <form id="searchForm" method="GET" action="getcatalog">
                <input type="text" class="search-bar" name="serch" placeholder="Cerca manga per nome..." 
                       value="${param.serch != null ? param.serch : ''}">
                <input type="hidden" name="filter" id="filterInput" value="${param.filter != null ? param.filter : ''}">
                <input type="hidden" name="page" id="pageInput" value="${param.page != null ? param.page : 0}">
            </form>
        </div>
        
        <!-- Filtri -->
        <div class="filter-section">
            <button class="filter-btn ${empty param.filter ? 'active' : ''}" 
                    onclick="setFilter('')">Tutti</button>
            <button class="filter-btn ${param.filter == 'volumi' ? 'active' : ''}" 
                    onclick="setFilter('volumi')">Volumi</button>
            <button class="filter-btn ${param.filter == 'nome' ? 'active' : ''}" 
                    onclick="setFilter('nome')">Per Nome</button>
        </div>
        
        <!-- Navigazione alfabetica -->
        <div class="alphabet-nav">
            <a href="getcatalog?serch=${param.serch}&filter=${param.filter}&page=0" 
               class="alphabet-link ${param.page == null || param.page == 0 ? 'active' : ''}">Tutti</a>
            <c:forEach var="letter" items="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z">
                <a href="getcatalog?serch=${param.serch}&filter=${param.filter}&page=0&letter=${letter}" 
                   class="alphabet-link ${param.letter == letter ? 'active' : ''}">${letter}</a>
            </c:forEach>
        </div>
        
        <!-- Sezioni manga -->
        <c:choose>
            <c:when test="${not empty prodotti || not empty volumi}">
                <!-- Sezione Prodotti (Manga) -->
                <c:if test="${not empty prodotti}">
                    <div class="manga-section">
                        <div class="section-header">
                            <h2 class="section-title">Manga</h2>
                        </div>
                        <div class="manga-grid">
                            <c:forEach var="prodotto" items="${prodotti}">
                                <a href="product.jsp?id=${prodotto.idProdotto}" class="manga-card">
                                    <img src="${prodotto.immagine != null ? prodotto.immagine : 'images/default-manga.jpg'}" 
                                         alt="${prodotto.nome}" class="manga-image">
                                    <div class="manga-info">
                                        <div class="manga-title">${prodotto.nome}</div>
                                        <div class="manga-volumes">
                                            <c:choose>
                                                <c:when test="${prodotto.prezzo != null}">
                                                    Serie completa
                                                </c:when>
                                                <c:otherwise>
                                                    Volumi disponibili
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <c:if test="${prodotto.prezzo != null}">
                                            <div class="manga-price">€${prodotto.prezzo}</div>
                                        </c:if>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                
                <!-- Sezione Volumi -->
                <c:if test="${not empty volumi}">
                    <div class="manga-section">
                        <div class="section-header">
                            <h2 class="section-title">Volumi</h2>
                        </div>
                        <div class="manga-grid">
                            <c:forEach var="volume" items="${volumi}">
                                <a href="volume.jsp?id=${volume.idVolume}" class="manga-card">
                                    <img src="${volume.immagine != null ? volume.immagine : 'images/default-manga.jpg'}" 
                                         alt="${volume.prodotto.nome} - Vol. ${volume.numero}" class="manga-image">
                                    <div class="manga-info">
                                        <div class="manga-title">${volume.prodotto.nome}</div>
                                        <div class="volume-info">Volume ${volume.numero}</div>
                                        <div class="manga-price">€${volume.prezzo}</div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                
                <!-- Paginazione -->
                <div class="pagination">
                    <c:if test="${param.page != null && param.page > 0}">
                        <a href="getcatalog?serch=${param.serch}&filter=${param.filter}&page=${param.page - 1}" 
                           class="page-btn">Precedente</a>
                    </c:if>
                    
                    <a href="getcatalog?serch=${param.serch}&filter=${param.filter}&page=${param.page + 1}" 
                       class="page-btn">Successivo</a>
                </div>
            </c:when>
            
            <c:when test="${not empty error}">
                <div class="no-results">${error}</div>
            </c:when>
            
            <c:otherwise>
                <div class="no-results">Nessun risultato trovato</div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        // Funzione per impostare il filtro e inviare il form
        function setFilter(filter) {
            document.getElementById('filterInput').value = filter;
            document.getElementById('pageInput').value = 0;
            document.getElementById('searchForm').submit();
        }
        
        // Gestione ricerca live (opzionale)
        document.querySelector('.search-bar').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('pageInput').value = 0;
                document.getElementById('searchForm').submit();
            }
        });
        
        // Se è presente un parametro letter nella URL, filtra i risultati
        const urlParams = new URLSearchParams(window.location.search);
        const letter = urlParams.get('letter');
        
        if (letter) {
            // Potresti aggiungere qui del JavaScript per evidenziare i prodotti che iniziano con quella lettera
            // O potresti affidarti al filtro lato server che hai già implementato
        }
    </script>
</body>
</html>