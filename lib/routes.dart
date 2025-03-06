import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/newitem_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/new-item': (context) => NewItemScreen(),
};
