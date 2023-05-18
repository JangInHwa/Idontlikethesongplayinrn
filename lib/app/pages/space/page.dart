import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/space/controller.dart';

class SpacePage extends GetView<SpacePageController> {
  const SpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Space')),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.songSuggestionsController.songSuggestions.length,
                itemBuilder: (context, index) {
                  return TextButton(onPressed: () {}, child: Text(controller.songSuggestionsController.songSuggestions[index].songTitle));
                },
              ),
            ),
          ),
          TextButton(
            onPressed: controller.openSongSelectSheet,
            child: Text('add song'),
          ),
        ],
      ),
    );
  }
}
