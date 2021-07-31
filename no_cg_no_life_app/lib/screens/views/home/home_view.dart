import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_cg_no_life_app/configs/basic_menu_static_data.dart';
import 'package:no_cg_no_life_app/helpers/date_helper.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/repository/sqlite_database_repository_impl.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_menu_card/generic_menu_card.dart';
import 'package:no_cg_no_life_app/services/data_loader_service.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    DynamicSizeConfig().init(context);
    return
      Scaffold(
        body:Container(
            child:  SafeArea(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric( horizontal: 16, vertical: 16 ),
                children: [
                  // TODO: translations.
                  GenericMenuCard(title: BasicMenuStaticData.QuickLinks.title, imagePath: BasicMenuStaticData.QuickLinks.imagePath, onPressed: (){Navigator.pushNamed(context, BasicMenuStaticData.QuickLinks.url);}),
                  GenericMenuCard(title: "CGPA Calculator", imagePath: "assets/icons/cgpa.png", onPressed: (){ Navigator.pushNamed(context, "/cgpa-calculator");}),
                  GenericMenuCard(title: "Advising Helper", imagePath: "assets/icons/cgpa.png", onPressed: (){Navigator.pushNamed(context, "/advising-helper");}),

                ],
              ),
            )
        ) ,

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // print(DateFormat('hh:mm a').format(DateTime.now()));
            BaseRepository<Course> repo = Get.find();
            // DataLoaderService dataLoaderService = DataLoaderService();
            // // print(dataLoaderService.convertAdvisingTimeToAMPM("10:10"));
            // await dataLoaderService.populateDBFromJsonFile("summer_2021");
          },
        ),
      );
  }
}
