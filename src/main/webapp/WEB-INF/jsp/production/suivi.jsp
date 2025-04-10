<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Suivi de Production</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h1 class="text-2xl font-bold text-gray-800 mb-6">Suivi de Production</h1>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach items="${productionEnCours}" var="production">
                    <div class="bg-gray-50 rounded-lg p-4">
                        <div class="flex justify-between items-start mb-4">
                            <h3 class="font-semibold text-lg">${production.produit.nom}</h3>
                            <span class="px-2 py-1 rounded text-sm 
                                ${production.statut == 'EN_COURS' ? 'bg-yellow-100 text-yellow-800' : 
                                  production.statut == 'TERMINE' ? 'bg-green-100 text-green-800' : 
                                  'bg-gray-100 text-gray-800'}">
                                ${production.statut}
                            </span>
                        </div>
                        
                        <div class="space-y-2">
                            <p><span class="font-medium">Quantité:</span> ${production.quantite}</p>
                            <p><span class="font-medium">Début:</span> ${production.dateDebut}</p>
                            <p><span class="font-medium">Fin prévue:</span> ${production.dateFin}</p>
                        </div>

                        <div class="mt-4">
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-blue-600 h-2.5 rounded-full" 
                                     style="width: ${production.progression}%"></div>
                            </div>
                            <p class="text-sm text-gray-600 mt-1 text-center">
                                ${production.progression}% terminé
                            </p>
                        </div>

                        <div class="mt-4 flex justify-end space-x-2">
                            <button onclick="updateStatus(${production.id}, 'PAUSE')"
                                    class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded text-sm">
                                Pause
                            </button>
                            <button onclick="updateStatus(${production.id}, 'TERMINE')"
                                    class="bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded text-sm">
                                Terminer
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
        function updateStatus(productionId, status) {
            fetch(`/production/suivi/${productionId}/status`, {
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