import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

class HomePageController extends BaseController {
  final GetIamgeUseCase getIamgeUseCase = Get.find();

  final GetListFriendUseCase getListFriendUseCase = Get.find();

  final SeenImageUseCase seenImageUseCase = Get.find();

  final GetHistoryUseCase getHistoryUseCase = Get.find();
  
  RxList<HistoryModel> history = RxList<HistoryModel>();
  RxList<FriendTableModel> friendList = RxList<FriendTableModel>();
  Rxn<ImageModel> imageModel = Rxn<ImageModel>();

  @override
  void onInit() async{
    EasyLoading.show(status: 'Loading...');
    await getHistory();
    await getListFriend();
    await getImage(1);
    EasyLoading.dismiss();
    super.onInit();
  }

  Future<void> getHistory() async{
    try {
      history.value = await getHistoryUseCase.build(null);
    } catch (e){
      history.value = [];
    }
  }

  Future<void> getListFriend() async {
    try {
      friendList.value = await getListFriendUseCase.build(null);
    } catch (e) {
      friendList.value = [];
    }
  }

  Future<void> getImage(int id) async {
    try {
      final imageModel = await getIamgeUseCase.build(id);
      debugPrint('ola ${imageModel.toString()}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}