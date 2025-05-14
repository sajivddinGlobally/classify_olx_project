import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/home/model/homepageModel.dart';
import 'package:shopping_app_olx/home/service/homepage.service.dart';

final homepageController = FutureProvider<HomepageModel>((ref) async {
  final homepageservice = HomePageService(await createDio());
  return homepageservice.home();
});
