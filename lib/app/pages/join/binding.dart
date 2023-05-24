import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/join/controller.dart';

class JoinPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinPageController>(() => JoinPageController());
    Get.lazyPut<SpacesController>(() => SpacesController());
  }
}
