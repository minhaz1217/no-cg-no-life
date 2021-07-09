
import 'package:flutter/material.dart';

class FormTextFieldMustHave{
  TextEditingController controller;
  FormFieldValidator? validator;
  FormTextFieldMustHave( { required this.controller, this.validator} ) ;

  void dispose(){
    controller.dispose();
  }
}