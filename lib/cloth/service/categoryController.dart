import 'package:riverpod/riverpod.dart';
import 'package:shopping_app_olx/cloth/model/categoryBodyModel.dart';
import 'package:shopping_app_olx/cloth/model/categoryResModel.dart';
import 'package:shopping_app_olx/cloth/service/category.service.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';

final categoryController =
    FutureProvider.family.autoDispose<CategoryResModel, CategoryBodyModel>((
      ref,
      body,
    ) async {
      final categoerservice = CategoryService(await createDio());
      return categoerservice.fetchCategory(body);
    });
