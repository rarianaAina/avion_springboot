<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recherche des Ventes</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Recherche Avancée des Ventes</h1>

        <!-- Formulaire de recherche -->
        <div class="mb-6 bg-gray-50 p-4 rounded-lg">
            <form action="/ventes/recherche" method="get" class="space-y-4">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Date de vente
                        </label>
                        <input type="date" name="date"
                               class="w-full border rounded-md p-2"
                               value="${param.date != null ? param.date : ''}">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Nom du produit
                        </label>
                        <input type="text" name="nomProduit"
                               class="w-full border rounded-md p-2"
                               placeholder="Nom du produit..."
                               value="${param.nomProduit != null ? param.nomProduit : ''}">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Catégorie
                        </label>
                        <select name="categorie" class="w-full border rounded-md p-2">
                            <option value="">Toutes les catégories</option>
                            <option value="PAIN" ${param.categorie == 'PAIN' ? 'selected' : ''}>Pain</option>
                            <option value="VIENNOISERIE" ${param.categorie == 'VIENNOISERIE' ? 'selected' : ''}>Viennoiserie</option>
                            <option value="PATISSERIE" ${param.categorie == 'PATISSERIE' ? 'selected' : ''}>Pâtisserie</option>
                        </select>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Prix minimum
                        </label>
                        <input type="number" name="prixMin" step="0.01"
                               class="w-full border rounded-md p-2"
                               placeholder="Prix minimum..."
                               value="${param.prixMin != null ? param.prixMin : ''}">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Prix maximum
                        </label>
                        <input type="number" name="prixMax" step="0.01"
                               class="w-full border rounded-md p-2"
                               placeholder="Prix maximum..."
                               value="${param.prixMax != null ? param.prixMax : ''}">
                    </div>
                </div>

                <div class="flex justify-end">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                        Rechercher
                    </button>
                </div>
            </form>
        </div>

        <!-- Résultats -->
        <c:if test="${not empty ventes}">
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Client</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Produit</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Catégorie</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Prix Unitaire</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Quantité</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Total</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${ventes}" var="vente">
                        <c:forEach items="${vente.lignesVente}" var="ligne">
                            <tr>
                                <td class="px-6 py-4">${vente.dateVente}</td>
                                <td class="px-6 py-4">
                                    <c:if test="${vente.client != null}">
                                        <a href="/clients/${vente.client.id}"
                                           class="text-blue-600 hover:text-blue-900">
                                                ${vente.client.nom} ${vente.client.prenom}
                                        </a>
                                    </c:if>
                                    <c:if test="${vente.client == null}">
                                        <span class="text-gray-500">Client anonyme</span>
                                    </c:if>
                                </td>
                                <td class="px-6 py-4">${ligne.produit.nom}</td>
                                <td class="px-6 py-4">${ligne.produit.categorie}</td>
                                <td class="px-6 py-4">${ligne.prixUnitaire} €</td>
                                <td class="px-6 py-4">${ligne.quantite}</td>
                                <td class="px-6 py-4">${ligne.sousTotal} €</td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty ventes}">
            <p class="text-gray-500">Aucun résultat trouvé pour la recherche.</p>
        </c:if>
    </div>
</div>
</body>
</html>
