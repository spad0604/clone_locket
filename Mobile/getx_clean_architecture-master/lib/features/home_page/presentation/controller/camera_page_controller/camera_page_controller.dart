import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/authentication/authentication.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/upload_image_message_uc.dart';
import 'package:jbbase_app/features/authentication/domain/usecases/general/upload_image_uc.dart';
import 'package:jbbase_app/features/home_page/data/model/response_status.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';
import 'package:path_provider/path_provider.dart';

class CameraPageController extends BaseController {
  final UploadImageUseCase uploadImageUseCase = Get.find();

  final HomePageController homePageController = Get.find();

  final UploadImageMessageUseCase uploadImageMessageUseCase = Get.find();

  TextEditingController message = TextEditingController();

  late CameraController cameraController;
  late List<CameraDescription> cameras;
  RxBool isCameraInitialized = false.obs;
  RxBool isFlashOn = false.obs;
  int selectedCameraIndex = 0;

  RxBool isSending = false.obs;

  RxString imagePath = ''.obs;

  RxBool isCapture = false.obs;

  Rxn<StatusResponse> uploadStatusResponse = Rxn();

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
        selectedCameraIndex =
            (selectedCameraIndex + 1) % filteredCameras.length;

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
    if (!cameraController.value.isInitialized ||
        cameraController.value.isTakingPicture) return;

    try {
      if (isFlashOn.value) {
        await cameraController.setFlashMode(FlashMode.torch);
      } else {
        await cameraController.setFlashMode(FlashMode.off);
      }

      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      final XFile picture = await cameraController.takePicture();
      final file = File(picture.path);

      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        file.path,
        filePath,
        quality: 100,
      );

      imagePath.value = compressedImage!.path;

      await cameraController.setFlashMode(FlashMode.off);

      isCapture.value = true;
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> uploadImage() async {
    isSending.value = true;
    final imageFile = File(imagePath.value);

    uploadStatusResponse.value = await uploadImageUseCase.build(imageFile);

    final request = UploadImageMessage(
        id: int.parse(uploadStatusResponse.value!.message ?? '1'),
        message: message.text);

    await uploadImageMessageUseCase.build(request);

    await homePageController.getHistory();

    isCapture.value = false;

    isSending.value = false;
  }
}
