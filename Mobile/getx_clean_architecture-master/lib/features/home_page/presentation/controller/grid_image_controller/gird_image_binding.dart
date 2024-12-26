import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/grid_image_controller/grid_image_controller.dart';

class GridImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(GridImageController.new);
  }

}