import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/main_layout.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authService = AuthService();
  await authService.initWeb();

  runApp(MyApp(isAuthenticated: authService.isAuthenticated));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({Key? key, required this.isAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consertech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Segoe UI'),
      home: isAuthenticated ? const MainLayout() : const LoginScreen(),
    );
  }
}
