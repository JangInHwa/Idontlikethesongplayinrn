import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';

abstract class BaseController extends GetxController {
  final Rx<ControllerState> state = Rx(ControllerState.loading);
}
