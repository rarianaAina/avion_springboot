package com.avion.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "vol")
public class Vol {

    @Id
    @Column(name = "id_vol", length = 50, nullable = false)
    private String idVol;

    @Column(name = "date_vol", nullable = false)
    private LocalDateTime dateVol;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ville", nullable = false)
    private Ville villeDepart;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ville_1", nullable = false)
    private Ville villeArrivee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_avion", nullable = false)
    private Avion avion;

    // Getters et Setters

    public String getIdVol() {
        return idVol;
    }

    public void setIdVol(String idVol) {
        this.idVol = idVol;
    }

    public LocalDateTime getDateVol() {
        return dateVol;
    }

    public void setDateVol(LocalDateTime dateVol) {
        this.dateVol = dateVol;
    }

    public Ville getVilleDepart() {
        return villeDepart;
    }

    public void setVilleDepart(Ville villeDepart) {
        this.villeDepart = villeDepart;
    }

    public Ville getVilleArrivee() {
        return villeArrivee;
    }

    public void setVilleArrivee(Ville villeArrivee) {
        this.villeArrivee = villeArrivee;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }
}
