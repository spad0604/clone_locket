import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/root_home_page_controller/root_home_page_controller.dart';
import 'package:jbbase_app/features/home_page/presentation/view/camera_page_view/camera_page_view.dart';
import 'package:jbbase_app/features/home_page/presentation/view/home_page_view/home_page_view.dart';

class RootHomePageView extends BaseGetView<RootHomePageController> {
  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          CameraPageView(),
          HomePageView()
        ],
      ),
    );
  }
  
}