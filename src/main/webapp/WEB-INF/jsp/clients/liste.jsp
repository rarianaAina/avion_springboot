<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Clients</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Liste des Clients</h1>
                <a href="/clients/nouveau" 
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    Nouveau Client
                </a>
            </div>

            <!-- Formulaire de recherche -->
            <div class="mb-6 bg-gray-50 p-4 rounded-lg">
                <h2 class="text-lg font-semibold mb-4">Recherche</h2>
                <form action="/clients" method="get" class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Nom ou Prénom
                        </label>
                        <input type="text" name="search" 
                               class="w-full border rounded-md p-2"
                               placeholder="Rechercher...">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Points minimum
                        </label>
                        <input type="number" name="pointsMin" 
                               class="w-full border rounded-md p-2"
                               placeholder="Points minimum...">
                    </div>
                    <div class="flex items-end">
                        <button type="submit" 
                                class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                            Rechercher
                        </button>
                    </div>
                </form>
            </div>

            <!-- Tableau des clients -->
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nom</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Prénom</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Téléphone</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Points</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td class="px-6 py-4">${client.nom}</td>
                                <td class="px-6 py-4">${client.prenom}</td>
                                <td class="px-6 py-4">${client.email}</td>
                                <td class="px-6 py-4">${client.telephone}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                        ${client.pointsFidelite} points
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <a href="/clients/${client.id}" 
                                       class="text-blue-600 hover:text-blue-900 mr-4">
                                        Détails
                                    </a>
                                    <a href="/clients/editer/${client.id}" 
                                       class="text-yellow-600 hover:text-yellow-900 mr-4">
                                        Éditer
                                    </a>
                                    <a href="/clients/supprimer/${client.id}" 
                                       class="text-red-600 hover:text-red-900"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce client ?')">
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