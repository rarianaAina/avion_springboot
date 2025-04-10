<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Stock</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <!-- KPIs -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Total Ingrédients</h3>
                <p class="text-3xl font-bold">${statistiques.totalIngredients}</p>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Ingrédients en Alerte</h3>
                <p class="text-3xl font-bold text-red-600">${statistiques.ingredientsEnAlerte}</p>
            </div>
        </div>

        <!-- Liste des ingrédients en alerte -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold mb-4">Ingrédients en Alerte</h2>
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nom</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Stock Actuel</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Seuil Alerte</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <c:forEach items="${ingredientsEnAlerte}" var="ingredient">
                            <tr>
                                <td class="px-6 py-4">${ingredient.nom}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 text-xs rounded-full bg-red-100 text-red-800">
                                        ${ingredient.quantiteStock} ${ingredient.unite}
                                    </span>
                                </td>
                                <td class="px-6 py-4">${ingredient.seuilAlerte} ${ingredient.unite}</td>
                                <td class="px-6 py-4">
                                    <button onclick="ouvrirModalAjustement(${ingredient.id})"
                                            class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded text-sm">
                                        Ajuster Stock
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal Ajustement Stock -->
    <div id="modalAjustement" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <h3 class="text-lg font-medium leading-6 text-gray-900 mb-4">Ajuster le Stock</h3>
                <form id="formAjustement" method="POST">
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700">Quantité à ajouter/retirer</label>
                        <input type="number" name="quantite" step="0.01"
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div class="flex justify-end space-x-3">
                        <button type="button" onclick="fermerModalAjustement()"
                                class="bg-gray-500 text-white px-4 py-2 rounded">
                            Annuler
                        </button>
                        <button type="submit"
                                class="bg-blue-500 text-white px-4 py-2 rounded">
                            Valider
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function ouvrirModalAjustement(ingredientId) {
            const modal = document.getElementById('modalAjustement');
            const form = document.getElementById('formAjustement');
            
            modal.classList.remove('hidden');
            form.action = `/stock/ajuster/${ingredientId}`;
        }
        
        function fermerModalAjustement() {
            document.getElementById('modalAjustement').classList.add('hidden');
        }
    </script>
</body>
</html>