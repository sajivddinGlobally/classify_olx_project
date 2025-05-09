import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/profile/Model/profileModel.dart';
import 'package:shopping_app_olx/profile/service/profileService.dart';

final profileController = FutureProvider.family.autoDispose<ProfileModel, String>((
  ref,
  id,
) async {
  final profileservice = ProfileService(await createDio());
  return profileservice.profile(id);
});
