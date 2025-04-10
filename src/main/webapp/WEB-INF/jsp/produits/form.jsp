<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire Produit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>${produit.id == null ? 'Nouveau Produit' : 'Modifier Produit'}</h2>
        
        <form:form action="/produits/sauvegarder" method="post" modelAttribute="produit">
            <form:hidden path="id"/>
            
            <div class="mb-3">
                <label class="form-label">Nom</label>
                <form:input path="nom" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Description</label>
                <form:textarea path="description" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Prix</label>
                <form:input path="prix" type="number" step="0.01" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Catégorie</label>
                <form:select path="categorie" class="form-control">
                    <form:options items="${(com.boulangerie.entities.Produit.CategorieProduit).values()}"/>
                </form:select>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Quantité en Stock</label>
                <form:input path="quantiteStock" type="number" class="form-control"/>
            </div>
            
            <button type="submit" class="btn btn-primary">Sauvegarder</button>
            <a href="/produits" class="btn btn-secondary">Annuler</a>
        </form:form>
    </div>
</body>
</html>