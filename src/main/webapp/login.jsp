<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nekopop shop</title>
</head>
<body>
    <div>
        <form action="login" method="post">
            username: <input type="text" name="nick"><br>
            password: <input type="password" name="pass"><br>
            <input type="submit" value="Submit">
        </form>
        <% if(request.getAttribute("errors") != null) {%>
            <p>non puoi loggare</p>
        <% } else { %>
            <p>success</p>
        <%}%>
    </div>
</body>
</html>