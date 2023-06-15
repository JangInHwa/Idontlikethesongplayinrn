import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/music_player/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_select_sheet.dart';

class SpacePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpacePageController>(() => SpacePageController());
    Get.lazyPut<SuggestionsController>(() => SuggestionsController(Get.arguments['space']));
    Get.lazyPut<SpaceController>(() => SpaceController(Get.arguments['space']));
    Get.put<MusicPlayerController>(MusicPlayerController());
    Get.lazyPut<SongSelectSheetController>(() => SongSelectSheetController());
  }
}
