import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ClassDetailController extends GetxController {
  late VideoPlayerController videoPlayerController;
  final isOnVolume = true.obs;
  final isPlaying = true.obs;
  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        isLoading(false);
        videoPlayerController.play();
        update();
      });

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        isPlaying.value = false;
      }
    });
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void changeStatusVolume() {
    isOnVolume.value = !isOnVolume.value;
    videoPlayerController.setVolume(isOnVolume.value ? 1 : 0);
  }

  void changeStatusPlay() {
    isPlaying.value
        ? videoPlayerController.play()
        : videoPlayerController.pause();
    isPlaying.value = !isPlaying.value;
  }
}
