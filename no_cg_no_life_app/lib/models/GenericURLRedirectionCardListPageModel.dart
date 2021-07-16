import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/models/RedirectionCardModel.dart';

class GenericURLRedirectionCardListPageModel {
  final String pageTitle;
  final IconData pageIcon;
  final List<RedirectionCardModel> children;
  GenericURLRedirectionCardListPageModel(
      {required this.pageTitle,
      required this.pageIcon,
      required this.children});
}


