import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/repository.dart';

class ProfileController extends BaseController {
  final ProfileRepository repository;

  final Rx<Profile?> _profile = Rx(null);

  Profile? get profile => _profile.value;

  ProfileController({
    ProfileRepository? repository,
  }) : repository = repository ?? ProfileRepository();

  Future<ProfileController> init() async {
    _profile.value = await repository.get();
    state.value = ControllerState.success;
    return this;
  }

  Future<void> setProfileId(String profileId) async {
    await repository.setProfileId(profile!.id, profileId);
    _profile.value = Profile(id: profile!.id, profileId: profileId);
  }
}
