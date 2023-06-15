import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPageController extends GetxController {
  void onAuthStateChanged(AuthState authState) {
    if (authState.event == AuthChangeEvent.signedIn) {
      Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onInit() {
    Supabase.instance.client.auth.onAuthStateChange.listen(onAuthStateChanged);
    super.onInit();
  }
}
