import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/get_friend_image_list_uc.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/get_friend_info_uc.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_information.dart';
import 'package:jbbase_app/features/home_page/data/model/friend_table_model.dart';
import 'package:jbbase_app/features/home_page/data/model/history-model.dart';
import 'package:jbbase_app/features/home_page/data/model/image_model.dart';

class HomePageController extends BaseController {
  final GetImageUseCase getIamgeUseCase = Get.find();

  final GetListFriendUseCase getListFriendUseCase = Get.find();

  final SeenImageUseCase seenImageUseCase = Get.find();

  final GetHistoryUseCase getHistoryUseCase = Get.find();

  final LoginController loginController = Get.find();

  final GetFriendInformationUseCase getFriendInformationUseCase = Get.find();

  final GetFriendImageListUseCase getFriendImageListUseCase = Get.find();

  Rx<String> account = ''.obs;

  RxList<HistoryModel> history = RxList<HistoryModel>();

  RxList<String> listFriend = RxList();

  RxList<FriendTableModel> friendList = RxList<FriendTableModel>();

  RxList<ImageModel> imageModel = RxList();

  RxList<FriendInformation> listFriendInfo = RxList();

  Rx<String> selectedValue = 'Tất cả bạn bè'.obs;

  Rx<String> accountName = ''.obs;

  RxInt currentPage = 0.obs;

  PageController pageController = PageController();

  @override
  void onInit() async {
    EasyLoading.show(status: 'Loading...');
    await getUserAccount();
    await getHistory();
    await getListFriend();
    await getFriendInfor();
    EasyLoading.dismiss();
    super.onInit();
  }

  Future<void> getUserAccount() async {
    account.value = loginController.emailTextEditingController.text;

  }

  Future<void> getHistory() async {
    try {
      imageModel.value = [];
      if(selectedValue.value == 'Tất cả bạn bè') {
        history.value = await getHistoryUseCase.build(null);
        if (history.isNotEmpty) {
          for (HistoryModel historyModel in history) {
            if (historyModel.isSeen == 0) {
              await getImage(historyModel.imageId ?? 1);
            }
          }
        }
      } else {
        imageModel.value = await getFriendImageListUseCase.build(selectedValue.value);
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

  Future<void> getFriendInfor() async {
    try {
      listFriendInfo.value = await getFriendInformationUseCase.build(null);
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  String avatarUrl(String account) {
    if(account == 'Tất cả bạn bè') {
      return 'https://flaticons.net/icon.php?slug_category=people&slug_icon=user-group';
    }
    if (listFriendInfo.isNotEmpty) {
      for (FriendInformation friendInformation in listFriendInfo) {
        if (account == friendInformation.account) {
          debugPrint('ola ${friendInformation.avatarUrl}');
          return friendInformation.avatarUrl ?? '';
        }
      }
    }
    return '';
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
