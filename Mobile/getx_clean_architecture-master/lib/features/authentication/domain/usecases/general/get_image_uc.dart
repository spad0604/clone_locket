import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/domain/repositories/user_repo.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

class GetIamgeUseCase extends UseCaseIO<int, ImageModel> {
  final UserRepo _userRepo;

  GetIamgeUseCase(this._userRepo);

  @override
  Future<ImageModel> build(int input) async {
    try {
      final result = await _userRepo.getImage(input);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}