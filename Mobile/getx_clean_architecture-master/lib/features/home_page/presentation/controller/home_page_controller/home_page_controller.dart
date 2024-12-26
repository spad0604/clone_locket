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

  RxList<ImageModel> imageModel = RxList();

  @override
  void onInit() async {
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

  Future<void> getHistory() async {
    try {
      history.value = await getHistoryUseCase.build(null);
      if (history.isNotEmpty) {
        for (HistoryModel historyModel in history) {
          if (historyModel.isSeen == 0) {
            await getImage(historyModel.imageId ?? 1);
          }
        }
      }
      imageModel.value = imageModel.reversed.toList();
    } catch (e) {
      history.value = [];
    }
  }

  Future<void> getListFriend() async {
    try {
      friendList.value = await getListFriendUseCase.build(null);
      if (friendList.isNotEmpty) {
        for (FriendTableModel friend in friendList) {
          if (friend.account1 != account.value) {
            listFriend.add(friend.account1!);
          } else {
            listFriend.add(friend.account2!);
          }
        }
      }
    } catch (e) {
      friendList.value = [];
    }
  }

  Future<void> getImage(int id) async {
    try {
      final image = await getIamgeUseCase.build(id);
      imageModel.add(image);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void toGridImagePage() {
    N.toGridImage();
  }
}
