import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  // Configuración de tu cuenta de Auth0
  static const String domain = 'dev-dantesakt1.us.auth0.com';
  static const String clientId = 'kAgyRUotwbhfq6lOd3mZkurMhzhhMPid';
  static const String audience = 'https://consertech-api';

  // Instancia para Web
  final Auth0Web _auth0Web = Auth0Web(domain, clientId);

  // Guardamos las credenciales en memoria
  static Credentials? credentials;

  // Inicializar en Web (captura el callback al volver del login)
  Future<void> initWeb() async {
    if (kIsWeb) {
      try {
        final result = await _auth0Web.onLoad();
        if (result != null) {
          credentials = result;
          debugPrint(
            'Sesión iniciada con éxito para: ${credentials?.user.email}',
          );
        }
      } catch (e) {
        // Es el comportamiento esperado cuando nadie ha iniciado sesión todavía
        credentials = null;
      }
    }
  }

  // Iniciar sesión
  Future<bool> login() async {
    try {
      if (kIsWeb) {
        await _auth0Web.loginWithRedirect(
          redirectUrl: 'http://localhost:3000',
          audience: audience,
        );
        return true;
      } else {
        final auth0 = Auth0(domain, clientId);
        final result = await auth0.webAuthentication().login(
          audience: audience,
        );
        credentials = result;
        return true;
      }
    } catch (e) {
      debugPrint('Error en login interactivo: $e');
      return false;
    }
  }

  // Cerrar sesión
  Future<void> logout() async {
    credentials = null;
    if (kIsWeb) {
      await _auth0Web.logout(returnToUrl: 'http://localhost:3000');
    }
  }

  // Obtener el Access Token para mandar a Spring Boot
  String? get accessToken => credentials?.accessToken;

  // Saber si hay sesión activa
  bool get isAuthenticated => credentials != null;
}
