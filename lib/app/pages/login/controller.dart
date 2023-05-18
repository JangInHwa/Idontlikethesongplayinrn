import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPageController extends GetxController {
  void onAuthStateChanged(AuthState authState) {
    if (authState.event == AuthChangeEvent.signedIn) {
      Get.back();
    }
  }

  @override
  void onInit() {
    Supabase.instance.client.auth.onAuthStateChange.listen(onAuthStateChanged);
    super.onInit();
  }
}
