import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.spacesController.spaces.length,
          itemBuilder: (context, index) {
            return TextButton(onPressed: () {}, child: Text(controller.spacesController.spaces[index].name));
          },
        ),
      ),
    );
  }
}
