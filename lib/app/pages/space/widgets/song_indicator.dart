import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/core/enums/controller_state.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/music_player/controller.dart';

class SongIndicator extends StatelessWidget {
  final MusicPlayerController playerController = Get.find<MusicPlayerController>();
  SongIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF2F3239),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Obx(
              () {
                if (playerController.currentPlayingSong != null) {
                  return Image.network(
                    playerController.currentPlayingSong!.coverImage,
                    width: 72,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container(
                    width: 72,
                    height: 72,
                    color: Colors.white24,
                  );
                }
              },
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
                    Column(
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
                        Obx(
                          () {
                            if (playerController.currentPlayingSong != null) {
                              return Text(
                                playerController.currentPlayingSong!.songTitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            } else {
                              return Container(height: 16);
                            }
                          },
                        ),
                        Obx(
                          () {
                            if (playerController.currentPlayingSong != null) {
                              return Text(
                                playerController.currentPlayingSong!.artist,
                                style: const TextStyle(
                                  color: Colors.white60,
                                ),
                              );
                            } else {
                              return Container(height: 17);
                            }
                          },
                        ),
                      ],
                    ),
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
                    if (playerController.state.value == ControllerState.success) {
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
      ),
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
