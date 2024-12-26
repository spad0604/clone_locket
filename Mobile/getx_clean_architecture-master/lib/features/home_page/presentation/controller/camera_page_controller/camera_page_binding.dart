import 'package:jbbase_app/base/base.dart';

import 'camera_page_controller.dart';

class CameraPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CameraPageController.new);
  }
}