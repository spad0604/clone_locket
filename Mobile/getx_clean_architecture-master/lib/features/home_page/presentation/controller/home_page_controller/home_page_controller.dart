import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

class HomePageController extends BaseController {
  final GetImageUseCase getIamgeUseCase = Get.find();

  final GetListFriendUseCase getListFriendUseCase = Get.find();

  final SeenImageUseCase seenImageUseCase = Get.find();

  final GetHistoryUseCase getHistoryUseCase = Get.find();

  final LoginController loginController = Get.find();

  Rx<String> account = ''.obs;
  
  RxList<HistoryModel> history = RxList<HistoryModel>();

  RxList<String> listFriend = RxList();

  RxList<FriendTableModel> friendList = RxList<FriendTableModel>();

  Rxn<ImageModel> imageModel = Rxn<ImageModel>();

  @override
  void onInit() async{
    EasyLoading.show(status: 'Loading...');
    await getUserAccount();
    await getHistory();
    await getListFriend();
    EasyLoading.dismiss();
    super.onInit();
  }

  Future<void> getUserAccount() async {
    account.value = loginController.emailTextEditingController.text;
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
      if(friendList.isNotEmpty) {
        for (FriendTableModel friend in friendList) {
          debugPrint('hmm ${friend.account1}');
          if (friend.account1 != account.value) {
            listFriend.add(friend.account1!);
          } else {
            listFriend.add(friend.account2!);
          }
        }
      }
      debugPrint('test ${listFriend.length}');
    } catch (e) {
      friendList.value = [];
    }
  }

  Future<void> getImage(int id) async {
    try {
      final image = await getIamgeUseCase.build(id);
      imageModel.value = image;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}