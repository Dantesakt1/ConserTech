package com.consertech.auth.models;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username; // Puede ser el RUT o un identificador único

    @Column(nullable = false)
    private String password; // Contraseña encriptada con BCrypt

    @Column(nullable = false)
    private String rol; // ROLE_CONSERJE, ROLE_ADMIN
}