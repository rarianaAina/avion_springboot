<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Planning de Production</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Planning de Production</h1>
                <div class="flex gap-4">
                    <a href="?date=${date.minusDays(1)}" 
                       class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                        Jour précédent
                    </a>
                    <span class="bg-blue-100 text-blue-800 px-4 py-2 rounded">
                        <fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/>
                    </span>
                    <a href="?date=${date.plusDays(1)}" 
                       class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                        Jour suivant
                    </a>
                </div>
            </div>

            <form action="/production/planning/sauvegarder" method="post">
                <input type="hidden" name="date" value="${date}">
                
                <div class="overflow-x-auto">
                    <table class="min-w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Produit
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Stock actuel
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Prévision ventes
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Quantité à produire
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach items="${produits}" var="produit" varStatus="status">
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        ${produit.nom}
                                        <input type="hidden" name="produit[]" value="${produit.id}">
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        ${produit.quantiteStock}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        ${previsions[produit.id]}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <input type="number" name="quantite[]" 
                                               value="${planning[status.index].quantite}"
                                               class="border rounded px-2 py-1 w-24">
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="mt-6 flex justify-end">
                    <button type="submit" 
                            class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                        Sauvegarder le planning
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>