import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app_olx/chat/service/chatService.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/new/new.service.dart';

final inboxProvider = FutureProvider((ref) async {
  var box = await Hive.box("data");
  final id = box.get('id');
  final api = ChatService(createDio2());
  return await api.getInboxs(id);
});

final messageProvider = FutureProvider.family((ref, userid) async {
  var box = await Hive.box("data");
  final id = box.get('id');
  final api = ChatService(createDio2());
  return await api.getMessage(id, userid.toString());
});
