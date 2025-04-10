package com.avion.entities;


import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Reservation {

    private String idReservation;
    private LocalDateTime dateReservation;
    private BigDecimal prix;
    private String idTypeSiege;
    private String idVol;
    private String idUtilisateur;

    // Getters et setters

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

    @Override
    public String toString() {
        return "Reservation{" +
                "idReservation='" + idReservation + '\'' +
                ", dateReservation=" + dateReservation +
                ", prix=" + prix +
                ", idTypeSiege='" + idTypeSiege + '\'' +
                ", idVol='" + idVol + '\'' +
                ", idUtilisateur='" + idUtilisateur + '\'' +
                '}';
    }
}
