<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Ingrédients</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Liste des Ingrédients</h1>
                <a href="/ingredients/nouveau" 
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    Nouvel Ingrédient
                </a>
            </div>

            <div class="mb-6">
                <form action="/ingredients" method="get" class="flex gap-4">
                    <input type="text" name="search" 
                           class="flex-1 border rounded px-3 py-2"
                           placeholder="Rechercher un ingrédient...">
                    <button type="submit" 
                            class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                        Rechercher
                    </button>
                </form>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full table-auto">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Unité</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Stock</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Seuil Alerte</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prix Unitaire</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach items="${ingredients}" var="ingredient">
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">${ingredient.nom}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${ingredient.unite}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                                        ${ingredient.quantiteStock <= ingredient.seuilAlerte ? 'bg-red-100 text-red-800' : 'bg-green-100 text-green-800'}">
                                        ${ingredient.quantiteStock}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">${ingredient.seuilAlerte}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${ingredient.prixUnitaire}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <a href="/ingredients/editer/${ingredient.id}" 
                                       class="text-indigo-600 hover:text-indigo-900 mr-4">Éditer</a>
                                    <a href="/ingredients/supprimer/${ingredient.id}" 
                                       class="text-red-600 hover:text-red-900"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet ingrédient ?')">
                                        Supprimer
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>