import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Supabase.initialize(
    url: 'https://mgtmarhdqhaxjiviwpgc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ndG1hcmhkcWhheGppdml3cGdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQxNDA4ODUsImV4cCI6MTk5OTcxNjg4NX0.xaxQEl_SImGW-FIzInac_6C6bx5Eg5lvk50-WFhO-_g',
    authCallbackUrlHostname: 'login-callback',
  );

  FlutterNativeSplash.remove();

  runApp(
    GetMaterialApp(
      initialRoute: Routes.DEV,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Pretendard'),
    ),
  );
}
