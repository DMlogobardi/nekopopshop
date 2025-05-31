<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NekoPopShop - Il tuo Profilo</title>
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
        
        /* Stili specifici per la pagina profilo */
        .profile-container {
            display: flex;
            max-width: 1200px;
            margin: 30px auto;
            gap: 30px;
        }
        
        .profile-sidebar {
            width: 250px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        
        .profile-content {
            flex: 1;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }
        
        .profile-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .profile-menu li {
            margin-bottom: 10px;
        }
        
        .profile-menu a {
            display: block;
            padding: 10px;
            color: #2c3e50;
            text-decoration: none;
            border-radius: 4px;
        }
        
        .profile-menu a:hover, .profile-menu a.active {
            background-color: #3498db;
            color: white;
        }
        
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .profile-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #ecf0f1;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            font-size: 30px;
            color: #7f8c8d;
        }
        
        .profile-info h2 {
            margin: 0;
            color: #2c3e50;
        }
        
        .profile-info p {
            margin: 5px 0 0;
            color: #7f8c8d;
        }
        
        /* Form modifica dati */
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .btn {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        
        .btn:hover {
            background-color: #2980b9;
        }
        
        /* Sezione ordini */
        .orders-list {
            margin-top: 30px;
        }
        
        .order-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .order-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .order-id {
            font-weight: bold;
            color: #2c3e50;
        }
        
        .order-date {
            color: #7f8c8d;
        }
        
        .order-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
        }
        
        .status-completed {
            background-color: #2ecc71;
            color: white;
        }
        
        .status-pending {
            background-color: #f39c12;
            color: white;
        }
        
        .order-items {
            margin-top: 15px;
        }
        
        .order-item {
            display: flex;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #f5f5f5;
        }
        
        .order-item:last-child {
            border-bottom: none;
        }
        
        .item-image {
            width: 60px;
            height: 80px;
            object-fit: cover;
            margin-right: 15px;
        }
        
        .item-details {
            flex: 1;
        }
        
        .item-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .item-volume {
            color: #7f8c8d;
            font-size: 14px;
        }
        
        .item-price {
            color: #2c3e50;
            font-weight: bold;
        }
        
        .order-total {
            text-align: right;
            margin-top: 15px;
            font-weight: bold;
            font-size: 18px;
        }
        
        /* Tab sezioni */
        .tab-content {
            display: none;
        }
        
        .tab-content.active {
            display: block;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <a href="index.jsp" class="logo">NekoPopShop</a>
        <div class="user-section">
            <a href="profile.jsp" class="profile-icon">Profilo</a>
            <a href="cart.jsp" class="cart-icon">Carrello (${not empty sessionScope.cart ? sessionScope.cart.contenuti.size() : 0})</a>
            <a href="logout">Logout</a>
        </div>
    </div>
    
    <!-- Contenuto principale -->
    <div class="profile-container">
        <!-- Sidebar -->
        <div class="profile-sidebar">
            <ul class="profile-menu">
                <li><a href="#personal-data" class="active" onclick="showTab('personal-data')">Dati Personali</a></li>
                <li><a href="#orders" onclick="showTab('orders')">I miei Ordini</a></li>
                <li><a href="#addresses" onclick="showTab('addresses')">Indirizzi</a></li>
                <li><a href="#payment-methods" onclick="showTab('payment-methods')">Metodi di Pagamento</a></li>
            </ul>
        </div>
        
        <!-- Contenuto -->
        <div class="profile-content">
            <!-- Intestazione profilo -->
            <div class="profile-header">
                <div class="profile-avatar">
                    ${sessionScope.user.nome.charAt(0)}${sessionScope.user.cognome.charAt(0)}
                </div>
                <div class="profile-info">
                    <h2>${sessionScope.user.nome} ${sessionScope.user.cognome}</h2>
                    <p>Membro dal ${sessionScope.user.dataRegistrazione}</p>
                </div>
            </div>
            
            <!-- Sezione Dati Personali -->
            <div id="personal-data" class="tab-content active">
                <h3>Modifica Dati Personali</h3>
                <form id="personalDataForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input type="text" id="nome" name="nome" value="${sessionScope.user.nome}" required>
                        </div>
                        <div class="form-group">
                            <label for="cognome">Cognome</label>
                            <input type="text" id="cognome" name="cognome" value="${sessionScope.user.cognome}" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${sessionScope.user.email}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="dataNascita">Data di Nascita</label>
                        <input type="text" id="dataNascita" name="dataNascita" value="${sessionScope.user.dataNascita}" placeholder="gg-mm-aaaa" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="codiceFiscale">Codice Fiscale</label>
                        <input type="text" id="codiceFiscale" name="codiceFiscale" value="${sessionScope.user.codiceFiscale}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="telefono">Telefono</label>
                        <input type="text" id="telefono" name="telefono" value="${sessionScope.user.telefono}" required>
                    </div>
                    
                    <button type="submit" class="btn">Salva Modifiche</button>
                </form>
                
                <h3 style="margin-top: 40px;">Cambia Password</h3>
                <form id="changePasswordForm">
                    <div class="form-group">
                        <label for="currentPassword">Password Attuale</label>
                        <input type="password" id="currentPassword" name="currentPassword" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="newPassword">Nuova Password</label>
                        <input type="password" id="newPassword" name="newPassword" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Conferma Nuova Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    
                    <button type="submit" class="btn">Cambia Password</button>
                </form>
            </div>
            
            <!-- Sezione Ordini -->
            <div id="orders" class="tab-content">
                <h3>I tuoi Ordini</h3>
                
                <c:choose>
                    <c:when test="${not empty requestScope.orders}">
                        <div class="orders-list">
                            <c:forEach var="order" items="${requestScope.orders}">
                                <div class="order-card">
                                    <div class="order-header">
                                        <div>
                                            <span class="order-id">Ordine #${order.id}</span>
                                            <span class="order-date"> - ${order.data}</span>
                                        </div>
                                        <span class="order-status ${order.stato == 'COMPLETATO' ? 'status-completed' : 'status-pending'}">
                                            ${order.stato}
                                        </span>
                                    </div>
                                    
                                    <div class="order-items">
                                        <c:forEach var="item" items="${order.items}">
                                            <div class="order-item">
                                                <img src="${item.immagine}" alt="${item.titolo}" class="item-image">
                                                <div class="item-details">
                                                    <div class="item-title">${item.titolo}</div>
                                                    <div class="item-volume">Volume ${item.volume}</div>
                                                    <div class="item-price">€${item.prezzo}</div>
                                                </div>
                                                <div>Quantità: ${item.quantita}</div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    
                                    <div class="order-total">
                                        Totale: €${order.totale}
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p>Non hai ancora effettuato nessun ordine.</p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- Sezione Indirizzi -->
            <div id="addresses" class="tab-content">
                <h3>I tuoi Indirizzi</h3>
                
                <div class="address-list">
                    <c:forEach var="address" items="${requestScope.addresses}">
                        <div class="address-card">
                            <p><strong>${address.via} ${address.civico}</strong></p>
                            <p>${address.cap} - ${address.citta}</p>
                            <p>${address.provincia} (${address.nazione})</p>
                            <button class="btn">Modifica</button>
                            <button class="btn">Elimina</button>
                        </div>
                    </c:forEach>
                    
                    <button class="btn" style="margin-top: 20px;">Aggiungi Nuovo Indirizzo</button>
                </div>
            </div>
            
            <!-- Sezione Metodi di Pagamento -->
            <div id="payment-methods" class="tab-content">
                <h3>I tuoi Metodi di Pagamento</h3>
                
                <div class="payment-methods-list">
                    <c:forEach var="payment" items="${requestScope.payments}">
                        <div class="payment-card">
                            <p><strong>${payment.tipo}</strong></p>
                            <p>**** **** **** ${payment.numero.substring(12)}</p>
                            <p>Scadenza: ${payment.scadenza}</p>
                            <button class="btn">Modifica</button>
                            <button class="btn">Elimina</button>
                        </div>
                    </c:forEach>
                    
                    <button class="btn" style="margin-top: 20px;">Aggiungi Nuovo Metodo</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Gestione tab
        function showTab(tabId) {
            // Nascondi tutti i tab
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Mostra il tab selezionato
            document.getElementById(tabId).classList.add('active');
            
            // Aggiorna menu laterale
            document.querySelectorAll('.profile-menu a').forEach(link => {
                link.classList.remove('active');
            });
            document.querySelector(`.profile-menu a[href="#${tabId}"]`).classList.add('active');
        }
        
        // Gestione form dati personali
        document.getElementById('personalDataForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = {
                nome: document.getElementById('nome').value,
                cognome: document.getElementById('cognome').value,
                email: document.getElementById('email').value,
                dataNascita: document.getElementById('dataNascita').value,
                codiceFiscale: document.getElementById('codiceFiscale').value,
                telefono: document.getElementById('telefono').value
            };
            
            fetch('updateprofile', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (response.ok) {
                    alert('Dati aggiornati con successo!');
                    window.location.reload();
                } else {
                    alert('Errore durante l\'aggiornamento dei dati');
                }
            });
        });
        
        // Gestione form cambio password
        document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const currentPass = document.getElementById('currentPassword').value;
            const newPass = document.getElementById('newPassword').value;
            const confirmPass = document.getElementById('confirmPassword').value;
            
            if (newPass !== confirmPass) {
                alert('Le password non coincidono!');
                return;
            }
            
            fetch('changepassword', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    currentPassword: currentPass,
                    newPassword: newPass
                })
            })
            .then(response => {
                if (response.ok) {
                    alert('Password cambiata con successo!');
                    document.getElementById('changePasswordForm').reset();
                } else {
                    alert('Errore durante il cambio password. Verifica la password attuale.');
                }
            });
        });
        
        // Carica gli ordini all'avvio se siamo nella sezione ordini
        if (window.location.hash === '#orders') {
            showTab('orders');
        }
    </script>
</body>
</html>