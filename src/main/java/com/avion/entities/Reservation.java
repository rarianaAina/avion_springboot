package com.avion.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Data
public class Reservation {

    @Id
    @Column(name = "id_reservation")
    private String idReservation;

    @Column(name = "date_reservation", nullable = false)
    private LocalDateTime dateReservation;

    private BigDecimal prix;

    @Column(name = "nbre_place")
    private int nbre_place;

    // Clé étrangère (stockée)
    @Column(name = "id_type_siege", nullable = false)
    private String idTypeSiege;

    @Column(name = "id_vol", nullable = false)
    private String idVol;

    @Column(name = "id_utilisateur", nullable = false)
    private String idUtilisateur;

    // Relations

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_vol", referencedColumnName = "id_vol", insertable = false, updatable = false)
    private Vol vol;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_type_siege", referencedColumnName = "id_type_siege", insertable = false, updatable = false)
    private TypeSiege typeSiege;

    // Getters et Setters

    public String getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(String idReservation) {
        this.idReservation = idReservation;
    }

    public LocalDateTime getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(LocalDateTime dateReservation) {
        this.dateReservation = dateReservation;
    }

    public BigDecimal getPrix() {
        return prix;
    }

    public void setPrix(BigDecimal prix) {
        this.prix = prix;
    }

    public int getNbre_place() {
        return nbre_place;
    }

    public void setNbre_place(int nbre_place) {
        this.nbre_place = nbre_place;
    }

    public String getIdTypeSiege() {
        return idTypeSiege;
    }

    public void setIdTypeSiege(String idTypeSiege) {
        this.idTypeSiege = idTypeSiege;
    }

    public String getIdVol() {
        return idVol;
    }

    public void setIdVol(String idVol) {
        this.idVol = idVol;
    }

    public String getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(String idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public Vol getVol() {
        return vol;
    }

    public void setVol(Vol vol) {
        this.vol = vol;
    }

    public TypeSiege getTypeSiege() {
        return typeSiege;
    }

    public void setTypeSiege(TypeSiege typeSiege) {
        this.typeSiege = typeSiege;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "idReservation='" + idReservation + '\'' +
                ", dateReservation=" + dateReservation +
                ", prix=" + prix +
                ", idTypeSiege='" + idTypeSiege + '\'' +
                ", idVol='" + idVol + '\'' +
                ", idUtilisateur='" + idUtilisateur + '\'' +
                ", nbre_place=" + nbre_place +
                '}';
    }
}
