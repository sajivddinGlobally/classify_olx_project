import 'package:riverpod/riverpod.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/map/model/locationBodyModel.dart';
import 'package:shopping_app_olx/map/model/locationResModel.dart';
import 'package:shopping_app_olx/map/service/locationService.dart';

final locationController =
    FutureProvider.family<LocationResModel, LocationBodyModel>((
      ref,
      body,
    ) async {
      final locationservice = LocationService(await createDio());
      return locationservice.fetchLocation(body);
    });
