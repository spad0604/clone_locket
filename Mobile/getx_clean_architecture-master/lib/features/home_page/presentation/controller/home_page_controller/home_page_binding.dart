import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/get_friend_image_list_uc.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/get_friend_info_uc.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(HomePageController.new);

    Get.lazyPut(() => GetImageUseCase(Get.find()));

    Get.lazyPut(() => GetHistoryUseCase(Get.find()));

    Get.lazyPut(() => SeenImageUseCase(Get.find()));

    Get.lazyPut(() => GetListFriendUseCase(Get.find()));

    Get.lazyPut(() => GetFriendInformationUseCase(Get.find()));

    Get.lazyPut(() => GetFriendImageListUseCase(Get.find()));
  }
  
}