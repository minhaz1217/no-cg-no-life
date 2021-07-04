import 'package:flutter/material.dart';

class CardModel{
  final String title;
  final String imagePath;
  const CardModel.constant({ required this.title, required this.imagePath });
  CardModel({ required this.title, required this.imagePath });
}