
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/enums/RedirectionTypeEnum.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import 'package:no_cg_no_life_app/models/RedirectionCardModel.dart';
import '../../../configs/ui_constants.dart';
import 'package:no_cg_no_life_app/models/GenericURLRedirectionCardListPageModel.dart';
import 'package:no_cg_no_life_app/screens/sharedComponents/generic_menu_card/generic_menu_card.dart';
import 'package:url_launcher/url_launcher.dart';

class GenericURLRedirectionCardListPage extends StatefulWidget {
  final RedirectionCardModel _model;
  GenericURLRedirectionCardListPage(this._model){}
  @override
  _GenericURLRedirectionCardListPageState createState() => _GenericURLRedirectionCardListPageState();
}

class _GenericURLRedirectionCardListPageState extends State<GenericURLRedirectionCardListPage> {
  Widget generateHeaderCard(String title, String imagePath){
    return Card(
      margin: EdgeInsets.symmetric(vertical: DynamicSizeConfig.screenHeight * HeaderCardVerticalPadding, horizontal: DynamicSizeConfig.screenWidth * HeaderCardHorizontalPadding),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath , fit: BoxFit.cover ,width: DynamicSizeConfig.screenWidth * GenericCardImageWidth,),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),)
                    ]
                )
            )
          ],
        ),
      ),
    );
  }

  generateOnClick(RedirectionCardModel model) async {
    if(model.redirectionType == RedirectionType.PageRedirection){
      if(model.children != null && model.children!.length > 0){
        Navigator.push(context,  MaterialPageRoute(builder:  (context) => GenericURLRedirectionCardListPage(model) ) );
      }else{
        Navigator.pushReplacementNamed(context, model.url);
      }
    }else if(model.redirectionType == RedirectionType.URLRedirection){
      await canLaunch(model.url) ? await launch(model.url) : throw 'Could not launch ${model.url}';
    }
  }
  List<Widget> generateCards(BuildContext context){
    List<Widget> allCards = <Widget>[];
    allCards.add( generateHeaderCard( widget._model.title, widget._model.imagePath ));
    List<Widget> rowChildren = <Widget>[];
    for(int i=0;i<widget._model.children!.length;i++){
      if(i > 0 && i%2 == 0 ){
        allCards.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rowChildren,
            ));
        rowChildren = <Widget>[];
      }
      var cardData = widget._model.children![i];
      rowChildren.add(
          GenericMenuCard(
              title: cardData.title,
              imagePath: cardData.imagePath,
              onPressed: () async { await generateOnClick( cardData ); }
          )
      );
    }
    if(rowChildren.length > 0){
      allCards.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowChildren,
          ));
      rowChildren = <Widget>[];
    }

    return allCards;
  }
  @override
  Widget build(BuildContext context) {
    DynamicSizeConfig().init(context);
    return
      Scaffold(
        body:Container(
          child:  SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric( horizontal: 0, vertical: 16 ),
              children: generateCards(context),
            ),
          )
        ) ,
      );
  }
}
