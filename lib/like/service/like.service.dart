import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/like/model/likeBodyModel.dart';
import 'package:shopping_app_olx/like/model/likeResModel.dart';

part 'like.service.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class LikeService {
  factory LikeService(Dio dio, {String baseUrl}) = _LikeService;

  @POST("/api/like-toggle")
  Future<LikeResModel> like(@Body() LikeBodyModel body);
}
