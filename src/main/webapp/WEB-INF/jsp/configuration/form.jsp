<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Formulaire Ingrédient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-lg p-6">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">
            ${configuration.id == null ? 'Nouvelle configuration' : 'Modifier Configuration'}
        </h1>

        <form:form action="/reservations/sauvegarder" method="post" modelAttribute="configurations">
            <form:hidden path="id"/>

            <label for="vol">Choisir un vol :</label>
            <select name="volId" id="vol">
                <c:forEach var="vol" items="${vols}">
                    <option value="${vol.idVol}">
                            ${vol.idVol} - ${vol.villeDepart.nom} vers ${vol.villeArrivee.nom} le ${vol.dateVol}
                    </option>
                </c:forEach>
            </select>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Réduction adulte</label>
                <form:input path="adulte"
                            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Age adulte</label>
                <form:input path="ageAdulte"
                            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Enfant</label>
                <form:input path="enfant"
                            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
            </div>
            <div class="flex items-center justify-between">
                <button type="submit"
                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Sauvegarder
                </button>
                <a href=""
                   class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Annuler
                </a>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>