import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/repository.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';

class SetProfilePageController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  ProfileController profileController = Get.find<ProfileController>();

  Rx<String> newProfileId = Rx('');

  Rx<bool> isCtaBtnEnabled = Rx(false);
  Rx<bool> idAlreadyExists = Rx(false);

  @override
  void onInit() {
    super.onInit();
    profileController.init();
    debounce(newProfileId, (callback) => checkIfIDAlreadyExixts(), time: const Duration(milliseconds: 500));
  }

  Future<void> checkIfIDAlreadyExixts() async {
    if (newProfileId.isEmpty) {
      return;
    }

    final ProfileRepository repository = ProfileRepository();
    final alreadyExists = await repository.profileIdAlreadyExtists(newProfileId.value);
    if (alreadyExists) {
      idAlreadyExists.value = true;
    } else {
      isCtaBtnEnabled.value = true;
    }
  }

  Future<void> setProfileId() async {
    await profileController.setProfileId(newProfileId.value);
    Get.offNamed(Routes.HOME);
  }

  Future<void> onCodeChange() async {
    newProfileId.value = textEditingController.text;

    isCtaBtnEnabled.value = false;
    idAlreadyExists.value = false;
  }
}
