
import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/screens/views/home/home_view.dart';
import 'package:no_cg_no_life_app/screens/views/quick_links/quick_links.dart';
import 'package:no_cg_no_life_app/screens/views/splash/splash_view.dart';
import 'package:page_transition/page_transition.dart';

// this file manages all the different page routes of this app.
// GUIDE:
// * to add an url, the url MUST be all lower case with dash '-' separating the words.
// * try to keep every case in one line.
class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':return MaterialPageRoute(builder: (context) => SplashView());
      case '/home': return PageTransition(child: HomeView(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/quick-links': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/scholarship-and-financial-aids': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/admission': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/faculty': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/ewu-news': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/alumni': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/library': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/campus-life': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/office': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/convocation': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/faculty-members-publications': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/courses': return PageTransition(child: QuickLinks(),curve: Curves.linear,type: PageTransitionType.rightToLeft);


      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
