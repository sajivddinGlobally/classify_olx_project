import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/cloth/model/categoryBodyModel.dart';
import 'package:shopping_app_olx/cloth/model/categoryResModel.dart';

part 'category.service.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @POST("/api/category-by-products")
  Future<CategoryResModel> fetchCategory(@Path() CategoryBodyModel body);
}
