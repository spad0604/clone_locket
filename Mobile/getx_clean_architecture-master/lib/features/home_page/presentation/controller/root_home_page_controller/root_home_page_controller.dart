import 'package:jbbase_app/base/base.dart';

class RootHomePageController extends BaseController {
  PageController pageController = PageController();

  void jumpToFirstPage() {
    pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}