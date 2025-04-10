<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Productions</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Liste des Productions</h1>
                <a href="/production/nouvelle" 
                   class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    Nouvelle Production
                </a>
            </div>

            <!-- Formulaire de recherche -->
            <div class="mb-6 bg-gray-50 p-4 rounded-lg">
                <h2 class="text-lg font-semibold mb-4">Recherche</h2>
                <form action="/production" method="get" class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Catégorie
                        </label>
                        <select name="categorie" 
                                class="w-full border rounded-md p-2">
                            <option value="">Toutes les catégories</option>
                            <c:forEach items="${categories}" var="categorie">
                                <option value="${categorie}">${categorie}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Ingrédient
                        </label>
                        <select name="ingredientId" 
                                class="w-full border rounded-md p-2">
                            <option value="">Tous les ingrédients</option>
                            <c:forEach items="${ingredients}" var="ingredient">
                                <option value="${ingredient.id}">${ingredient.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Statut
                        </label>
                        <select name="statut" 
                                class="w-full border rounded-md p-2">
                            <option value="">Tous les statuts</option>
                            <c:forEach items="${statuts}" var="statut">
                                <option value="${statut}">${statut}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="md:col-span-3 flex justify-end">
                        <button type="submit" 
                                class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                            Rechercher
                        </button>
                    </div>
                </form>
            </div>

            <!-- Liste des productions -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach items="${productions}" var="production">
                    <div class="bg-white border rounded-lg shadow-sm p-4">
                        <div class="flex justify-between items-start mb-4">
                            <div>
                                <h3 class="font-semibold text-lg">${production.produit.nom}</h3>
                                <p class="text-sm text-gray-600">
                                    Quantité: ${production.quantite}
                                </p>
                            </div>
                            <span class="px-2 py-1 text-xs rounded-full 
                                ${production.statut == 'EN_COURS' ? 'bg-yellow-100 text-yellow-800' : 
                                  production.statut == 'TERMINE' ? 'bg-green-100 text-green-800' : 
                                  'bg-gray-100 text-gray-800'}">
                                ${production.statut}
                            </span>
                        </div>
                        
                        <div class="space-y-2 text-sm">
                            <p><span class="font-medium">Début:</span> ${production.dateDebut}</p>
                            <p><span class="font-medium">Fin prévue:</span> ${production.dateFin}</p>
                            
                            <div class="w-full bg-gray-200 rounded-full h-2.5 mt-2">
                                <div class="bg-blue-600 h-2.5 rounded-full" 
                                     style="width: ${production.progression}%"></div>
                            </div>
                            <p class="text-center text-gray-600">
                                ${production.progression}% terminé
                            </p>
                        </div>

                        <div class="mt-4 flex justify-end space-x-2">
                            <c:if test="${production.statut != 'TERMINE'}">
                                <button onclick="updateStatus(${production.id}, 'PAUSE')"
                                        class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded text-sm">
                                    Pause
                                </button>
                                <button onclick="updateStatus(${production.id}, 'TERMINE')"
                                        class="bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded text-sm">
                                    Terminer
                                </button>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
        function updateStatus(productionId, status) {
            fetch(`/production/${productionId}/status`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ status })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                }
            });
        }
    </script>
</body>
</html>