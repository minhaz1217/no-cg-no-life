import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import '../../../configs/ui_constants.dart';

class GenericMenuCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function onPressed;
  GenericMenuCard({required this.title, required this.imagePath, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: DynamicSizeConfig.screenWidth * GenericCardWidth,
      width: DynamicSizeConfig.screenWidth * GenericCardWidth,
      child: ElevatedButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath , fit: BoxFit.cover ,width: DynamicSizeConfig.screenWidth * GenericCardImageWidth,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text(
                  title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}