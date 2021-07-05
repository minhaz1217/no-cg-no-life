import 'dart:ffi';

import 'package:flutter/material.dart';

class CGPACalculatorTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool readOnly;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  CGPACalculatorTextField({ required this.textEditingController, this.hintText = "", this.readOnly = false, this.keyboardType = TextInputType.text, this.validator });
  @override
  _CGPACalculatorTextFieldState createState() => _CGPACalculatorTextFieldState();
}

class _CGPACalculatorTextFieldState extends State<CGPACalculatorTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.textEditingController,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: widget.hintText,
            border: OutlineInputBorder(),
        ),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
