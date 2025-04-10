<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Résultats</title>
</head>
<body>
<h2>Résultats de l'Importation</h2>

<table border="1">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Email</th>
        <th>Âge</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.age}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
<a href="/csv/upload">Retour</a>
</body>
</html>
