<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Historique des Prix</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <div class="mb-6">
            <a href="/" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                Retour à l'accueil
            </a>
        </div>
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Historique des Prix</h1>

        <form action="/prix/historique" method="get" class="mb-6 bg-gray-50 p-4 rounded-lg">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Produit</label>
                    <select name="produitId" class="w-full border rounded-md p-2">
                        <option value="">Tous les produits</option>
                        <c:forEach items="${produits}" var="produit">
                            <option value="${produit.id}">${produit.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Date début</label>
                    <input type="date" name="debut"
                           class="w-full border rounded-md p-2">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Date fin</label>
                    <input type="date" name="fin"
                           class="w-full border rounded-md p-2">
                </div>
            </div>

            <div class="mt-4 flex justify-end">
                <button type="submit"
                        class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    Rechercher
                </button>
            </div>
        </form>

        <div class="overflow-x-auto">
            <table class="min-w-full">
                <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Produit</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Ancien Prix</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nouveau Prix</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Variation</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach items="${historique}" var="h">
                    <tr>
                        <td class="px-6 py-4">${h.dateModification}</td>
                        <td class="px-6 py-4">${h.produit.nom}</td>
                        <td class="px-6 py-4">${h.ancienPrix} €</td>
                        <td class="px-6 py-4">${h.nouveauPrix} €</td>
                        <td class="px-6 py-4">
                            <c:set var="variation" value="${((h.nouveauPrix - h.ancienPrix) / h.ancienPrix) * 100}" />
                            <span class="px-2 py-1 rounded-full text-sm
                                        ${variation > 0 ? 'bg-red-100 text-red-800' : 'bg-green-100 text-green-800'}">
                                        ${String.format("%.2f", variation)}%
                                    </span>
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