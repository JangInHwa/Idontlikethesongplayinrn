import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/repository.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  Future f() async {
    final data = await SpotifyRepository().searchSong('Watch The Throne');
    for (var song in data) {
      print(song.name + ' - ' + song.artist);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dev Page'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: f,
            child: Text('Hit!!'),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            child: Text(Routes.LOGIN),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            child: Text(Routes.HOME),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.SPACE),
            child: Text(Routes.SPACE),
          ),
        ],
      ),
    );
  }
}
