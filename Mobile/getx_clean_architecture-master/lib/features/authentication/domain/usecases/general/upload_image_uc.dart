import 'dart:io';

import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/home_page/data/model/response_status.dart';

class UploadImageUseCase extends UseCaseIO<File, StatusResponse> {
  final UserRepo _userRepo;

  UploadImageUseCase(this._userRepo);

  @override
  Future<StatusResponse> build(File input) async{
    try {
      return await _userRepo.uploadImage(input);
    } catch (e) {
      rethrow;
    }
  }
}
