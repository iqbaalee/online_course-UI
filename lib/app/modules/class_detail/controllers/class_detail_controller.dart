import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ClassDetailController extends GetxController {
  late VideoPlayerController videoPlayerController;
  final isOnVolume = true.obs;
  final isPlaying = true.obs;
  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        videoPlayerController.play();
        update();
      });
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void changeStatusVolume() {
    isOnVolume.value = !isOnVolume.value;
  }

  void changeStatusPlay() {
    isPlaying.value = !isPlaying.value;
  }
}
