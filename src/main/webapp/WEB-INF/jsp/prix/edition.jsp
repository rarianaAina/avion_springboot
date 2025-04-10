<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Édition des Prix</title>
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
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Édition des Prix</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach items="${produits}" var="produit">
                <div class="bg-gray-50 p-4 rounded-lg">
                    <h3 class="font-semibold text-lg mb-2">${produit.nom}</h3>
                    <p class="text-gray-600 mb-4">Prix actuel: ${produit.prix} €</p>

                    <form action="/prix/modifier" method="post" class="flex gap-2">
                        <input type="hidden" name="produitId" value="${produit.id}">
                        <input type="number" name="nouveauPrix" step="0.01"
                               class="flex-1 border rounded-md p-2"
                               placeholder="Nouveau prix">
                        <button type="submit"
                                class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                            Modifier
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>

<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Édition des Prix</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Édition des Prix</h1>

        <!-- Sélection de la date globale (ne sera pas affichée sur chaque produit) -->
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Date de modification</label>
            <input type="date" id="dateModification" name="dateModification"
                   class="w-full border rounded-md p-2 mb-4">
        </div>

        <form action="/prix/modifier" method="post" class="space-y-4">
            <c:forEach items="${produits}" var="produit">
                <div class="bg-gray-50 p-4 rounded-lg">
                    <h3 class="font-semibold text-lg mb-2">${produit.nom}</h3>
                    <p class="text-gray-600 mb-4">Prix actuel: ${produit.prix} €</p>


                    <!-- Champ caché pour envoyer l'ID du produit -->
                    <input type="hidden" name="produitId" value="${produit.id}">

                    <div>
                        <input type="number" name="nouveauPrix" step="0.01"
                               class="flex-1 border rounded-md p-2"
                               placeholder="Nouveau prix">
                    </div>
                    <button type="submit"
                            class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                        Modifier
                    </button>
                </div>
            </c:forEach>
        </form>
    </div>
</div>

<!-- Script pour remplir le champ caché avec la date sélectionnée -->
<script>
    document.getElementById('dateModification').addEventListener('change', function() {
        // Récupérer la date sélectionnée et la mettre dans le champ caché
        document.getElementById('modif').value = this.value;
    });
</script>

</body>
</html>
--%>


<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Édition des Prix</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans antialiased">

<div class="container mx-auto px-4 py-8">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Édition des Prix</h1>

        <!-- Sélection de la date globale (ne sera pas affichée sur chaque produit) -->
        <div class="mb-6">
            <label class="block text-lg font-medium text-gray-700 mb-2">Date de modification</label>
            <input type="date" id="dateModification" name="dateModification"
                   class="w-full border rounded-md p-3 text-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4">
        </div>

        <form action="/prix/modifier" method="post" class="space-y-6">
            <c:forEach items="${produits}" var="produit">
                <div class="bg-gray-50 p-6 rounded-lg shadow-sm hover:shadow-md transition duration-300">
                    <h3 class="font-semibold text-xl text-gray-800 mb-2">${produit.nom}</h3>
                    <p class="text-gray-600 mb-4">Prix actuel: ${produit.prix} €</p>

                    <!-- Champ caché pour transmettre la date -->
                    <input type="hidden" name="modif" id="modif">

                    <!-- Champ caché pour envoyer l'ID du produit -->
                    <input type="hidden" name="produitId" value="${produit.id}">

                    <div class="mb-4">
                        <label for="nouveauPrix" class="block text-sm font-medium text-gray-700 mb-2">Nouveau prix</label>
                        <input type="number" name="nouveauPrix" step="0.01" id="nouveauPrix"
                               class="w-full border rounded-md p-3 text-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                               placeholder="Entrez le nouveau prix">
                    </div>

                    <button type="submit"
                            class="w-full bg-blue-500 hover:bg-blue-600 text-white px-6 py-3 rounded-lg text-lg transition duration-200">
                        Modifier
                    </button>
                </div>
            </c:forEach>
        </form>
    </div>
</div>

<!-- Script pour remplir le champ caché avec la date sélectionnée -->
<script>
    document.getElementById('dateModification').addEventListener('change', function() {
        // Récupérer la date sélectionnée et la mettre dans le champ caché
        document.getElementById('modif').value = this.value;
    });
</script>

</body>
</html>
--%>
