import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/particularDeals/model/particularProductModel.dart';


part 'particularProductService.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class ParticularProductService {
  factory ParticularProductService(Dio dio, {String baseUrl}) =
      _ParticularProductService;

  @GET('/api/ProductDetails?id={id}')
  Future<ParticularProductModel> particularProduct(@Path() String id);
}
