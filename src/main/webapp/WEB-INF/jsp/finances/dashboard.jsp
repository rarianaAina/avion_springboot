<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Financier</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <!-- KPIs -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">CA Journalier</h3>
                <p class="text-3xl font-bold">${chiffreAffairesJour} €</p>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">CA Mensuel</h3>
                <p class="text-3xl font-bold">${chiffreAffairesMois} €</p>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-gray-500 text-sm uppercase">Commandes du Jour</h3>
                <p class="text-3xl font-bold">${nombreCommandes}</p>
            </div>
        </div>

        <!-- Graphiques -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Évolution du CA</h2>
                <canvas id="evolutionCA"></canvas>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Top Produits</h2>
                <canvas id="topProduits"></canvas>
            </div>
        </div>

        <!-- Tableau des ventes -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold mb-4">Dernières Ventes</h2>
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Heure</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Montant</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Paiement</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Client</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <c:forEach items="${dernieresVentes}" var="vente">
                            <tr>
                                <td class="px-6 py-4">${vente.heure}</td>
                                <td class="px-6 py-4">${vente.montant} €</td>
                                <td class="px-6 py-4">${vente.modePaiement}</td>
                                <td class="px-6 py-4">${vente.client}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Configuration des graphiques
        const ctxEvolution = document.getElementById('evolutionCA').getContext('2d');
        new Chart(ctxEvolution, {
            type: 'line',
            data: {
                labels: ${evolutionCA.labels},
                datasets: [{
                    label: 'Chiffre d\'affaires',
                    data: ${evolutionCA.data},
                    borderColor: 'rgb(59, 130, 246)',
                    tension: 0.1
                }]
            }
        });

        const ctxTop = document.getElementById('topProduits').getContext('2d');
        new Chart(ctxTop, {
            type: 'bar',
            data: {
                labels: ${topProduits.labels},
                datasets: [{
                    label: 'Ventes',
                    data: ${topProduits.data},
                    backgroundColor: 'rgb(59, 130, 246)'
                }]
            }
        });
    </script>
</body>
</html>