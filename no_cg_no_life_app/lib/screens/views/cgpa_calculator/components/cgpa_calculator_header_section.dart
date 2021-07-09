import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';
import 'package:no_cg_no_life_app/models/CGPACalculatorHeaderNotifierModel.dart';
import 'package:no_cg_no_life_app/screens/views/cgpa_calculator/components/semi_circular_progress_bar.dart';
import 'package:scoped_model/scoped_model.dart';

// CGPACalculatorHeaderSection is the header section of CGPA Calculator.

class CGPACalculatorHeaderSection extends StatefulWidget {
  final double finalCGPA;
  final double finalCredit;
  CGPACalculatorHeaderSection({ required this.finalCGPA, required this.finalCredit});
  @override
  _CGPACalculatorHeaderSectionState createState() =>
      _CGPACalculatorHeaderSectionState();
}

class _CGPACalculatorHeaderSectionState
    extends State<CGPACalculatorHeaderSection> {
  @override
  Widget build(BuildContext context) {
    double finalCredit = ScopedModel.of<CGPACalculatorHeaderNotifierModel>(context, rebuildOnChange: true).finalCredit;
    double finalCGPA = ScopedModel.of<CGPACalculatorHeaderNotifierModel>(context, rebuildOnChange: true).finalCGPA;
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
