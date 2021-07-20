
import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/screens/views/advising_course_crud/create_update_advising_course.dart';
import 'package:no_cg_no_life_app/screens/views/advising_course_crud/list_advising_course.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/advising_helper_view.dart';
import 'package:no_cg_no_life_app/screens/views/cgpa_calculator/cgpa_calculator_view.dart';
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
      case '/cgpa-calculator': return PageTransition(child: CGPACalculatorView(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/advising-helper': return PageTransition(child: AdvisingHelperView(),curve: Curves.linear,type: PageTransitionType.rightToLeft);

      case '/advising-course/create': return PageTransition(child: CreateOrUpdateAdvisingCourse(),curve: Curves.linear,type: PageTransitionType.rightToLeft);
      case '/advising-course/list': return PageTransition(child: ShowAllAdvisingCourse(),curve: Curves.linear,type: PageTransitionType.rightToLeft);


      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
