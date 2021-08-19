import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// GenericTextField is used throughout the app to take input.

class GenericTextField extends StatefulWidget {
  // TODO: later remove the seperate controller and validator, and use the FormTextFieldMustHave and adjust all the classes accordingly.
  final TextEditingController textEditingController;
  final String hintText;
  final bool readOnly;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final EdgeInsets padding;
  GenericTextField({ required this.textEditingController, this.hintText = "", this.readOnly = false, this.keyboardType = TextInputType.text, this.validator, this.padding = const EdgeInsets.all(8.0) });
  @override
  _GenericTextFieldState createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
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