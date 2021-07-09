import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// SemiCircularProgressBar is used to show the animated circular bar on top of CGPA Calculator.

class SemiCircularProgressBar extends StatefulWidget {
  final double startValue;
  final double endValue;
  final double finalValue;
  final Duration animationDuration;
  final int finalValueDecimalDigit;
  final String bottomText;
  final Color progressDoneColor;
  final Color progressRemainingColor;
  SemiCircularProgressBar( {
    this.startValue = 0,
    this.endValue = 100,
    this.finalValue = 50,
    this.animationDuration = const Duration( seconds: 1),
    this.finalValueDecimalDigit = 0,
    this.bottomText = "Progress",
    this.progressDoneColor = Colors.blue,
    this.progressRemainingColor = Colors.blueGrey
  } ){}

  @override
  _SemiCircularProgressBarState createState() =>
      _SemiCircularProgressBarState();
}

class _SemiCircularProgressBarState extends State<SemiCircularProgressBar> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: widget.startValue,
          maximum: widget.endValue,
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
            thickness: 0.12,
            cornerStyle: CornerStyle.bothCurve,
            color: widget.progressRemainingColor,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          // Pointer
          pointers: <GaugePointer>[
            RangePointer(
              color: widget.progressDoneColor,
              value: widget.finalValue,
              cornerStyle: CornerStyle.bothCurve,
              width: 0.12,
              sizeUnit: GaugeSizeUnit.factor,
              enableAnimation: true,
              animationDuration: widget.animationDuration.inMilliseconds.toDouble(),
              animationType: AnimationType.ease,
            )
          ],
          // annotation
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Text(
                  widget.finalValue.toStringAsFixed(widget.finalValueDecimalDigit), // TODO: try to make it so that this value reflect the progress bar value along with animation. maybe need to research this package further to achieve this.
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
            GaugeAnnotation(
                positionFactor: .8,
                angle: 90,
                widget: Text(
                  widget.bottomText,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ])
    ]);
  }
}
