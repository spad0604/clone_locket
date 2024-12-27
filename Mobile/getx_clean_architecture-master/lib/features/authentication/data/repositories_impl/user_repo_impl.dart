import 'package:jbbase_app/base/domain/base_repo.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_information.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

import '../../domain/repositories/user_repo.dart';
import '../providers/remote/api/user_api.dart';

class UserRepoImpl extends UserRepo {
  final UserAPI _userAPI = Get.find();

  @override
  Future<int> add(User h) async {
    final id = await super.add(h);

    // TODO: Override something

    return id;
  }

  @override
  Future<User> getUserData() async {
    final model = await _userAPI.getUserData();

    return mappingEntity(model);
  }

  @override
  Future<void> deleteAccount() {
    return _userAPI.deleteAccount();
  }

  @override
  Future<void> registerFcmToken(String token) {
    return _userAPI.registerFcmToken(token);
  }

  @override
  Future<List<HistoryModel>> getHistory() {
    return _userAPI.getHistory();
  }

  @override
  Future<ImageModel> getImage(int id) {
    return _userAPI.getImage(id);
  }

  @override
  Future<List<FriendTableModel>> getListFiend() {
    return _userAPI.getListFiend();
  }

  @override
  Future<void> seenImage(int id) {
    return _userAPI.seenImage(id);
  }

  @override
  Future<List<FriendInformation>> getFriendInfo() {
    return _userAPI.getFriendInfo();
  }

  @override
  Future<List<ImageModel>> getFriendListImage(String account) {
    return _userAPI.getFriendListImage(account);
  }
}
