import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/helpers/colors_utils.dart';
import 'package:no_cg_no_life_app/helpers/dynamic_size_config.dart';

class CGPACalculatorHeaderSection extends StatefulWidget {
  @override
  _CGPACalculatorHeaderSectionState createState() => _CGPACalculatorHeaderSectionState();
}

class _CGPACalculatorHeaderSectionState extends State<CGPACalculatorHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DynamicSizeConfig.screenHeight * .3,
      color: BrandColor,
    );
  }
}
