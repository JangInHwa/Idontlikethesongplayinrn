import 'dart:developer';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPageController {
  Future loginWithGoogle() async {
    try {
      await Supabase.instance.client.auth.signOut();
      await Supabase.instance.client.auth.signInWithOAuth(
        Provider.google,
        authScreenLaunchMode: LaunchMode.externalApplication,
        redirectTo: 'com.uglyonlytoday.idontlikethesongplayinrn://login-callback/',
      );
      Get.back();
    } on AuthException catch (e) {
      log(e.toString());
    }
  }
}
