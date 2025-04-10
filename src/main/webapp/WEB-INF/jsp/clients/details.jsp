<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Détails Client</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Informations client -->
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Informations Client</h2>
                <div class="space-y-3">
                    <p><span class="font-medium">Nom:</span> ${client.nom} ${client.prenom}</p>
                    <p><span class="font-medium">Email:</span> ${client.email}</p>
                    <p><span class="font-medium">Téléphone:</span> ${client.telephone}</p>
                    <p><span class="font-medium">Points fidélité:</span> 
                        <span class="bg-green-100 text-green-800 px-2 py-1 rounded">
                            ${client.pointsFidelite} points
                        </span>
                    </p>
                </div>
            </div>

            <!-- Historique des achats -->
            <div class="bg-white rounded-lg shadow-lg p-6 lg:col-span-2">
                <h2 class="text-xl font-bold mb-4">Historique des Achats</h2>
                <div class="overflow-x-auto">
                    <table class="min-w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Produits</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Total</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            <c:forEach items="${historique}" var="achat">
                                <tr>
                                    <td class="px-6 py-4">${achat.date}</td>
                                    <td class="px-6 py-4">
                                        <ul class="list-disc list-inside">
                                            <c:forEach items="${achat.produits}" var="produit">
                                                <li>${produit.nom} (${produit.quantite})</li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td class="px-6 py-4">${achat.montant} €</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Suggestions personnalisées -->
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Suggestions Personnalisées</h2>
                <div class="space-y-4">
                    <c:forEach items="${suggestions}" var="suggestion">
                        <div class="bg-gray-50 p-4 rounded">
                            <h3 class="font-semibold">${suggestion.produit.nom}</h3>
                            <p class="text-sm text-gray-600">${suggestion.raison}</p>
                            <p class="mt-2 text-green-600 font-medium">${suggestion.produit.prix} €</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>