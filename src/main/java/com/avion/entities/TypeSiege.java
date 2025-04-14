package com.avion.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "type_siege")
public class TypeSiege {

    @Id
    @Column(name = "id_type_siege", length = 50, nullable = false)
    private String idTypeSiege;

    @Column(name = "libelle", length = 50, nullable = false)
    private String libelle;

    // Getters et Setters

    public String getIdTypeSiege() {
        return idTypeSiege;
    }

    public void setIdTypeSiege(String idTypeSiege) {
        this.idTypeSiege = idTypeSiege;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @Override
    public String toString() {
        return "TypeSiege{" +
                "idTypeSiege='" + idTypeSiege + '\'' +
                ", libelle='" + libelle + '\'' +
                '}';
    }
}
