import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/domain/repositories/user_repo.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';

class GetListFriendUseCase extends UseCaseIO<void, List<FriendTableModel>> {
  final UserRepo _userRepo;

  GetListFriendUseCase(this._userRepo);

  @override
  Future<List<FriendTableModel>> build(void request) async {
    try {
      final List<FriendTableModel> friendTable = await _userRepo.getListFiend();
      return friendTable;
    } catch (e) {
      return [];
    }
  }
}