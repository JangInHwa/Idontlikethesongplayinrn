import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_indicator.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/widgets/song_suggestion_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SpacePage extends GetView<SpacePageController> {
  const SpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff0A0C0F),
      appBar: AppBar(
        title: Text(controller.spaceController.space.name),
        backgroundColor: const Color(0xff0A0C0F),
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Obx(
                  () => ListView(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 100),
                    children: controller.songSuggestionsController.songSuggestions.map((e) => SongSuggestionItem(e)).toList().reversed.toList(),
                  ),
                ),
                Positioned.directional(top: 0, start: 12, end: 12, textDirection: TextDirection.ltr, child: SongIndicator()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF1B1D22),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: controller.openSongSelectSheet,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F3239),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.regular.magnifyingGlass,
                        color: Colors.white38,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          '제목, 아티스트, 앨범으로 검색',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
