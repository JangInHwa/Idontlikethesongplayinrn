import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.DEV,
      page: () => const DevPage(),
    )
  ];
}
