import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    this.animationDuration = const Duration( seconds: 5),
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
  double progresValue = 10;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    progresValue = widget.startValue;
    // TODO : make tween type animation calculation.
    _timer = Timer.periodic(
        const Duration( milliseconds:  100 ),
          (timer){
          double incrementValue =   ((widget.finalValue - widget.startValue).abs() / widget.animationDuration.inMilliseconds)*100;
          if(progresValue < widget.finalValue){
            setState(() {
              progresValue = (progresValue + incrementValue) % widget.endValue;
            });
          }else{
            progresValue = widget.finalValue;
            timer.cancel();
          }
        }
    );

  }

  @override
  void dispose() {
    if(_timer != null){
      _timer.cancel();
    }
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
              value: progresValue,
              cornerStyle: CornerStyle.bothCurve,
              width: 0.12,
              sizeUnit: GaugeSizeUnit.factor,
              enableAnimation: true,
              animationDuration: 1,
              animationType: AnimationType.elasticOut,
            )
          ],
          // annotation
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Text(
                  progresValue.toStringAsFixed(widget.finalValueDecimalDigit),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
            GaugeAnnotation(
                positionFactor: 1,
                angle: 90,
                widget: Text(
                  widget.bottomText,
                  style: TextStyle(fontSize: 24, color: Colors.white70),
                )),
          ])
    ]);
  }
}
