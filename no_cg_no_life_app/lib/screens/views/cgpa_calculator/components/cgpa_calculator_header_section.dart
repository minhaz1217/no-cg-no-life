import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import 'package:no_cg_no_life_app/models/CGPACalculatorHeaderNotifierModel.dart';
import 'package:no_cg_no_life_app/screens/views/cgpa_calculator/components/semi_circular_progress_bar.dart';

// CGPACalculatorHeaderSection is the header section of CGPA Calculator.

class CGPACalculatorHeaderSection extends StatefulWidget {
  CGPACalculatorHeaderSection();
  @override
  _CGPACalculatorHeaderSectionState createState() =>
      _CGPACalculatorHeaderSectionState();
}

class _CGPACalculatorHeaderSectionState extends State<CGPACalculatorHeaderSection> {
  CGPACalculatorHeaderNotifierModel notifierModel = Get.find();

  @override
  Widget build(BuildContext context) {
    double finalCredit = notifierModel.finalCredit.value;
    double finalCGPA =  notifierModel.finalCGPA.value;
    return Container(
        width: double.infinity,
        height: DynamicSizeConfig.screenHeight * .3,
        color: BrandColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: DynamicSizeConfig.screenWidth * .4,
              child: SemiCircularProgressBar(
                startValue: 0,
                endValue: 200,
                finalValue:  finalCredit,
                animationDuration:Duration(seconds: 2),
                bottomText: "CREDITS",// TODO: translations
                // TODO: change progress bar color
              ),
            ),
            Container(
              width: DynamicSizeConfig.screenWidth * .4,
              child: SemiCircularProgressBar(
                startValue: 0,
                endValue: 4,
                finalValue:  finalCGPA,
                animationDuration:Duration(seconds: 2),
                finalValueDecimalDigit: 2,
                bottomText: "CGPA", // TODO: translations
                // TODO: change progress bar color
              ),
            ),
          ],
        ));
  }
}
