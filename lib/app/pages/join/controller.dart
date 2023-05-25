import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/repository.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';

class JoinPageController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  SpacesController spacesController = Get.find<SpacesController>();

  Rx<bool> isCtaBtnEnabled = Rx(false);
  Rx<bool> noSpaceFoundMessageEnabled = Rx(false);
  Rx<bool> alreadyJoinedMessageEnabled = Rx(false);
  Rx<Space?> resSpace = Rx(null);

  Future<void> onCodeChange() async {
    final String code = textEditingController.text.toUpperCase();

    isCtaBtnEnabled.value = false;
    noSpaceFoundMessageEnabled.value = false;
    alreadyJoinedMessageEnabled.value = false;
    resSpace.value = null;

    if (code.length < 6) {
      return;
    }

    resSpace.value = await SpaceRepository().getWithJoinCode(code);

    if (resSpace.value == null) {
      noSpaceFoundMessageEnabled.value = true;
      return;
    }
    if (spacesController.spaces.any((e) => e.id == resSpace.value!.id)) {
      alreadyJoinedMessageEnabled.value = true;
      return;
    }
    isCtaBtnEnabled.value = true;
  }

  Future<void> joinSpace(Space space) async {
    await spacesController.joinSpace(space);
    Get.offNamed(Routes.SPACE, arguments: {'space': space});
  }
}
