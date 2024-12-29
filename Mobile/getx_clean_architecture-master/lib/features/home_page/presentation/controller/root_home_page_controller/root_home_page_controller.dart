import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/data/models/user_information.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/get_information_uc.dart';

class RootHomePageController extends BaseController {
  final GetInformationUseCase getInformationUseCase = Get.find();

  PageController pageController = PageController();

  Rxn<UserInformation> user = Rxn();
  @override
  void onInit() async{
    await getInformation();
    super.onInit();
  }

  Future<void> getInformation() async {
    try {
      user.value = await getInformationUseCase.build(null);
    } catch(e) {
      rethrow;
    }
  }

  void jumpToFirstPage() {
    pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}