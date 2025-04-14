package com.avion.repositories;

import com.avion.entities.TypeSiege;
import com.avion.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeSiegeRepository extends JpaRepository<TypeSiege, String> {
}
