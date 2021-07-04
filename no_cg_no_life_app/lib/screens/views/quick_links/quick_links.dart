import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/configs/basic_menu_static_data.dart';
import 'package:no_cg_no_life_app/enums/RedirectionTypeEnum.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import 'package:no_cg_no_life_app/models/RedirectionCardModel.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_list_with_top_icon_view/generic_url_redirection_card_list_page.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_menu_card/generic_menu_card.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickLinks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    genericOnPressForRedirection(RedirectionCardModel model) async {
      if(model.redirectionType == RedirectionType.PageRedirection){
        if(model.children != null && model.children!.length > 0){
          Navigator.push(context,  MaterialPageRoute(builder:  (context) => GenericURLRedirectionCardListPage(model) ) );
        }else{
          Navigator.pushReplacementNamed(context, model.url);
        }
      }else{
        await canLaunch(model.url) ? await launch(model.url) : throw 'Could not launch ${model.url}';
      }
    }
    DynamicSizeConfig().init(context);
    return
      Scaffold(
        body:Container(
            child:  SafeArea(
              child: GridView.builder(
                padding: EdgeInsets.symmetric( horizontal: 16, vertical: 16 ),

                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,),
                itemCount: BasicMenuStaticData.QuickLinks.children!.length,
                itemBuilder: (context, index){
                  return GenericMenuCard(
                      title: BasicMenuStaticData.QuickLinks.children![index].title,
                      imagePath: BasicMenuStaticData.QuickLinks.children![index].imagePath,
                      onPressed: () async {  await genericOnPressForRedirection(BasicMenuStaticData.QuickLinks.children![index]);});
                },
              ),
            )
        ) ,
      );
  }
}
