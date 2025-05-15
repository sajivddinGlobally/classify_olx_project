import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/home/model/allCategoryModel.dart';
import 'package:shopping_app_olx/home/model/homepageModel.dart';

part 'homepage.service.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class HomePageService {
  factory HomePageService(Dio dio, {String baseUrl}) = _HomePageService;

  @GET('/api/home')
  Future<HomepageModel> home();

  @GET('/api/categories')
  Future<AllCategoryModel> allCategory();
}
