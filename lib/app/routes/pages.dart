import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/dev/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.DEV, page: () => const DevPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginPageBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomePageBinding()),
  ];
}
