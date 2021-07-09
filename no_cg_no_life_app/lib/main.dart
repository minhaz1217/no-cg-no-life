import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';
import 'package:no_cg_no_life_app/models/GenericURLRedirectionCardListPageModel.dart';
import 'package:no_cg_no_life_app/router/route_provider.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_list_with_top_icon_view/generic_url_redirection_card_list_page.dart';
import 'package:no_cg_no_life_app/screens/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No CG No Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: BrandColor
      ),
      locale: Locale("en"),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: "/",
      onGenerateRoute: RouteProvider.generateRoute,
      home: HomeView()
      // GenericURLRedirectionCardListPage( GenericURLRedirectionCardListPageModel( pageTitle: "Department", pageIcon: Icons.add, children: [
      //   URLRedirectionCardModel( title: "Title 1", url: "http://www.google.com", imagePath: "assets/icons/cgpa.png" ),
      //   URLRedirectionCardModel( title: "Title 2", url: "http://www.google.com", imagePath: "assets/icons/cgpa.png" ),
      //   URLRedirectionCardModel( title: "Title 3", url: "http://www.google.com", imagePath: "assets/icons/cgpa.png" ),
      //   URLRedirectionCardModel( title: "Title 4", url: "http://www.google.com", imagePath: "assets/icons/cgpa.png" ),
      //   URLRedirectionCardModel( title: "Title 5", url: "http://www.google.com", imagePath: "assets/icons/cgpa.png" ),
      //   URLRedirectionCardModel( title: "Title 6", url: "http://www.google.com", imagePath: "assets/icons/cgpa.png" ),
      //   // URLRedirectionCardModel( title: "Title 6", url: "http://www.google.com", cardIcon: Icons.add ),
      // ]) ),
    );
  }
}
