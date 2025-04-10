package com.avion.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ville")
public class Ville {
    @Id
    @Column(name = "id_ville", length = 50, nullable = false)
    private String idVille;

    @Column(name = "nom", length = 50, nullable = false)
    private String nom;

    // Getters et Setters

    public String getIdVille() {
        return idVille;
    }

    public void setIdVille(String idVille) {
        this.idVille = idVille;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
