<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mouvements de Stock</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h1 class="text-2xl font-bold mb-6">Historique des Mouvements de Stock</h1>

            <!-- Filtres -->
            <div class="mb-6">
                <form class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Ingrédient</label>
                        <select name="ingredient" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                            <option value="">Tous</option>
                            <c:forEach items="${ingredients}" var="ingredient">
                                <option value="${ingredient.id}">${ingredient.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Type</label>
                        <select name="type" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                            <option value="">Tous</option>
                            <option value="ENTREE">Entrée</option>
                            <option value="SORTIE">Sortie</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Date début</label>
                        <input type="date" name="dateDebut" 
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Date fin</label>
                        <input type="date" name="dateFin" 
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                </form>
            </div>

            <!-- Tableau des mouvements -->
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Ingrédient</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Type</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Quantité</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Motif</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach items="${mouvements}" var="mouvement">
                            <tr>
                                <td class="px-6 py-4">${mouvement.date}</td>
                                <td class="px-6 py-4">${mouvement.ingredient.nom}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 text-xs rounded-full 
                                        ${mouvement.type == 'ENTREE' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                                        ${mouvement.type}
                                    </span>
                                </td>
                                <td class="px-6 py-4">
                                    ${mouvement.quantite} ${mouvement.ingredient.unite}
                                </td>
                                <td class="px-6 py-4">${mouvement.motif}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>