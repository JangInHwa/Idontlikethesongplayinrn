import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_select_bottom_sheet.dart';

class SpacePageController extends GetxController {
  SongSuggestionsController songSuggestionsController = Get.find<SongSuggestionsController>();
  SpaceController spaceController = Get.find<SpaceController>();

  @override
  void onInit() {
    songSuggestionsController.init();
    super.onInit();
  }

  Future openSongSelectSheet() async {
    SpotifySong? selectedSong = await Get.bottomSheet(
      SongSelectBottomSheet(),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    if (selectedSong == null) {
      return;
    }

    await songSuggestionsController.insertSongSuggestion(
      SongSuggestionBase(
        artist: selectedSong.artist,
        coverImage: selectedSong.coverImage,
        songTitle: selectedSong.name,
        spaceId: spaceController.space.id,
        spotifyLink: selectedSong.spotifyLink,
      ),
    );
  }
}
