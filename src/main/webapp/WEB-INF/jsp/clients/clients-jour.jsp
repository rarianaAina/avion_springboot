<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clients du Jour</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Clients du Jour</h1>
                
                <!-- Formulaire de recherche par date -->
                <form action="/clients/jour" method="get" class="flex gap-4">
                    <div>
                        <input type="date" name="date" 
                               value="${param.date}"
                               class="border rounded-md p-2">
                    </div>
                    <button type="submit" 
                            class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                        Rechercher
                    </button>
                </form>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nom</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Prénom</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Téléphone</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Points Fidélité</th>
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
                                    <span class="px-2 py-1 text-xs rounded-full bg-green-100 text-green-800">
                                        ${client.pointsFidelite} points
                                    </span>
                                </td>
                                <td class="px-6 py-4">
                                    <a href="/clients/${client.id}" 
                                       class="text-blue-600 hover:text-blue-900">
                                        Détails
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