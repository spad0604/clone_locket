import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
  
}