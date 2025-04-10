package com.avion.services;

import com.avion.entities.Reservation;
import com.avion.entities.User;
import com.avion.repositories.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {

    @Autowired
    ReservationRepository reservationRepository;

    public List<Reservation> getAllReservation() {
        return reservationRepository.findAll();
    }

    public Reservation getReservationById(String idReservation) {

        return reservationRepository.findById(idReservation).orElse(null);
    }


}
