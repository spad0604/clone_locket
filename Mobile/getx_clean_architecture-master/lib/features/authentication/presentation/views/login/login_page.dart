import 'package:jbbase_app/base/presentation/presentation.dart';

import '../../controllers/login/login_controller.dart';

class LoginPage extends BaseGetView<LoginController> {
  @override
  Widget myBuild(BuildContext context) {
    return GestureDetector(
      onTap: controller.hideKeyboard,
      child: Scaffold(
          backgroundColor: ColorName.blackBgr,
          body: SafeArea(
            child: Container(
              height: Get.height,
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "What's your account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: 15,),
                    CustomTextFeild(
                      textEditingController:
                          controller.emailTextEditingController,
                      hintText: 'Enter your account',
                      isPassword: false,
                      isHidePassword: false,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => CustomTextFeild(
                        isHidePassword: controller.isHidePassword.value,
                        textEditingController:
                            controller.passwordTextEditingController,
                        hintText: 'Enter your password',
                        isPassword: true,
                        func: () {
                          controller.isHidePassword.value = !controller.isHidePassword.value;
                        },
                      ),
                    ),
                    const SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        controller.onTapContinue();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: ColorName.yellow5b9
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  color: ColorName.blackBgr,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                )
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: ColorName.blackBgr,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  bool isPassword;
  bool isHidePassword;
  Function()? func;
  CustomTextFeild(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.isPassword,
      required this.isHidePassword,
      this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: ColorName.gray343),
      child: Center(
        child: TextField(
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          obscureText: isHidePassword,
          controller: textEditingController,
          decoration: InputDecoration(
              suffixIcon: isPassword == true ? GestureDetector(
                onTap: (){
                  func?.call();
                },
                child: Icon(
                  isHidePassword == false ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              ) : null,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              hintStyle:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
