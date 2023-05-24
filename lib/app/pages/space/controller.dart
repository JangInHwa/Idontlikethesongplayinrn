import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/music_player/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_select_bottom_sheet.dart';

class SpacePageController extends GetxController {
  SuggestionsController suggestionsController = Get.find<SuggestionsController>();
  SpaceController spaceController = Get.find<SpaceController>();
  MusicPlayerController musicPlayerController = Get.find<MusicPlayerController>();

  @override
  void onInit() {
    suggestionsController.init().then(
      (_) {
        if (suggestionsController.suggestions.isNotEmpty) {
          musicPlayerController.play(suggestionsController.suggestions.first);
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

    await suggestionsController.insertSuggestion(
      SuggestionBase(
        artist: selectedSong.artist,
        coverImage: selectedSong.coverImage,
        songTitle: selectedSong.name,
        spaceId: spaceController.space.id,
        spotifyId: selectedSong.spotifyId,
      ),
    );
  }

  Suggestion? getPrevSong() {
    if (musicPlayerController.currentSong == null) {
      return null;
    }
    int currentSongIndex = suggestionsController.getIndex(musicPlayerController.currentSong!);
    if (currentSongIndex == 0) {
      return null;
    }
    return suggestionsController.suggestions[currentSongIndex - 1];
  }

  Suggestion? getNextSong() {
    if (musicPlayerController.currentSong == null) {
      return null;
    }
    int currentSongIndex = suggestionsController.getIndex(musicPlayerController.currentSong!);
    if (currentSongIndex + 1 >= suggestionsController.suggestions.length) {
      return null;
    }
    return suggestionsController.suggestions[currentSongIndex + 1];
  }

  Future<void> toNextSong() async {
    Suggestion? nextSong = getNextSong();
    if (nextSong != null) {
      await musicPlayerController.play(nextSong);
    }
  }

  Future<void> toPrevSong() async {
    Suggestion? prevSong = getPrevSong();
    if (prevSong != null) {
      await musicPlayerController.play(prevSong);
    }
  }
}
