<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NekoPopShop - Catalogo Manga</title>
    <link rel="stylesheet" href="frontend/style.css">

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