import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/view/home_screen.dart';
import 'package:flutter_mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      // case RoutesName.SPLASH:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('No Route Defined'))),
        );
    }
  }
}
