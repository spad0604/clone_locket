import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

class GetFriendImageListUseCase extends UseCaseIO<String, List<ImageModel>> {
  final UserRepo _userRepo;

  GetFriendImageListUseCase(this._userRepo);

  @override
  Future<List<ImageModel>> build(String input) async{
    try {
      final listImage = await _userRepo.getFriendListImage(input);
      return listImage;
    } catch(e) {
      return [];
    }
  }
}