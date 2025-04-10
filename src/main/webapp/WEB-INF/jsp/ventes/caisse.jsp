<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Caisse</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="grid grid-cols-3 gap-6">
            <!-- Liste des produits -->
            <div class="col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Produits</h2>
                <div class="grid grid-cols-3 gap-4">
                    <c:forEach items="${produits}" var="produit">
                        <div class="bg-gray-50 p-4 rounded-lg cursor-pointer hover:bg-gray-100"
                             onclick="ajouterProduit(${produit.id}, '${produit.nom}', ${produit.prix})">
                            <h3 class="font-semibold">${produit.nom}</h3>
                            <p class="text-gray-600">${produit.prix} €</p>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Panier -->
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-xl font-bold mb-4">Panier</h2>
                <div id="panier" class="mb-4">
                    <!-- Les produits seront ajoutés ici dynamiquement -->
                </div>

                <div class="border-t pt-4">
                    <div class="flex justify-between mb-2">
                        <span class="font-semibold">Total:</span>
                        <span id="total" class="font-bold">0.00 €</span>
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mode de paiement</label>
                        <select id="modePaiement" class="w-full border rounded-md p-2">
                            <option value="ESPECES">Espèces</option>
                            <option value="CARTE">Carte bancaire</option>
                            <option value="MOBILE">Paiement mobile</option>
                        </select>
                    </div>

                    <button onclick="validerCommande()" 
                            class="w-full bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">
                        Valider la commande
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let panier = [];
        
        function ajouterProduit(id, nom, prix) {
            panier.push({id, nom, prix});
            actualiserPanier();
        }
        
        function retirerProduit(index) {
            panier.splice(index, 1);
            actualiserPanier();
        }
        
        function actualiserPanier() {
            const panierDiv = document.getElementById('panier');
            const totalSpan = document.getElementById('total');
            
            panierDiv.innerHTML = '';
            let total = 0;
            
            panier.forEach((produit, index) => {
                const div = document.createElement('div');
                div.className = 'flex justify-between items-center mb-2';
                div.innerHTML = `
                    <span>${produit.nom}</span>
                    <div>
                        <span class="mr-2">${produit.prix} €</span>
                        <button onclick="retirerProduit(${index})" 
                                class="text-red-500 hover:text-red-700">×</button>
                    </div>
                `;
                panierDiv.appendChild(div);
                total += produit.prix;
            });
            
            totalSpan.textContent = total.toFixed(2) + ' €';
        }
        
        function validerCommande() {
            if (panier.length === 0) {
                alert('Le panier est vide');
                return;
            }
            
            const commande = {
                produits: panier.map(p => p.id),
                modePaiement: document.getElementById('modePaiement').value
            };
            
            // Envoi de la commande au serveur
            fetch('/ventes/valider', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(commande)
            })
            .then(response => response.json())
            .then(data => {
                alert('Commande validée !');
                panier = [];
                actualiserPanier();
            })
            .catch(error => {
                alert('Erreur lors de la validation de la commande');
            });
        }
    </script>
</body>
</html>