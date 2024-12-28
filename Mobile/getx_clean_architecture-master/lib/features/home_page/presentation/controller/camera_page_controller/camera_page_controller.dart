import 'dart:io';
import 'package:camera/camera.dart';
import 'package:jbbase_app/base/base.dart';
import 'package:path_provider/path_provider.dart';

class CameraPageController extends BaseController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  RxBool isCameraInitialized = false.obs;
  RxBool isFlashOn = false.obs;
  int selectedCameraIndex = 0;

  @override
  void onInit() async {
    await initializeCamera();
    super.onInit();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      selectedCameraIndex = 0;
      await setCamera(selectedCameraIndex);
    }
  }

  Future<void> setCamera(int index) async {
    cameraController = CameraController(
      cameras[index],
      ResolutionPreset.high,
    );
    await cameraController.initialize();
    isCameraInitialized.value = true;
  }

  void switchCamera() async {
    try {
      final List<CameraDescription> filteredCameras = cameras.where((camera) {
        return camera.lensDirection == CameraLensDirection.back ||
            camera.lensDirection == CameraLensDirection.front;
      }).toList();

      if (filteredCameras.length > 1) {
        selectedCameraIndex = (selectedCameraIndex + 1) % filteredCameras.length;

        await cameraController.dispose();

        isCameraInitialized.value = false;

        cameraController = CameraController(
          filteredCameras[selectedCameraIndex],
          ResolutionPreset.high,
        );

        await cameraController.initialize();

        isCameraInitialized.value = true;
      } else {
        print("Chỉ có một camera trên thiết bị này.");
      }
    } catch (e) {
      print("Lỗi khi chuyển camera: $e");
      isCameraInitialized.value = false;
    }
  }


  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
  }

  Future<void> takePicture() async {
    if (!cameraController.value.isInitialized || cameraController.value.isTakingPicture) return;

    try {
      if (isFlashOn.value) {
        await cameraController.setFlashMode(FlashMode.torch);
      } else {
        await cameraController.setFlashMode(FlashMode.off);
      }

      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      final XFile picture = await cameraController.takePicture();
      await picture.saveTo(filePath);
      print('Picture saved to $filePath');

      await cameraController.setFlashMode(FlashMode.off);
    } catch (e) {
      print('Error taking picture: $e');
    }
  }
}
