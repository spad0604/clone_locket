import 'package:camera/camera.dart';
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
                  child: Obx(
                    () => SizedBox(
                      height: Get.width,
                      width: Get.width,
                      child: controller.isCameraInitialized.value
                          ? Transform.scale(
                        scale: 1.0,
                        child: AspectRatio(
                          aspectRatio: controller.cameraController.value.aspectRatio,
                          child: OverflowBox(
                            alignment: Alignment.center,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: Get.size.width,
                                height: Get.size.width / controller.cameraController.value.aspectRatio,
                                child: Stack(children: [CameraPreview(controller.cameraController)]),
                              ),
                            ),
                          ),
                        ),
                      )
                      : SizedBox(
                              width: Get.width,
                              height: Get.width,
                            ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _listService(
                      capture: controller.takePicture,
                      flash: controller.toggleFlash,
                      switchCamera: controller.switchCamera),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Lịch sử',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Icon(
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
            onTap: () async {
              await flash!.call();
            },
            child: Obx(
              () => controller.isFlashOn.value == true
                  ? Assets.images.flashOnIc.image(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                    )
                  : Assets.images.flashOffIc.image(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                    ),
            )),
        CircleCapture(capture: () async{ await capture!.call();},),
        GestureDetector(
          onTap: () async {
            await switchCamera!.call();
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
  final Function()? capture;

  const CircleCapture({super.key, this.capture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await capture!.call();
      },
      child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorName.yellow5b9),
          child: Center(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: ColorName.blackBgr),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                ),
              ),
            ),
          )),
    );
  }
}
