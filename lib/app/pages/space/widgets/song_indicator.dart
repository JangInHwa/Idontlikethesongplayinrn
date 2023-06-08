import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/music_player/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/suggestion/model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SongIndicatorBase extends StatelessWidget {
  final Suggestion? suggestion;
  final MusicPlayerController playerController = Get.find<MusicPlayerController>();

  SongIndicatorBase(this.suggestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: suggestion != null
              ? Image.network(
                  suggestion!.coverImage,
                  width: 72,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 72,
                  height: 72,
                  color: Colors.white24,
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '지금 재생중',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(height: 2),
                        suggestion != null
                            ? Text(
                                suggestion!.songTitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )
                            : Container(height: 16),
                        suggestion != null
                            ? Text(
                                suggestion!.artist,
                                style: const TextStyle(
                                  color: Colors.white60,
                                ),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )
                            : Container(height: 17),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Obx(
                    () {
                      Duration timeLeft;
                      if (playerController.state.value == ControllerState.success) {
                        timeLeft = playerController.playbackDuratoin.value! - playerController.playbackPosition.value!;
                      } else {
                        timeLeft = Duration.zero;
                      }
                      return Text(
                        '${timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0')}:${timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () {
                  if (playerController.state.value == ControllerState.success && playerController.playbackDuratoin.value!.inMilliseconds > 0) {
                    return PlaybackLine(value: playerController.playbackPosition.value!.inMilliseconds / playerController.playbackDuratoin.value!.inMilliseconds);
                  } else {
                    return const PlaybackLine(value: 0);
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PlaybackLine extends StatelessWidget {
  final double value;
  const PlaybackLine({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        color: Colors.white24,
        height: 4,
        child: FractionallySizedBox(
          alignment: Alignment.bottomLeft,
          widthFactor: value,
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SongIndicator extends StatelessWidget {
  final SpaceController spaceController = Get.find<SpaceController>();
  SongIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF2F3239),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 20),
      child: Obx(
        () => SongIndicatorBase(spaceController.currentPlayingSong),
      ),
    );
  }
}

class HostSongIndicator extends StatelessWidget {
  final MusicPlayerController playerController = Get.find<MusicPlayerController>();
  final SpaceController spaceController = Get.find<SpaceController>();
  HostSongIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF2F3239),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 16, left: 12, right: 20),
      child: Column(
        children: [
          Obx(() => SongIndicatorBase(playerController.currentSong)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Obx(
                  () {
                    playerController.currentSong;
                    return Icon(
                      color: spaceController.getPrevSong() == null ? Colors.white38 : Colors.white,
                      PhosphorIcons.fill.caretDoubleLeft,
                    );
                  },
                ),
                onTap: () {
                  Suggestion? prevSong = spaceController.getPrevSong();
                  if (prevSong != null) {
                    spaceController.toPrevSong();
                  }
                },
              ),
              const SizedBox(width: 40),
              GestureDetector(
                child: Obx(
                  () => Icon(
                    playerController.isPlaying.value ? PhosphorIcons.fill.pause : PhosphorIcons.fill.play,
                  ),
                ),
                onTap: () {
                  if (playerController.isPlaying.value) {
                    playerController.pause();
                  } else {
                    playerController.resume();
                  }
                },
              ),
              const SizedBox(width: 40),
              GestureDetector(
                child: Obx(
                  () {
                    playerController.currentSong;
                    return Icon(
                      color: spaceController.getNextSong() == null ? Colors.white38 : Colors.white,
                      PhosphorIcons.fill.caretDoubleRight,
                    );
                  },
                ),
                onTap: () {
                  Suggestion? nextSong = spaceController.getNextSong();
                  if (nextSong != null) {
                    spaceController.toNextSong();
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
