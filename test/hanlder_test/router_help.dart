import 'package:flutter/material.dart';
import 'package:project_todos_test/screens/navigation_screen.dart';

const String onGenerateRouteName = "/";
const String recycleBinScreen = "/recycle_bin_screen";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onGenerateRouteName:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
