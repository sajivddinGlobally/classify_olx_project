import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:shopping_app_olx/home/model/getAllProductModel.dart';

part 'getAllService.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class GetAllService {
  factory GetAllService(Dio dio, {String baseUrl}) = _GetAllService;

  @GET('/api/products?category=&pincode=303604&filter=ON')
  Future<GetAllProductModel> getAllProduct();
}
