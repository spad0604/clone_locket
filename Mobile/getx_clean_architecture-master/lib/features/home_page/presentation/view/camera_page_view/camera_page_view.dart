// import 'package:camera/camera.dart';
import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/camera_page_controller/camera_page_controller.dart';

import '../home_page_view/home_page_view.dart';

class CameraPageView extends BaseGetView<CameraPageController> {
  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.blackBgr,
      body: SafeArea(
        child: SizedBox(
          height: Get.size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    circleAvatar(
                        url:
                            'https://avatars.githubusercontent.com/u/179314473?v=4',
                        isOnline: true),
                    CustomDropdown(),
                    circleAvatar(
                        url: Assets.images.chatIc.path, isOnline: false)
                  ],
                ),
              ),
              Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        height: Get.width,
                        width: double.infinity,
                        // child: controller.isCameraInitialized.value == true
                        //     ? CameraPreview(controller.cameraController)
                        child: SizedBox(
                                width: double.infinity,
                                height: Get.width,
                              ),
                      ))),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _listService(capture: null, flash: null, switchCamera: null),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Lịch sử',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listService(
      {required Function()? flash,
      required Function()? capture,
      required Function()? switchCamera}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () {
              flash!.call();
            },
            child: Assets.images.flashOnIc.image(
              height: 40,
              width: 40,
              color: Colors.white,
            )),
        CircleCapture(),
        GestureDetector(
          onTap: () {
            switchCamera!.call();
          },
          child: Assets.images.cameraIc.image(
            height: 40,
            width: 40,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class CircleCapture extends StatelessWidget {
  const CircleCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ColorName.yellow5b9),
        child: Center(
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: ColorName.blackBgr),
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
