<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nouvelle Promotion</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-lg p-6">
            <h1 class="text-2xl font-bold text-gray-800 mb-6">
                ${promotion.id == null ? 'Nouvelle Promotion' : 'Modifier Promotion'}
            </h1>

            <form:form action="/promotions/sauvegarder" method="post" modelAttribute="promotion">
                <form:hidden path="id"/>

                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Nom de la promotion</label>
                    <form:input path="nom" 
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Description</label>
                    <form:textarea path="description" 
                                 class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                </div>

                <div class="grid grid-cols-2 gap-4 mb-4">
                    <div>
                        <label class="block text-gray-700 text-sm font-bold mb-2">Date de début</label>
                        <form:input path="dateDebut" type="date"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                    </div>
                    <div>
                        <label class="block text-gray-700 text-sm font-bold mb-2">Date de fin</label>
                        <form:input path="dateFin" type="date"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Type de réduction</label>
                    <form:select path="typeReduction" 
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <form:option value="POURCENTAGE">Pourcentage</form:option>
                        <form:option value="MONTANT_FIXE">Montant fixe</form:option>
                    </form:select>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Valeur de la réduction</label>
                    <form:input path="valeurReduction" type="number" step="0.01"
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"/>
                </div>

                <div class="mb-6">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Produits concernés</label>
                    <div class="grid grid-cols-2 gap-2 max-h-60 overflow-y-auto">
                        <c:forEach items="${produits}" var="produit">
                            <div class="flex items-center">
                                <input type="checkbox" name="produits" value="${produit.id}"
                                       class="mr-2">
                                <label>${produit.nom}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="flex items-center justify-between">
                    <button type="submit" 
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Sauvegarder
                    </button>
                    <a href="/promotions" 
                       class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annuler
                    </a>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>