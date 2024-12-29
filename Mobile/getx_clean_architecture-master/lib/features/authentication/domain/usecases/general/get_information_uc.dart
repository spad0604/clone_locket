import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/authentication/data/models/user_information.dart';

class GetInformationUseCase extends UseCaseIO<void, UserInformation> {
  final UserRepo _userRepo;

  GetInformationUseCase(this._userRepo);

  @override
  Future<UserInformation> build(void input) async {
    try {
      final userInformation = await _userRepo.getInformation();

      return userInformation;
    } catch(e) {
      rethrow;
    }
  }

}