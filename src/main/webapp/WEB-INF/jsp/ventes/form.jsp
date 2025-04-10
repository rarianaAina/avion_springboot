<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nouvelle Vente</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <div class="mb-6">
        <a href="/" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
            Retour à l'accueil
        </a>
    </div>
    <div class="bg-white rounded-lg shadow-lg p-6">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Nouvelle Vente</h1>

        <form id="venteForm" class="space-y-6">
            <!-- Date de vente -->
            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Date de vente
                </label>
                <input type="datetime-local" id="dateVente" name="dateVente"
                       class="w-full border rounded-md p-2"
                       required>
            </div>

            <!-- Sélection du vendeur -->
            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Vendeur
                </label>
                <select id="vendeurId" name="vendeurId" class="w-full border rounded-md p-2" required>
                    <option value="">Sélectionner un vendeur</option>
                    <c:forEach items="${vendeurs}" var="vendeur">
                        <option value="${vendeur.id}">${vendeur.nom} ${vendeur.prenom}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Sélection du client -->
            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Client
                </label>
                <div class="flex gap-4">
                    <select id="clientId" name="clientId" class="flex-1 border rounded-md p-2">
                        <option value="">Sélectionner un client</option>
                        <c:forEach items="${clients}" var="client">
                            <option value="${client.id}">${client.nom} ${client.prenom}</option>
                        </c:forEach>
                    </select>
                    <button type="button" onclick="ouvrirModalClient()"
                            class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded">
                        Nouveau Client
                    </button>
                </div>
            </div>

            <!-- Sélection des produits -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <c:forEach items="${produits}" var="produit">
                    <div class="bg-gray-50 p-4 rounded-lg">
                        <h3 class="font-semibold">${produit.nom}</h3>
                        <p class="text-sm text-gray-600">${produit.prix} €</p>
                        <div class="mt-2 flex items-center">
                            <input type="number"
                                   name="quantite_${produit.id}"
                                   min="0"
                                   value="0"
                                   onchange="calculerTotal()"
                                   class="w-20 border rounded-md p-1">
                            <span class="ml-2">unité(s)</span>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Mode de paiement -->
            <div class="mt-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">
                    Mode de paiement
                </label>
                <select name="modePaiement" class="w-full border rounded-md p-2">
                    <option value="ESPECES">Espèces</option>
                    <option value="CARTE">Carte bancaire</option>
                    <option value="MOBILE">Paiement mobile</option>
                </select>
            </div>

            <!-- Total et validation -->
            <div class="mt-6 flex justify-between items-center">
                <div>
                    <span class="text-lg font-semibold">Total:</span>
                    <span id="total" class="text-xl font-bold ml-2">0.00 €</span>
                </div>
                <button type="submit"
                        class="bg-green-500 hover:bg-green-600 text-white px-6 py-2 rounded-lg">
                    Valider la vente
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Modal pour nouveau client -->
<div id="clientModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
    <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
        <div class="mt-3">
            <h3 class="text-lg font-medium leading-6 text-gray-900 mb-4">Nouveau Client</h3>
            <form id="clientForm" class="space-y-4">
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
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Téléphone</label>
                    <input type="tel" name="telephone"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <input type="hidden" name="pointsFidelite" value="0">
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="fermerModalClient()"
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

<script>
    // Initialiser la date au moment actuel
    document.getElementById('dateVente').value = new Date().toISOString().slice(0, 16);

    function ouvrirModalClient() {
        document.getElementById('clientModal').classList.remove('hidden');
    }

    function fermerModalClient() {
        document.getElementById('clientModal').classList.add('hidden');
        document.getElementById('clientForm').reset();
    }

    function calculerTotal() {
        let total = 0;
        const inputs = document.querySelectorAll('input[name^="quantite_"]');

        inputs.forEach(input => {
            const produitDiv = input.closest('.bg-gray-50');
            const prix = parseFloat(produitDiv.querySelector('p').textContent);
            const quantite = parseInt(input.value) || 0;
            total += prix * quantite;
        });

        document.getElementById('total').textContent = total.toFixed(2) + ' €';
    }

    document.getElementById('clientForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(e.target);
        const clientData = {};
        formData.forEach((value, key) => {
            clientData[key] = value;
        });

        fetch('/clients/sauvegarder', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(clientData)
        })
            .then(response => response.json())
            .then(client => {
                const select = document.getElementById('clientId');
                const option = new Option(`${client.nom} ${client.prenom}`, client.id);
                select.add(option);
                select.value = client.id;
                fermerModalClient();
            })
            .catch(error => {
                console.error('Erreur lors de la sauvegarde du client:', error);
                alert('Une erreur est survenue lors de la création du client');
            });
    });

    document.getElementById('venteForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const lignesVente = [];
        const inputs = document.querySelectorAll('input[name^="quantite_"]');

        inputs.forEach(input => {
            const produitId = input.name.split('_')[1];
            const quantite = parseInt(input.value);

            if (quantite > 0) {
                lignesVente.push({
                    produit: { id: produitId },
                    quantite: quantite
                });
            }
        });

        if (lignesVente.length === 0) {
            alert('Veuillez sélectionner au moins un produit');
            return;
        }

        const venteData = {
            dateVente: document.getElementById('dateVente').value,
            vendeurId: document.getElementById('vendeurId').value,
            clientId: document.getElementById('clientId').value || null,
            modePaiement: document.querySelector('select[name="modePaiement"]').value,
            lignesVente: lignesVente
        };

        if (!venteData.vendeurId) {
            alert('Veuillez sélectionner un vendeur');
            return;
        }

        fetch('/ventes/effectuer', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(venteData)
        })
            .then(response => {
                if (response.ok) {
                    // Vider le formulaire et remettre les valeurs par défaut
                    document.getElementById('venteForm').reset();
                    document.getElementById('total').textContent = '0.00 €';
                    alert('Vente effectuée avec succès');
                } else {
                    throw new Error('Erreur lors de la vente');
                }
            })
            .catch(error => {
                console.error('Erreur:', error);
                alert('Une erreur est survenue lors de la vente');
            });
    });
</script>
</body>
</html>