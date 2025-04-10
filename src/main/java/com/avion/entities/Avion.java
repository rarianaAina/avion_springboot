package com.avion.entities;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "avion")
public class Avion {
    @Id
    @Column(name = "id_avion", length = 50, nullable = false)
    private String idAvion;

    @Column(name = "date_fabrication", nullable = false)
    private LocalDate dateFabrication;

    @Column(name = "model", length = 50, nullable = false)
    private String model;

    // Getters et Setters

    public String getIdAvion() {
        return idAvion;
    }

    public void setIdAvion(String idAvion) {
        this.idAvion = idAvion;
    }

    public LocalDate getDateFabrication() {
        return dateFabrication;
    }

    public void setDateFabrication(LocalDate dateFabrication) {
        this.dateFabrication = dateFabrication;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }
}

