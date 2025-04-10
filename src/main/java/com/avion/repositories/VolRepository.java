package com.avion.repositories;

import com.avion.entities.Configuration;
import com.avion.entities.Vol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VolRepository extends JpaRepository<Vol, Long> {
}
