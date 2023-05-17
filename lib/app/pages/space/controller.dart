import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/controller.dart';

class SpacePageController extends GetxController {
  SongSuggestionsController songSuggestionsController = Get.find<SongSuggestionsController>();

  @override
  void onInit() {
    songSuggestionsController.init();
    super.onInit();
  }
}
