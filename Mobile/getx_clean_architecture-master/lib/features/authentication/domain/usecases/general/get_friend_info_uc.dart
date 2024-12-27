

import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_information.dart';

class GetFriendInformationUseCase extends UseCaseIO<void, List<FriendInformation>> {
  final UserRepo _userRepo;

  GetFriendInformationUseCase(this._userRepo);

  @override
  Future<List<FriendInformation>> build(void input) async {
    try {
      final listFriendInfor = await _userRepo.getFriendInfo();
      return listFriendInfor;
    } catch (e) {
      return [];
    }
  }
}