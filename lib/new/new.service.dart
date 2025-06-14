import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'new.service.g.dart';

@RestApi(baseUrl: "http://classified.globallywebsolutions.com")
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;
  @MultiPart() // ✅ VERY IMPORTANT
  @POST("/api/Add/product")
  Future<HttpResponse<dynamic>> addProduct(@Part() Map<String, dynamic> parts);
}

/// how to use this api

// final file = await MultipartFile.fromFile(
//   'path/to/image.jpg',
//   filename: 'image.jpg',
//   contentType: MediaType('image', 'jpeg'), // Needs http_parser
// );

// final parts = {
//   'category': 'shirt',
//   'image': file,
//   'user_id': '12345',
//   'json_data': '{"price": 100}',
// };

// await apiService.addProduct(parts);
