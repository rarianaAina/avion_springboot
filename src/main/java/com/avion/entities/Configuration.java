package com.avion.entities;

import lombok.Data;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
public class Configuration {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        private String adulte;
        private String enfant;
        private String ageAdulte;

/*
        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "idVol", nullable = false)
        private Vol vol;  // Relation avec Vol
*/

        @Column(name = "dateConfiguration", nullable = false, updatable = false)
        private LocalDateTime dateConfiguration;

        @PrePersist
        protected void onCreate() {
                this.dateConfiguration = LocalDateTime.now();
        }
}
