package com.consertech.auth.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class AuthController {

    // Endpoint público de prueba
    @GetMapping("/public/status")
    public Map<String, String> publicStatus() {
        return Map.of("status", "Servicio Auth corriendo correctamente");
    }

    // Endpoint protegido: sólo responderá si envías un Token JWT válido de Auth0
    @GetMapping("/auth/perfil")
    public Map<String, Object> getPerfil(@AuthenticationPrincipal Jwt jwt) {
        return Map.of(
                "sub", jwt.getSubject(), // ID del usuario en Auth0
                "claims", jwt.getClaims() // Todos los datos y roles que vienen en el token
        );
    }
}