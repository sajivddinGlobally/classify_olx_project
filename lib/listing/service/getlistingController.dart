import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/listing/service/getlisting.service.dart';

final listingController = FutureProvider((ref) async {
  final getlistingservice = GetListingService(await createDio());
  return getlistingservice.fetchListing();
});
