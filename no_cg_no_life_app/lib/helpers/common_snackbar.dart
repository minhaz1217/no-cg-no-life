
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';

showSnackBar({
  required String title,
  required String message,
  Widget? icon,
  SnackPosition? snackPosition,
  Color? backgroundColor,
  Color? textColor,
  Duration? duration
} ){
  icon = icon ?? Icon(Icons.person, color: Colors.white);
  snackPosition = snackPosition ?? SnackPosition.BOTTOM;
  backgroundColor = backgroundColor?? Colors.green;
  textColor = textColor?? Colors.white;
  duration = duration ?? Duration(seconds: 4);
  Get.snackbar(
    title,
    message,
    icon: icon,
    snackPosition: snackPosition,
    backgroundColor: backgroundColor,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: textColor,
    duration: duration,
    isDismissible: true,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}


showError(ex){
  showSnackBar(title: "Error", message: "${ex.toString()}", backgroundColor: ErrorColor);
}