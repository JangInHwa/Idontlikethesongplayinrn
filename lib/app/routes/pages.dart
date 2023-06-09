import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/middleware/login.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/dev/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/join/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/join/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/set_profile_id/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/set_profile_id/page.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/binding.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.DEV, page: () => const DevPage()),
    GetPage(name: Routes.LOGIN, page: () => const LogInPage(), binding: LoginPageBinding()),
    GetPage(name: Routes.HOME, page: () => const HomePage(), binding: HomePageBinding(), middlewares: [LoginMiddleware()]),
    GetPage(name: Routes.SPACE, page: () => const SpacePage(), binding: SpacePageBinding(), middlewares: [LoginMiddleware()]),
    GetPage(name: Routes.JOIN, page: () => const JoinPage(), binding: JoinPageBinding(), middlewares: [LoginMiddleware()]),
    GetPage(name: Routes.SETPROFILEID, page: () => const SetProfileIDPage(), binding: SetProfileIDPageBinding(), middlewares: [LoginMiddleware()]),
  ];
}
