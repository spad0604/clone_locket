import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/domain/repositories/user_repo.dart';

class SeenImageUseCase extends UseCaseIO<int, void> {
  final UserRepo _userRepo;

  SeenImageUseCase(this._userRepo);

  @override
  Future<void> build(int input) {
    try {
      return _userRepo.seenImage(input);
    } catch (e) {
      rethrow;
    }
  }
}