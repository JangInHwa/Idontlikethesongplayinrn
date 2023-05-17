import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginPageController>(LoginPageController());
  }
}
