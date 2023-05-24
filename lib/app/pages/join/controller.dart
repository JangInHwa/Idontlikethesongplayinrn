import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/repository.dart';

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

    final res = await SpaceRepository().getWithJoinCode(code);

    if (res == null) {
      noSpaceFoundMessageEnabled.value = true;
      return;
    }
    if (spacesController.spaces.any((e) => e.id == res!.id)) {
      alreadyJoinedMessageEnabled.value = true;
      return;
    }
    resSpace.value = res;
    isCtaBtnEnabled.value = true;
  }

  Future<void> joinSpace(Space space) async {
    await spacesController.joinSpace(space);
    Get.back();
  }
}
