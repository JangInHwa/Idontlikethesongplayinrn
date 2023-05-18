import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/repository.dart';

class SongSelectBottomSheet extends StatelessWidget {
  final SongSelectBottomSheetController controller;
  SongSelectBottomSheet({
    super.key,
    SongSelectBottomSheetController? controller,
  }) : controller = controller ?? SongSelectBottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            onSubmitted: controller.searchSpotify,
            controller: controller.searchTextFieldController,
          ),
          SizedBox(
            height: 400,
            child: Obx(
              () => ListView.builder(
                itemCount: controller.songList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(controller.songList[index].coverImage),
                    title: Text(controller.songList[index].name),
                    subtitle: Text(controller.songList[index].artist),
                    onTap: () => Get.back(result: controller.songList[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongSelectBottomSheetController extends GetxController {
  TextEditingController searchTextFieldController = TextEditingController();
  SpotifyRepository spotifyRepository = SpotifyRepository();
  Rx<List<SpotifySong>> _songList = Rx([]);
  List<SpotifySong> get songList => _songList.value;

  Future searchSpotify(String keyword) async {
    _songList.value = await spotifyRepository.searchSong(keyword);
    print(_songList);
    _songList.refresh();
  }
}
