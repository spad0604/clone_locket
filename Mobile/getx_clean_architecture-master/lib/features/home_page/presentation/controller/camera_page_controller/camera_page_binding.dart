import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/upload_image_message_uc.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/upload_image_uc.dart';

import 'camera_page_controller.dart';

class CameraPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CameraPageController.new);

    Get.lazyPut(() => UploadImageUseCase(Get.find()));

    Get.lazyPut(() => UploadImageMessageUseCase(Get.find()));
  }
}