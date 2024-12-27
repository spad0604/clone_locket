import 'dart:ui';

import 'package:jbbase_app/base/domain/base_repo.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_information.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

import '../../data/models/user_model.dart';
import '../../data/providers/local/user_storage.dart';
import '../entities/user.dart';

export '../../data/models/user_model.dart';
export '../entities/user.dart';

abstract class UserRepo extends BaseHiveRepo<User, UserModel, UserStorage> {
  Future<User> getUserData();

  Future<void> deleteAccount();

  Future<void> registerFcmToken(String token);

  Future<List<FriendTableModel>> getListFiend();

  Future<List<HistoryModel>> getHistory();

  Future<void> seenImage(int id);

  Future<ImageModel> getImage(int id);

  Future<List<FriendInformation>> getFriendInfo();

  Future<List<ImageModel>> getFriendListImage(String account);
}
