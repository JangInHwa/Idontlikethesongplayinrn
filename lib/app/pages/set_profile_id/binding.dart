import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/set_profile_id/controller.dart';

class SetProfileIDPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetProfilePageController>(() => SetProfilePageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
