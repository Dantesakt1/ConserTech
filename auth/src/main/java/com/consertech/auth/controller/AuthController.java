package com.consertech.auth.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.consertech.auth.dtos.AuthResponse;
import com.consertech.auth.dtos.LoginRequest;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
        // Lógica estructural. Aquí implementaremos la validación real contra Spring Security.
        if ("conserje_fernando".equals(loginRequest.getUsername()) && "1234".equals(loginRequest.getPassword())) {
            String tokenGenerado = "eyJhbGciOiJIUzI1NiIsInR5cCI... (Token JWT Real)";
            return ResponseEntity.ok(new AuthResponse(tokenGenerado, loginRequest.getUsername(), "ROLE_CONSERJE"));
        }
        return ResponseEntity.status(401).body("Credenciales inválidas");
    }
}