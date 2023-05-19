import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';
import 'package:i_dont_like_the_song_playin_rn/app/routes/pages.dart';

class SpaceItem extends StatelessWidget {
  final Space space;
  const SpaceItem(this.space, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.SPACE, arguments: {'space': space}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            space.name,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
