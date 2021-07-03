
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import 'package:no_cg_no_life_app/helpers/ui_constants.dart';
import 'package:no_cg_no_life_app/models/GenericURLRedirectionCardListPageModel.dart';
import 'package:url_launcher/url_launcher.dart';

class GenericURLRedirectionCardListPage extends StatefulWidget {
  final GenericURLRedirectionCardListPageModel _model;
  GenericURLRedirectionCardListPage(this._model){}
  @override
  _GenericURLRedirectionCardListPageState createState() => _GenericURLRedirectionCardListPageState();
}

class _GenericURLRedirectionCardListPageState extends State<GenericURLRedirectionCardListPage> {
  Widget generateSingleCard(String title, String url, String imagePath){
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: DynamicSizeConfig.screenHeight * GenericCardHeight,
      width: DynamicSizeConfig.screenWidth * GenericCardWidth,
      child: ElevatedButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(imagePath , fit: BoxFit.cover ,width: 85,),
            Text(title)
          ],
        ),
        onPressed: () async {
          await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
        },
      ),
    );
  }
  Widget generateHeaderCard(String title, IconData icon){
    return Card(
      margin: EdgeInsets.symmetric(vertical: DynamicSizeConfig.screenHeight * HeaderCardVerticalPadding, horizontal: DynamicSizeConfig.screenWidth * HeaderCardHorizontalPadding),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(title)
          ],
        ),
      ),
    );
  }
  List<Widget> generateCards(){
    List<Widget> allCards = <Widget>[];
    allCards.add( generateHeaderCard( widget._model.pageTitle, widget._model.pageIcon ));
    List<Widget> rowChildren = <Widget>[];
    for(int i=0;i<widget._model.children.length;i++){
      if(i > 0 && i%2 == 0 ){
        allCards.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rowChildren,
            ));
        rowChildren = <Widget>[];
      }
      var cardData = widget._model.children[i];
      rowChildren.add(generateSingleCard(cardData.title,cardData.url, cardData.imagePath));
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
              padding: EdgeInsets.symmetric( horizontal: 16, vertical: 16 ),
              children: generateCards(),
            ),
          )
        ) ,
      );
  }
}
