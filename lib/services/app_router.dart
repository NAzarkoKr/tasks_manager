import 'package:flutter/material.dart';
import 'package:task_manager/screens/bin_screen.dart';
import 'package:task_manager/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BinScreen.id:
        return MaterialPageRoute(
          builder: (_) => const BinScreen(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      default:
        return null;
    }
  }
}
