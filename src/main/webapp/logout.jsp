<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout in corso...</title>
    <script>
        function performLogout() {
            fetch('${pageContext.request.contextPath}/common/logout', {
                method: 'POST',
                credentials: 'include'
            })
            .then(response => {
                // Dopo il logout, reindirizza a index.jsp
                window.location.href = '${pageContext.request.contextPath}/index.jsp';
            })
            .catch(error => {
                console.error('Errore durante il logout:', error);
                window.location.href = '${pageContext.request.contextPath}/index.jsp';
            });
        }
        
        // Esegui la funzione al caricamento della pagina
        window.onload = performLogout;
    </script>
</head>
<body>
    <div style="text-align: center; margin-top: 50px;">
        <h2>Logout in corso...</h2>
        <p>Stai per essere reindirizzato alla pagina principale.</p>
        
        <noscript>
            <form action="${pageContext.request.contextPath}/common/logout" method="post">
                <p>JavaScript è disabilitato. Clicca il pulsante per effettuare il logout.</p>
                <input type="submit" value="Logout" />
            </form>
        </noscript>
    </div>
</body>
</html>