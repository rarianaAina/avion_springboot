package com.avion.services;

import com.avion.entities.Reservation;
import com.avion.entities.TypeSiege;
import com.avion.entities.User;
import com.avion.repositories.ReservationRepository;
import com.avion.repositories.TypeSiegeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    TypeSiegeRepository typeSiegeRepository;
    public List<Reservation> getAllReservation() {
        return reservationRepository.findAll();
    }

    public Reservation getReservationById(String idReservation) {

        return reservationRepository.findById(idReservation).orElse(null);
    }

    public TypeSiege getTypeSiege(String idTypeSiege) {
        return typeSiegeRepository.findById(idTypeSiege)
                .orElseThrow(() -> new RuntimeException("Type de siège non trouvé pour l'ID: " + idTypeSiege));
    }


}
