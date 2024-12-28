import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';

class UploadImageMessageUseCase extends UseCaseIO<UploadImageMessage, void> {
  final UserRepo _userRepo;

  UploadImageMessageUseCase(this._userRepo);

  @override
  Future<void> build(UploadImageMessage input) async{
    try {
      await _userRepo.uploadImageMessage(input);
    } catch (e) {
      rethrow;
    }
  }

}