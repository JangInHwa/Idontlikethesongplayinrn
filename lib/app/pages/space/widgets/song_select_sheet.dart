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
  }) : controller = controller ?? Get.find<SongSelectSheetController>();

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
                  onChanged: (p0) => controller.onTextChanged(),
                  controller: controller.searchTextFieldController,
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
  Rx<String> q = Rx('');

  @override
  void onInit() {
    super.onInit();
    interval(q, (callback) => searchSpotify(), time: const Duration(milliseconds: 500));
  }

  void onTextChanged() {
    q.value = searchTextFieldController.text;
    if (q.value == '') {
      _songList.value = [];
    }
  }

  Future searchSpotify() async {
    if (q.value == '') {
      return;
    }
    _songList.value = await spotifyRepository.searchSong(q.value);
    _songList.refresh();
  }
}
