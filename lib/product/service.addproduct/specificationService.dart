import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/product/model.addproduct/specificationBodyModel.dart';
import 'package:shopping_app_olx/product/model.addproduct/specificationResModel.dart';

part 'specificationService.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class SpecificationService {
  factory SpecificationService(Dio dio, {String baseUrl}) =
      _SpecificationService;

  @POST("/api/product/specification")
  Future<ProductSpecificationResModel> addSpecificationProduct(
    @Body() ProductSpecificationBodyModel body,
  );
}
