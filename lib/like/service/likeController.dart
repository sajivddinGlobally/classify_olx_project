  import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/like/model/likeBodyModel.dart';
import 'package:shopping_app_olx/like/model/likeResModel.dart';
import 'package:shopping_app_olx/like/service/like.service.dart';

class LikeNotifier extends StateNotifier<AsyncValue<LikeResModel>> {
  LikeNotifier() : super(AsyncValue.data(LikeResModel(message: "")));

  Future<void> likeProduct(LikeBodyModel body) async {
    log("Start");
    state = AsyncValue.loading();
    try {
      final dio = createDio();
      final likeservice = LikeService(dio);
      final response = await likeservice.like(body);
      log(response.message);
      state = AsyncValue.data(response);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      log(e.toString());
    }
  }
}

final likeNotiferProvider =
    StateNotifierProvider<LikeNotifier, AsyncValue<LikeResModel>>(
      (ref) => LikeNotifier(),
    );



// ye like dislike ke liye ok 
class LikeToggleNotifier extends StateNotifier<Set<String>> {
  LikeToggleNotifier() : super({});

  void toggle(String productId) {
    if (state.contains(productId)) {
      state = {...state}..remove(productId);
    } else {
      state = {...state}..add(productId);
    }
  }

  bool isLiked(String productId) => state.contains(productId);
}

final likeToggleProvider =
    StateNotifierProvider<LikeToggleNotifier, Set<String>>(
      (ref) => LikeToggleNotifier(),
    );
