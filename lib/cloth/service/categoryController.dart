import 'package:riverpod/riverpod.dart';
import 'package:shopping_app_olx/cloth/model/categoryResModel.dart';
import 'package:shopping_app_olx/cloth/service/category.service.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';

final categoryController = FutureProvider.family<CategoryResModel, String>((ref, text) async {
  final categoryservice = CategoryService(createDio());
  return await categoryservice.fetchCategory("$text");
});

final searchProvider = StateProvider((ref) => "");
