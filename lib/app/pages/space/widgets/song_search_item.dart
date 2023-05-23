import 'package:flutter/material.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';

class SongSearchItem extends StatelessWidget {
  final SpotifySong song;
  final void Function(SpotifySong song)? onTap;
  const SongSearchItem(this.song, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(song);
        }
      },
      child: Container(
        color: const Color(0xFF1B1D22),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(song.coverImage, width: 48),
            ),
            const SizedBox(width: 16),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  song.artist,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
