import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/home/widget/space_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0C0F),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF0A0C0F),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 4 / 5,
            ),
            itemCount: controller.spacesController.spaces.length,
            itemBuilder: (context, index) {
              return SpaceItem(controller.spacesController.spaces[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: 0,
        backgroundColor: const Color(0xFF0A0C0F),
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {},
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(
              PhosphorIcons.fill.rows,
              color: Colors.white,
            ),
            label: 'Commute',
          ),
          NavigationDestination(
            icon: Icon(
              PhosphorIcons.bold.user,
              color: Colors.white24,
            ),
            label: 'Commute',
          ),
        ],
      ),
    );
  }
}
