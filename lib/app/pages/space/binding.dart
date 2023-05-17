import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/controller.dart';

class SpacePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpacePageController>(() => SpacePageController());
    Get.lazyPut<SongSuggestionsController>(() => SongSuggestionsController(Get.arguments['space']));
    Get.lazyPut<SpaceController>(() => SpaceController(Get.arguments['space']));
  }
}
