import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';

class HomePageController extends GetxController {
  SpacesController spacesController = Get.find<SpacesController>();

  @override
  void onInit() {
    spacesController.init();
    super.onInit();
  }
}
