import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app_olx/chat/model/inboxModel.dart';
import 'package:shopping_app_olx/chat/model/mesagesList.response.dart';
import 'package:shopping_app_olx/like/model/LikedPridurcsLisst.dart';
import 'package:shopping_app_olx/like/model/likeBodyModel.dart';
import 'package:shopping_app_olx/like/model/likeResModel.dart';
import 'package:shopping_app_olx/like/model/showlikeResModel.dart';

part 'chatService.g.dart';

@RestApi(baseUrl: 'https://classfiy.onrender.com')
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;

  @GET("/chats/inbox/{id}")
  Future<InboxListResponse> getInboxs(@Path('id') String id);
  @GET('/chats/history/{userid1}/{userid2}')
  Future<MessageListResponse> getMessage(
    @Path('userid1') String userid1,
    @Path('userid2') String userid2,
  );
}
