import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<SpacesController>(() => SpacesController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
