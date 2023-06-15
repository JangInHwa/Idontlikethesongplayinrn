import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/profile/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_select_sheet.dart';

class SpacePageController extends GetxController {
  SpaceController spaceController = Get.find<SpaceController>();
  ProfileController profileController = Get.find<ProfileController>();

  Future openSongSelectSheet() async {
    HapticFeedback.selectionClick();
    SongSelectSheetController controller = SongSelectSheetController();
    SpotifySong? selectedSong = await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: Get.context!,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SongSelectSheet(controller: controller),
    );

    if (selectedSong == null) {
      return;
    }

    await spaceController.insertSuggestion(
      SuggestionBase(
        artist: selectedSong.artist,
        coverImage: selectedSong.coverImage,
        songTitle: selectedSong.name,
        spaceId: spaceController.space.id,
        spotifyId: selectedSong.spotifyId,
        suggestor: profileController.profile!,
      ),
    );
  }
}
