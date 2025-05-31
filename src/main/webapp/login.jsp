<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="frontend/style.css">

</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        
        <%-- Mostra messaggi di errore --%>
        <c:if test="${not empty errors}">
            <div class="error-message">
                <c:forEach var="error" items="${errors}">
                    ${error}<br>
                </c:forEach>
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="error-message">
                <c:forEach var="err" items="${error}">
                    ${err}<br>
                </c:forEach>
            </div>
        </c:if>
        
        <form id="loginForm" method="POST" action="login">
            <div class="form-group">
                <label for="nick">Nickname:</label>
                <input type="text" id="nick" name="nick" required>
            </div>
            
            <div class="form-group">
                <label for="pass">Password:</label>
                <input type="password" id="pass" name="pass" required>
            </div>
            
            <button type="submit">Accedi</button>
        </form>
        
        <div class="register-link">
            Non hai un account? <a href="register.jsp">Registrati</a>
        </div>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const form = this;
            const formData = new FormData(form);
            
            fetch(form.action, {
                method: 'POST',
                body: new URLSearchParams(formData),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                }
            })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error('Network response was not ok');
            })
            .then(data => {
                if (data.satus === "success") {
                    window.location.href = 'index.jsp';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // Ricarica la pagina per mostrare gli errori gestiti dalla servlet
                window.location.reload();
            });
        });
    </script>
</body>
</html>