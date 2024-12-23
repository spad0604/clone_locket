import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/domain/repositories/user_repo.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';

class GetHistoryUseCase extends UseCaseIO<void, List<HistoryModel>> {
  final UserRepo _userRepo;

  GetHistoryUseCase(this._userRepo);

  @override
  Future<List<HistoryModel>> build(void request) async {
    try {
      return await _userRepo.getHistory();
    } catch(e) {
      return [];
    }
  }
}