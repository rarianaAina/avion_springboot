<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Statistiques Vendeur</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">Statistiques Vendeur</h1>
            <a href="/vendeurs/nouveau" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded">
                Nouveau Vendeur
            </a>
        </div>

        <form action="/vendeurs/statistiques" method="get" class="flex flex-wrap gap-4 mb-6">
            <select name="vendeurId" class="border rounded-md p-2">
                <option value="">Tous les vendeurs</option>
                <c:forEach items="${vendeurs}" var="vendeur">
                    <option value="${vendeur.id}" ${vendeur.id == selectedVendeurId ? 'selected' : ''}>
                            ${vendeur.nom} ${vendeur.prenom}
                    </option>
                </c:forEach>
            </select>

            <select name="genre" class="border rounded-md p-2">
                <option value="">Tous les genres</option>
                <option value="HOMME" ${param.genre == 'HOMME' ? 'selected' : ''}>Homme</option>
                <option value="FEMME" ${param.genre == 'FEMME' ? 'selected' : ''}>Femme</option>
            </select>

            <input type="date" name="dateDebut"
                   value="${dateDebut}"
                   class="border rounded-md p-2">

            <input type="date" name="dateFin"
                   value="${dateFin}"
                   class="border rounded-md p-2">

            <button type="submit"
                    class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                Voir les statistiques
            </button>
        </form>

        <c:if test="${empty vendeurs}">
            <div class="text-center py-8">
                <p class="text-gray-600">Aucun vendeur n'est enregistré dans le système.</p>
            </div>
        </c:if>

        <c:if test="${not empty statistiques}">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div class="bg-blue-50 p-6 rounded-lg">
                    <h3 class="text-lg font-semibold mb-2">Total des Ventes</h3>
                    <p class="text-3xl font-bold text-blue-600">${statistiques.totalVentes} €</p>
                </div>

                <div class="bg-green-50 p-6 rounded-lg">
                    <h3 class="text-lg font-semibold mb-2">Total des Commissions (5%)</h3>
                    <p class="text-3xl font-bold text-green-600">${statistiques.totalCommissions} €</p>
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vendeur</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Genre</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Montant</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Commission</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Client</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${statistiques.ventes}" var="vente">
                        <tr>
                            <td class="px-6 py-4">${vente.dateVente}</td>
                            <td class="px-6 py-4">${vente.vendeur.nom} ${vente.vendeur.prenom}</td>
                            <td class="px-6 py-4">${vente.vendeur.genre}</td>
                            <td class="px-6 py-4">${vente.montantTotal} €</td>
                            <td class="px-6 py-4">${vente.commissionVendeur} €</td>
                            <td class="px-6 py-4">
                                    ${vente.client != null ? vente.client.nom.concat(' ').concat(vente.client.prenom) : 'Client anonyme'}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>