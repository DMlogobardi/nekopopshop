<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione</title>
    <link rel="stylesheet" href="frontend/style.css">

</head>
<body>
    <div class="register-container">
        <h1>Registrazione Utente</h1>
        
        <!-- Messaggi di errore con JSTL -->
        <c:if test="${not empty errors}">
            <div class="error-message">
                <c:choose>
                    <c:when test="${errors['class'].simpleName eq 'String'}">
                        ${errors}
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="error" items="${errors}">
                            ${error}<br>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
        
        <!-- Messaggio di successo -->
        <c:if test="${not empty register and register eq 'success'}">
            <div class="success-message">
                Registrazione completata con successo! Ora puoi effettuare il login.
            </div>
        </c:if>
        
        <form id="registrationForm" method="POST" action="register">
            <div class="two-columns">
                <div class="form-group">
                    <label for="name">Nome:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="cognome">Cognome:</label>
                    <input type="text" id="cognome" name="cognome" required>
                </div>
            </div>

            <div class="form-group">
                <label for="nascita">Data di nascita (gg-mm-aaaa):</label>
                <input type="text" id="nascita" name="nascita" 
                       pattern="\d{2}-\d{2}-\d{4}" 
                       placeholder="gg-mm-aaaa"
                       required>
                <small>Formato richiesto: gg-mm-aaaa (es. 15-05-1990)</small>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="cf">Codice Fiscale:</label>
                <input type="text" id="cf" name="cf" required>
            </div>

            <div class="two-columns">
                <div class="form-group">
                    <label for="via">Via:</label>
                    <input type="text" id="via" name="via" required>
                </div>
                <div class="form-group">
                    <label for="civico">Civico:</label>
                    <input type="text" id="civico" name="civico" required>
                </div>
            </div>

            <div class="form-group">
                <label for="cap">CAP:</label>
                <input type="text" id="cap" name="cap" required>
            </div>

            <div class="two-columns">
                <div class="form-group">
                    <label for="prefisso">Prefisso:</label>
                    <input type="text" id="prefisso" name="prefisso" required>
                </div>
                <div class="form-group">
                    <label for="numero">Numero di telefono:</label>
                    <input type="text" id="numero" name="numero" required>
                </div>
            </div>

            <div class="two-columns">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="nick">Nickname:</label>
                    <input type="text" id="nick" name="nick" required>
                </div>
            </div>

            <button type="submit">Registrati</button>
        </form>

        <div class="login-link">
            Hai già un account? <a href="login.jsp">Accedi</a>
        </div>
    </div>

    <script>
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Validazione manuale della data
            const dateInput = document.getElementById('nascita').value;
            const datePattern = /^\d{2}-\d{2}-\d{4}$/;
            
            if (!datePattern.test(dateInput)) {
                alert('Per favore inserisci la data nel formato gg-mm-aaaa');
                return;
            }
            
            // Verifica che la data sia valida
            const dateParts = dateInput.split('-');
            const day = parseInt(dateParts[0], 10);
            const month = parseInt(dateParts[1], 10);
            const year = parseInt(dateParts[2], 10);
            
            const date = new Date(year, month - 1, day);
            if (date.getFullYear() !== year || 
                date.getMonth() !== month - 1 || 
                date.getDate() !== day) {
                alert('Data non valida. Inserisci una data esistente.');
                return;
            }
            
            const formData = {
                name: document.getElementById('name').value,
                cognome: document.getElementById('cognome').value,
                nascita: dateInput, // Invia la data nel formato gg-mm-aaaa
                email: document.getElementById('email').value,
                cf: document.getElementById('cf').value,
                via: document.getElementById('via').value,
                civico: document.getElementById('civico').value,
                cap: document.getElementById('cap').value,
                prefisso: document.getElementById('prefisso').value,
                numero: document.getElementById('numero').value,
                password: document.getElementById('password').value,
                nick: document.getElementById('nick').value
            };
            
            fetch('register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = 'login.jsp?register=success';
                } else {
                    window.location.reload();
                }
            })
            .catch(error => {
                console.error('Error:', error);
                window.location.reload();
            });
        });
    </script>
</body>
</html>