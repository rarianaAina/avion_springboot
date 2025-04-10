<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Statistiques</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <!-- KPIs -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Ventes du Jour</h3>
                <p class="text-3xl font-bold">${statistiques.ventesJour} €</p>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Ventes du Mois</h3>
                <p class="text-3xl font-bold">${statistiques.ventesMois} €</p>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Nombre de Clients</h3>
                <p class="text-3xl font-bold">${statistiques.nombreClients}</p>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Moyenne Points Fidélité</h3>
                <p class="text-3xl font-bold">${statistiques.moyennePointsFidelite}</p>
            </div>
        </div>

        <!-- Graphiques -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Évolution des Ventes</h2>
                <canvas id="evolutionVentes"></canvas>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Top Produits</h2>
                <canvas id="topProduits"></canvas>
            </div>
        </div>

        <!-- Tableau récapitulatif -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold mb-4">Top 10 Produits</h2>
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Produit</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Quantité Vendue</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Chiffre d'Affaires</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <c:forEach items="${statistiques.topProduits}" var="produit">
                            <tr>
                                <td class="px-6 py-4">${produit.nom}</td>
                                <td class="px-6 py-4">${produit.quantite}</td>
                                <td class="px-6 py-4">${produit.chiffreAffaires} €</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Récupération des données de statistiques
        const ventesJour = ${statistiques.ventesJour};
        const ventesMois = ${statistiques.ventesMois};

        // Configuration du graphique des ventes globales
        const ctxVentes = document.getElementById('graphVentes').getContext('2d');
        new Chart(ctxVentes, {
            type: 'bar',
            data: {
                labels: ['Ventes du Jour', 'Ventes du Mois'],
                datasets: [{
                    label: 'Chiffre d\'Affaires',
                    data: [ventesJour, ventesMois],
                    backgroundColor: 'rgb(59, 130, 246)',
                    borderColor: 'rgb(59, 130, 246)',
                    borderWidth: 1
                }]
            }
        });

        // Configuration du graphique des top produits
        const ctxTopProduits = document.getElementById('graphTopProduits').getContext('2d');
        new Chart(ctxTopProduits, {
            type: 'pie',
            data: {
                labels: ${statistiques.topProduitsLabels},
                datasets: [{
                    label: 'Top Produits par Chiffre d\'Affaires',
                    data: ${statistiques.topProduitsData},
                    backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 205, 86)']
                }]
            }
        });
    </script>

</body>
</html>