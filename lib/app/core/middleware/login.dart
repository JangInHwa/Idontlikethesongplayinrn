import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginMiddleware extends GetMiddleware {
  LoginMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return Supabase.instance.client.auth.currentSession != null ? null : const RouteSettings(name: Routes.LOGIN);
  }
}
