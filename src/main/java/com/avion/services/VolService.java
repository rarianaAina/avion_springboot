package com.avion.services;

import com.avion.entities.Configuration;
import com.avion.entities.Vol;
import com.avion.repositories.ConfigurationRepository;
import com.avion.repositories.VolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VolService {

    @Autowired
    VolRepository volRepository;
    public List<Vol> getAllVols() {
        return volRepository.findAll();
    }
}
