import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/listing/model/getlistingModel.dart';

part 'getlisting.service.g.dart';

@RestApi(baseUrl: 'http://classified.globallywebsolutions.com')
abstract class GetListingService {
  factory GetListingService(Dio dio, {String baseUrl}) = _GetListingService;

  @GET('/api/user/listings?user_id=3')
  Future<GetLitingModel> fetchListing();
}
