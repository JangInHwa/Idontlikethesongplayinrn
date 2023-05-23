import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/music_player/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_select_bottom_sheet.dart';

class SpacePageController extends GetxController {
  SongSuggestionsController songSuggestionsController = Get.find<SongSuggestionsController>();
  SpaceController spaceController = Get.find<SpaceController>();
  MusicPlayerController musicPlayerController = Get.find<MusicPlayerController>();

  @override
  void onInit() {
    songSuggestionsController.init().then(
      (_) {
        if (songSuggestionsController.songSuggestions.isNotEmpty) {
          musicPlayerController.play(songSuggestionsController.songSuggestions.first);
        }
      },
    );
    super.onInit();
  }

  Future openSongSelectSheet() async {
    HapticFeedback.selectionClick();
    SongSelectBottomSheetController controller = SongSelectBottomSheetController();
    SpotifySong? selectedSong = await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: Get.context!,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SongSelectBottomSheet(controller: controller),
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
        spotifyId: selectedSong.spotifyId,
      ),
    );
  }
}
