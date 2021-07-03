import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/models/CardModel.dart';

class GenericURLRedirectionCardListPageModel {
  final String pageTitle;
  final IconData pageIcon;
  final List<URLRedirectionCardModel> children;
  GenericURLRedirectionCardListPageModel(
      {required this.pageTitle,
      required this.pageIcon,
      required this.children}) {}
}

class URLRedirectionCardModel extends CardModel {
  final String url;
  URLRedirectionCardModel(
      {required String title, required String imagePath, this.url = ""})
      : super(title: title, imagePath: imagePath) {}
}
