import 'package:no_cg_no_life_app/enums/RedirectionTypeEnum.dart';
import 'package:no_cg_no_life_app/models/CardModel.dart';

class RedirectionCardModel extends CardModel {
  // this is the redirection type, if it is of type URLRedirection, then that means the onclick will redirect it to webpage
  // if it is of page redirection, then first the model will look at children and generate a page, otherwise it will push named route.
  final RedirectionType redirectionType;

  // Depending on RedirectionType, url will contain either and http/https url or an in app route url
  final String url;

  // if page type is PageRedirection, then children will be used.
  final List<RedirectionCardModel>? children;

  // Simple constructor
  RedirectionCardModel(
      {required String title, required String imagePath, required this.redirectionType, this.children, this.url = ""})
      : super(title: title, imagePath: imagePath) {}

  // Constant constructor.
  const RedirectionCardModel.constant({required String title, required String imagePath, required this.redirectionType, this.children, this.url = ""})
      : super.constant(title: title, imagePath: imagePath);
}

