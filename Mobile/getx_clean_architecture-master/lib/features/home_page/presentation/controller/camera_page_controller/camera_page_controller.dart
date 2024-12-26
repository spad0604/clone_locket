// import 'package:camera/camera.dart';
import 'package:jbbase_app/base/base.dart';

class CameraPageController extends BaseController {
  // late CameraController cameraController;
  // late List<CameraDescription> cameras;
  RxBool isCameraInitialized = false.obs;

  @override
  void onInit() async {
    //await initializeCamera();
    super.onInit();
  }

  @override
  void dispose() {
    //cameraController.dispose();
    super.dispose();
  }

  // Future<void> initializeCamera() async {
  //   cameras = await availableCameras();
  //   if (cameras.isNotEmpty) {
  //     cameraController = CameraController(
  //       cameras[0],
  //       ResolutionPreset.high,
  //     );
  //     await cameraController.initialize();
  //     isCameraInitialized.value = true;
  //   }
  // }
}