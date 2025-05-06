import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/particularDeals/model/particularProductModel.dart';
import 'package:shopping_app_olx/particularDeals/service/particularProductService.dart';

final particularController =
    FutureProvider.family<ParticularProductModel, String>((ref, id) async {
      final particularservice = ParticularProductService(await createDio());
      return particularservice.particularProduct(id);
    });
