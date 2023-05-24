import 'package:flutter/widgets.dart';
import 'package:i_dont_like_the_song_playin_rn/app/data/modules/space/model.dart';

class SpaceTipChip extends StatelessWidget {
  final Space space;
  const SpaceTipChip({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        space.name,
        style: const TextStyle(
          height: 1.3,
          color: Color.fromRGBO(255, 255, 255, 0.8),
        ),
      ),
    );
  }
}
