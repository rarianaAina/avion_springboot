<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion de Boulangerie</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<!-- Modal Nouveau Vendeur -->
<div id="modalVendeur" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
    <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
        <div class="mt-3">
            <h3 class="text-lg font-medium leading-6 text-gray-900 mb-4">Nouveau Vendeur</h3>
            <form action="/vendeurs/sauvegarder" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Nom</label>
                    <input type="text" name="nom" required
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Prénom</label>
                    <input type="text" name="prenom" required
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Genre</label>
                    <select name="genre" required
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        <option value="HOMME">Homme</option>
                        <option value="FEMME">Femme</option>
                    </select>
                </div>
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="fermerModalVendeur()"
                            class="bg-gray-500 text-white px-4 py-2 rounded">
                        Annuler
                    </button>
                    <button type="submit"
                            class="bg-blue-500 text-white px-4 py-2 rounded">
                        Sauvegarder
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold text-center text-gray-800 mb-8">
        Système de Gestion de Boulangerie
    </h1>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Ventes -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Ventes</h2>
            <div class="space-y-2">
                <a href="/ventes/nouvelle"
                   class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg">
                    Nouvelle Vente
                </a>
                <a href="/ventes/recherche"
                   class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg">
                    Recherche des Ventes
                </a>
                <a href="/ventes/caisse"
                   class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg">
                    Caisse
                </a>
                <a href="/ventes/rapport/journalier"
                   class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg">
                    Rapport Journalier
                </a>
                <a href="/ventes/rapport/hebdomadaire"
                   class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg">
                    Rapport Hebdomadaire
                </a>
                <a href="/clients/jour"
                   class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg">
                    Clients du Jour
                </a>
                <div class="flex justify-between items-center">
                    <a href="/vendeurs/statistiques"
                       class="block bg-blue-50 hover:bg-blue-100 p-3 rounded-lg flex-grow mr-2">
                        Commission Vendeur
                    </a>
                    <button onclick="ouvrirModalVendeur()"
                            class="bg-green-500 hover:bg-green-600 text-white px-3 py-2 rounded-lg">
                        + Vendeur
                    </button>
                </div>
            </div>
        </div>

        <!-- Production -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Production</h2>
            <div class="space-y-2">
                <a href="/production/planning"
                   class="block bg-green-50 hover:bg-green-100 p-3 rounded-lg">
                    Planning
                </a>
                <a href="/production/suivi"
                   class="block bg-green-50 hover:bg-green-100 p-3 rounded-lg">
                    Suivi
                </a>
                <a href="/production"
                   class="block bg-green-50 hover:bg-green-100 p-3 rounded-lg">
                    Liste des Productions
                </a>
            </div>
        </div>

        <!-- Stock -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Stock</h2>
            <div class="space-y-2">
                <a href="/ingredients"
                   class="block bg-yellow-50 hover:bg-yellow-100 p-3 rounded-lg">
                    Ingrédients
                </a>
                <a href="/stock/dashboard"
                   class="block bg-yellow-50 hover:bg-yellow-100 p-3 rounded-lg">
                    Dashboard
                </a>
                <a href="/stock/mouvements"
                   class="block bg-yellow-50 hover:bg-yellow-100 p-3 rounded-lg">
                    Mouvements
                </a>
            </div>
        </div>

        <!-- Clients -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Clients</h2>
            <div class="space-y-2">
                <a href="/clients"
                   class="block bg-purple-50 hover:bg-purple-100 p-3 rounded-lg">
                    Liste des Clients
                </a>
                <a href="/clients/fidelite"
                   class="block bg-purple-50 hover:bg-purple-100 p-3 rounded-lg">
                    Programme Fidélité
                </a>
            </div>
        </div>

        <!-- Produits -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Produits</h2>
            <div class="space-y-2">
                <a href="/produits"
                   class="block bg-red-50 hover:bg-red-100 p-3 rounded-lg">
                    Catalogue
                </a>
                <a href="/promotions"
                   class="block bg-red-50 hover:bg-red-100 p-3 rounded-lg">
                    Promotions
                </a>
                <a href="/produits-conseil/nouveau"
                   class="block bg-red-50 hover:bg-red-100 p-3 rounded-lg">
                    Nouveau Produit du Mois
                </a>
                <a href="/prix/edition"
                   class="block bg-red-50 hover:bg-red-100 p-3 rounded-lg">
                    Édition des Prix
                </a>
                <a href="/prix/historique"
                   class="block bg-red-50 hover:bg-red-100 p-3 rounded-lg">
                    Historique des Prix
                </a>
            </div>
        </div>

        <!-- Statistiques -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Statistiques</h2>
            <div class="space-y-2">
                <a href="/statistiques/dashboard"
                   class="block bg-indigo-50 hover:bg-indigo-100 p-3 rounded-lg">
                    Dashboard
                </a>
                <a href="/statistiques/ventes"
                   class="block bg-indigo-50 hover:bg-indigo-100 p-3 rounded-lg">
                    Analyse des Ventes
                </a>
                <a href="/statistiques/produits"
                   class="block bg-indigo-50 hover:bg-indigo-100 p-3 rounded-lg">
                    Analyse des Produits
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    function ouvrirModalVendeur() {
        document.getElementById('modalVendeur').classList.remove('hidden');
    }

    function fermerModalVendeur() {
        document.getElementById('modalVendeur').classList.add('hidden');
    }
</script>
</body>
</html>