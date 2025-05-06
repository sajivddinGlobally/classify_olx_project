import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/home/service/getAllService.dart';

final getAllProductControler = FutureProvider((ref) async {
  final getallproductservice = GetAllService(await createDio());
  return getallproductservice.getAllProduct();
});
