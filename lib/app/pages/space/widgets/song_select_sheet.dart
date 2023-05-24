import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/spotify_song/repository.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_search_item.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_search_textfield.dart';

class SongSelectSheet extends StatelessWidget {
  final SongSelectSheetController controller;
  SongSelectSheet({
    super.key,
    SongSelectSheetController? controller,
  }) : controller = controller ?? SongSelectSheetController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      maxChildSize: 0.8,
      minChildSize: 0.2,
      snapAnimationDuration: const Duration(milliseconds: 200),
      snapSizes: const [0.8],
      snap: true,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1B1D22),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                child: SongSearchTextField(
                  controller: controller.searchTextFieldController,
                  onSubmitted: controller.searchSpotify,
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (notification) {
                    FocusManager.instance.primaryFocus?.unfocus();

                    return true;
                  },
                  child: Obx(
                    () => ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      itemCount: controller.songList.length,
                      itemBuilder: (context, index) {
                        return SongSearchItem(
                          controller.songList[index],
                          onTap: (song) => Get.back(result: song),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SongSelectSheetController extends GetxController {
  TextEditingController searchTextFieldController = TextEditingController();
  SpotifyRepository spotifyRepository = SpotifyRepository();
  final Rx<List<SpotifySong>> _songList = Rx([]);
  List<SpotifySong> get songList => _songList.value;

  Future searchSpotify(String keyword) async {
    _songList.value = await spotifyRepository.searchSong(keyword);
    _songList.refresh();
  }
}
