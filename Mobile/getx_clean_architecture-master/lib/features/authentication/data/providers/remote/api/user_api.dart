import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../home_page/data/model/friend_information.dart';
import '../../../models/user_model.dart';

part 'user_api.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class UserAPI {
  factory UserAPI(Dio dioBuilder) = _UserAPI;

  @GET('/me')
  Future<UserModel> getUserData();

  @DELETE('/me')
  Future<void> deleteAccount();

  @POST('/me/devices')
  Future<void> registerFcmToken(@Field('fcm_token') String token);

  @POST('/logout')
  Future<void> logout();

  @GET('/user/list-friend')
  Future<List<FriendTableModel>> getListFiend();

  @GET('/user/history')
  Future<List<HistoryModel>> getHistory();

  @GET('/user/seen-image')
  Future<void> seenImage(@Query('id') int id);

  @GET('/user/get-image')
  Future<ImageModel> getImage(@Query('id') int id);

  @GET('/user/friend-info')
  Future<List<FriendInformation>> getFriendInfo();

  @GET('/user/friend-list-image')
  Future<List<ImageModel>> getFriendListImage(@Query('account') String account);

  @POST('/upload')
  @MultiPart()
  Future<void> uploadImage(@Part(name: 'file') File file);
}
