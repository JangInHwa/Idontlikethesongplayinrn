import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Routes.DEV,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    ),
  );
}
