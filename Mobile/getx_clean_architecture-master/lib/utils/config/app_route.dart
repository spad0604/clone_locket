// ignore_for_file: non_constant_identifier_names
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_binding.dart';
import 'package:jbbase_app/features/home_page/presentation/view/home_page_view/home_page_view.dart';

import '../../features/authentication/authentication.dart';
import '../../features/example/example.dart';
import '../../features/tabbar/tabbar.dart';

class AppRoute {
  // Base
  static String root = '/';

  static String tabbar = '/tabbar';

  static String LA10 = '/landing';

  // Authentication
  static String LO10 = '/login';

  static String RE10 = '/register';

  // Example
  static String SE10 = '/setting';

  static String EX10 = '/example_home';

  static String EX20 = '/example_home_list';

  static String HOME_PAGE = '/home_page';

  static List<GetPage> generateGetPages = [
    // Base
    GetPage(
      name: root,
      page: RootPage.new,
      binding: RootBinding(),
    ),
    GetPage(
      name: tabbar,
      page: TabbarPage.new,
      binding: TabbarBinding(),
      transition: Transition.noTransition,
    ),
    // Authentication
    GetPage(
      name: LA10,
      page: LandingPage.new,
      binding: LandingBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: LO10,
      page: LoginPage.new,
      binding: LoginBinding(),
    ),
    GetPage(
      name: RE10,
      page: RegisterPage.new,
      binding: RegisterBinding(),
    ),
    // Authentication
    GetPage(
      name: SE10,
      page: ChangeLanguage.new,
      binding: ChangeLanguageBinding(),
    ),
    GetPage(
      name: EX10,
      page: ExampleHomePage.new,
      binding: ExampleHomeBinding(),
    ),
    GetPage(
      name: EX20,
      page: ExampleHomeListPage.new,
      binding: ExampleHomeListBinding(),
    ),
    GetPage(
      name: HOME_PAGE,
      page: HomePageView.new,
      binding: HomePageBinding()
    )
  ];

  static GetPage? getPage(String name) {
    return generateGetPages.firstWhereOrNull((e) => e.name == name);
  }
}
