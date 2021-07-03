
import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/screens/views/home/home_view.dart';
import 'package:no_cg_no_life_app/screens/views/splash/splash_view.dart';
import 'package:page_transition/page_transition.dart';

class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashView());
      case '/home':
        return PageTransition(
            child: HomeView(),
            curve: Curves.linear,
            type: PageTransitionType.rightToLeft);
      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
