import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/base/base_controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/song_suggestion/model.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class MusicPlayerController extends BaseController with GetSingleTickerProviderStateMixin {
  final Rx<SongSuggestion?> _currrentPlayingSong = Rx(null);
  SongSuggestion? get currentPlayingSong => _currrentPlayingSong.value;

  final Rx<Duration?> playbackPosition = Rx(null);
  final Rx<Duration?> playbackDuratoin = Rx(null);
  late final AnimationController _playBackLineAnimation = AnimationController(vsync: this);

  DateTime lastEventOccured = DateTime.now();

  @override
  void onInit() {
    SpotifySdk.subscribePlayerState().listen((playerState) {
      if (playerState.track != null) {
        state.value = ControllerState.success;
      } else {
        state.value = ControllerState.loading;
      }

      playbackDuratoin.value = Duration(milliseconds: playerState.track!.duration);
      _playBackLineAnimation.duration = Duration(milliseconds: playerState.track!.duration);
      _playBackLineAnimation.value = playerState.playbackPosition / playerState.track!.duration;
      if (playerState.isPaused) {
        _playBackLineAnimation.stop();
      } else {
        _playBackLineAnimation.forward();
      }
      lastEventOccured = DateTime.now();
    });

    _playBackLineAnimation.addListener(() {
      playbackPosition.value = Duration(milliseconds: (_playBackLineAnimation.value * playbackDuratoin.value!.inMilliseconds).floor());
    });

    super.onInit();
  }

  Future play(SongSuggestion song) async {
    await SpotifySdk.play(spotifyUri: 'spotify:track:${song.spotifyId}');
    _currrentPlayingSong.value = song;
  }

  @override
  void onClose() {
    _playBackLineAnimation.dispose();
    super.onClose();
  }
}
