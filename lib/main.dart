import 'package:flutter/material.dart';
import 'routes.dart'; // Import routes.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Starts with the LoginScreen
      routes: appRoutes, // Uses centralized routes
    );
  }
}
