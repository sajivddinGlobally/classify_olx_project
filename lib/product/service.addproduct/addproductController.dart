import 'package:riverpod/riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/product/model.addproduct/addProductBodyModel.dart';
import 'package:shopping_app_olx/product/model.addproduct/addproductResModel.dart';
import 'package:shopping_app_olx/product/service.addproduct/addproductService.dart';

final addProductProvider =
    FutureProvider.family<AddproductResModel, AddproductBodyModel>((
      ref,
      body,
    ) async {
      final addproductservice = AddproductService(await createDio());
      return addproductservice.addProduct(body);
    });
