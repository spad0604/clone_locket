import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jbbase_app/base/presentation/presentation.dart';

import '../../../domain/domain.dart';

class LoginController extends BaseController {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final isHidePassword = true.obs;
  final isDisableButton = true.obs;

  final LoginWithEmailUseCase _loginWithEmailUseCase;

  LoginController(this._loginWithEmailUseCase);

  @override
  void onInit() {
    super.onInit();
    emailTextEditingController.addListener(checkActiveButton);
    passwordTextEditingController.addListener(checkActiveButton);
  }

  void checkActiveButton() {
    if(emailTextEditingController.text.isEmpty || passwordTextEditingController.text.isEmpty) {
      isDisableButton.value = true;
    } else {
      isDisableButton.value = false;
    }
  }

  void onTapContinue() async{
    EmailPasswordRequest request = EmailPasswordRequest(emailTextEditingController.text, passwordTextEditingController.text);
    try {
      EasyLoading.show(status: 'Loading...');
      await _loginWithEmailUseCase.build(request);
      N.toHomeRootPage();
      EasyLoading.dismiss();
    } catch(e) {
      rethrow;
    }
  }
}
