import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/camera_page_controller/camera_page_controller.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/root_home_page_controller/root_home_page_controller.dart';

import '../../../../authentication/domain/usecases/general/get_image_uc.dart';

class RootHomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(RootHomePageController.new);

    Get.lazyPut(CameraPageController.new);

    Get.lazyPut(HomePageController.new);

    Get.lazyPut(() => GetImageUseCase(Get.find()));

    Get.lazyPut(() => GetListFriendUseCase(Get.find()));

    Get.lazyPut(() => SeenImageUseCase(Get.find()));

    Get.lazyPut(() => GetHistoryUseCase(Get.find()));
  }

}